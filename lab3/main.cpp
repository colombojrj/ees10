#include <iostream>
#include <dac.hpp>

#include <chrono>
#include <thread>
using namespace std::chrono_literals;

#include <Eigen/Core>
#include <MATio>
using namespace Eigen;

#define INPUT_FILE  "../lab3/dados/u20deg.mat"
#define OUTPUT_FILE "../lab3/dados/data_u20deg.mat"

// Experiment configuration
constexpr double Ts = 0.020;
constexpr double KENC = -2 * 3.1415 / 8000;
volatile bool running;
MatrixXd u, y;
unsigned int index;

double getStationaryControl(const double yss)
{
	return 37.61 * yss + 0.4558;
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

void onDataReceive()
{
	if (index < u.size()) // check if the control task has ended
	{
		// Read sensor
		double angularPosition = KENC * board->encoderRead(1);
		y(index) = angularPosition;

		// Apply control
		board->pwmSetDuty(CH1, toDuty(u(index)));
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
		// Load the input signal
		matio::read_mat(INPUT_FILE, "r_step10", u);
		y.resize(u.size(), 1);
		index = 0;

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

		// Enable the auto read feature making the board to be sending data every 20 ms
		running = true;
		board->enableAutoRead(Ts, onDataReceive);

		while (running)
		{
			std::this_thread::sleep_for(20ms);
		}

		// Disable ESC power
		board->disableAutoRead();
		board->pwmSetDuty(CH1, 0.4);      // 1040 us
		std::this_thread::sleep_for(2s);
		board->digitalWrite(CH1, LOW);
		board->pwmSetDuty(CH1, 0.0);

		// Create a matlab file with data
		matio::MatioFile matlab_file(OUTPUT_FILE);
		matlab_file.write_mat("u", u.cast<double>());
		matlab_file.write_mat("y", y.cast<double>());
		MatrixXd TsAsMatrix{ {Ts} };
		matlab_file.write_mat("Ts", TsAsMatrix.cast<double>());
	}
	else
	{
		std::cout << "Deu ruim" << std::endl;
	}

	return 0;
}
