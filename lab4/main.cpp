// If you are testing this code, then define the SIMULATION.
// If you want to run an experiment with the real system, then comment the following line.
#define SIMULATION

#include <iostream>
#include <math.h>

#include <boost/numeric/odeint/stepper/runge_kutta4.hpp>
#include <boost/numeric/odeint/integrate/integrate_const.hpp>
using namespace boost::numeric::odeint;
typedef std::vector<double> state_type;
runge_kutta4<state_type> rk4;

#include <chrono>
#include <thread>
using namespace std::chrono_literals;

#include <Eigen/Core>
#include <MATio>
using namespace Eigen;

#define INPUT_FILE  "../lab4/step10.mat"
#define OUTPUT_FILE "../lab4/data.mat"

// Experiment configuration
constexpr double Ts = 0.010;
constexpr double KENC = -2.0 * 3.1415 / 8000.0;
volatile bool running;
MatrixXd u_log, y_log, r;
unsigned int index;
constexpr double Kp       = 10;
constexpr double Kf       = 36.6;
constexpr double thetaBar = 0.2618; // 15º
// PID variables
MatrixXd Apid, Bpid, Cpid, Dpid, xpid, errorPid;

#if defined(SIMULATION)
constexpr double alpha = 20.7;
constexpr double beta = 1.27;
constexpr double gamma = 0.53;

#include "opendac_definitions.hpp"

class Dac {
public:
	Dac(const std::string& boardAddress, bool AutoSync = true, unsigned int timeoutMs = 3, unsigned int maxRetries = 2)
	{
		(void)boardAddress;
		(void)AutoSync;
		(void)timeoutMs;
		(void)maxRetries;
		x = state_type(2);
		enabled = false;
		x[0] = 0.0;
		x[1] = 0.0;
	}

	int encoderRead(unsigned int encoderNumber)
	{
		(void)encoderNumber;
		return static_cast<int>(x[0] / KENC);
	}

	void pwmSetDuty(Channel channel, double duty)
	{
		if (enabled)
		{
			u = duty;

			auto nonLinearEdo = std::bind(
				&Dac::edoAeropendulumNonLinear,
				this,
				std::placeholders::_1, // const state_type& x 
				std::placeholders::_2, // state_type& dx
				std::placeholders::_3  // const double t
			);

			integrate_const( rk4, nonLinearEdo, x, 0.0, Ts, 0.001 );
		}
	}

	bool isConnected()
	{
		return true;
	}

	void pwmSetFrequency(double freqInHz)
	{
		(void)freqInHz;
	}

	void encoderSetResolution(unsigned int encoderNumber, EncoderResolution resolution)
	{
		(void)encoderNumber;
		(void)resolution;
	}

	void enableAutoRead(double periodSecs, std::function<void(void)> function = nullptr)
	{
		(void)periodSecs;
		enabled = true;
		x[0] = 0.0;
		x[1] = 0.0;
		callback = function;
	}

	void disableAutoRead()
	{
		enabled = false;
	}

	void digitalWrite(Channel channel, PinState state)
	{
		(void)channel;
		(void)state;
}

private:
	std::function<void(void)> callback;
	state_type x;
	bool enabled;
	double u;

	void edoAeropendulumNonLinear(const state_type& state, state_type& dstate, const double t)
	{
		(void)t;

		// Make sure 0 <= u <= 100
		u = std::min(u, 100.0);
		u = std::max(u, 0.0);

		dstate[0] = state[1];  // Angular position derivative is the angular velocity.
		dstate[1] = -alpha * sin(state[0]) - beta * state[1] + gamma * u;
	}
};
#else
#include <dac.hpp>
#endif

double getStationaryControl(const double yss)
{
	return 37.61 * yss + 0.46;
}

Dac* board;

double toDuty(const double number)
{
	const double us = 1040 + 9.6 * number;
	double d = (400.0 / 1000000.0) * us;
	d = std::min(0.8, d);
	d = std::max(0.0, d);
	return d;
}

void edoPid(const state_type& v, state_type& dv, const double t)
{
	(void)t;       // Unused argument.

	// Create a VectorXd from the std::vector (state_type) almost without overhead
	VectorXd dx = VectorXd::Map(&dv[0], 2);
	VectorXd x = VectorXd::Map(&v[0], 2);

	// Calculate the EDO
	dx = Apid * x + Bpid * errorPid;
}

void onDataReceive()
{
	if (index < r.size()) // check if the control task has ended
	{
		// Read sensor
		y_log(index) = KENC * board->encoderRead(1);

		// Calculate control
		errorPid(0) = r(index) - y_log(index);
		std::vector<double> xpidAsStdVector(xpid.data(), xpid.data() + xpid.size());  // https://stackoverflow.com/questions/26094379/typecasting-eigenvectorxd-to-stdvector
		integrate_const(rk4, edoPid, xpidAsStdVector, 0.0, Ts, 0.001);
		u_log(index) = (Cpid * xpid + Dpid * errorPid)(0) + getStationaryControl(thetaBar);

		// Apply control
#ifdef SIMULATION
		board->pwmSetDuty(CH1, u_log(index));
#else
		board->pwmSetDuty(CH1, toDuty(u_log(index)));
#endif
		index = index + 1;
	}
	else
	{
		running = false;
	}
}

int main()
{
	// Board instatiation
	board = new Dac("COM9");

	if (board->isConnected())
	{
		// Load and initialize variables
		matio::read_mat(INPUT_FILE, "r", r);
		matio::read_mat(INPUT_FILE, "Apid1", Apid);
		matio::read_mat(INPUT_FILE, "Bpid1", Bpid);
		matio::read_mat(INPUT_FILE, "Cpid1", Cpid);
		matio::read_mat(INPUT_FILE, "Dpid1", Dpid);
		u_log.resize(r.size(), 1);
		y_log.resize(r.size(), 1);
		xpid.resize(Apid.rows(), 1);
		xpid.setZero();  // initialize this vector with zeros
		errorPid.resize(1, 1);
		index = 0;

#ifndef SIMULATION
		// Hardware configuration
		board->pwmSetFrequency(400.0);
		board->encoderSetResolution(1, EncoderResolution::HighResolution);

		// Enable ESC power
		board->pwmSetDuty(CH1, 0.0);
		board->digitalWrite(CH1, HIGH);
		std::this_thread::sleep_for(1s);

		// ESC startup procedure
		board->pwmSetDuty(CH1, 0.8);      // 2000 us
		std::this_thread::sleep_for(2s);
		board->pwmSetDuty(CH1, 0.0);      // 0 us
		std::this_thread::sleep_for(4s);
		board->pwmSetDuty(CH1, 0.416);    // 1040 us
		std::this_thread::sleep_for(4s);
		board->encoderReset(1);
#endif

		// Enable the auto read feature making the board to be sending data every 20 ms
		running = true;
		board->enableAutoRead(Ts, onDataReceive);

		while (running)
		{
#if defined(SIMULATION)
			onDataReceive();
#else
			std::this_thread::sleep_for(20ms);
#endif
		}

		// Disable ESC power
		board->disableAutoRead();
		board->pwmSetDuty(CH1, 0.4);      // 1040 us
		std::this_thread::sleep_for(2s);
		board->digitalWrite(CH1, LOW);
		board->pwmSetDuty(CH1, 0.0);

		// Create a matlab file with data
		matio::MatioFile matlab_file(OUTPUT_FILE);
		matlab_file.write_mat("u", u_log.cast<double>());
		matlab_file.write_mat("y", y_log.cast<double>());
		matlab_file.write_mat("r", r.cast<double>());
		MatrixXd TsAsMatrix{ {Ts} };
		matlab_file.write_mat("Ts", TsAsMatrix.cast<double>());
	}
	else
	{
		std::cout << "Deu ruim" << std::endl;
	}

	return 0;
}
