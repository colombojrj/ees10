// Matrix library. you may find documentation in the link below:
// https://eigen.tuxfamily.org/dox/GettingStarted.html
// https://eigen.tuxfamily.org/dox/group__QuickRefPage.html
#include <Eigen/Dense>
using namespace Eigen;

// Runge Kutta implementation. You may find documentation in the link below:
// https://www.boost.org/doc/libs/1_82_0/libs/numeric/odeint/doc/html/index.html
#include <boost/numeric/odeint/stepper/runge_kutta4.hpp>
#include <boost/numeric/odeint/integrate/integrate_const.hpp>
using namespace boost::numeric::odeint;
typedef std::vector<double> state_type;
runge_kutta4<state_type> rk4;

// The MATio library is used to load matlab files. You may find documentation in the link below:
// https://github.com/tesch1/eigen-matio
#include <MATio>

/*
 * The sample time Ts is defined as the time intervals between reading data from the system.
 * In our case, it is 20 ms.
 */
const double Ts = 0.020;

/*
 * This represents the control variable. It must be a number between 0 and 100 (%).
 * It is kept constant between intervals of Ts ms.
 */
double u;

/*
 * Aeropendulum parameters.
 */
double alpha;
double beta;
double gamma;

/*
 * This function defines the aeropendulum nonlinear ODE.
 */
void edoAeropendulumNonLinear(const state_type& x, state_type& dx, const double t)
{
    (void)t;       // Unused argument.

    // Make sure 0 <= u <= 100
    u = std::min(u, 100.0);
    u = std::max(u,   0.0);

    dx[0] = x[1];  // Angular position derivative is the angular velocity.
    dx[1] = -alpha * sinf(x[0]) - beta * x[1] + gamma * u;
}

int main()
{
    /*
     * Example for loading data from matlab file.
     */
    alpha = 123;  // dummy values to alpha, beta and gamma
    beta  = 456;
    gamma = 789;
    MatrixXd aux;
    matio::read_mat("../lab1/data.mat", "alpha", aux);
    alpha = aux(0);
    matio::read_mat("../lab1/data.mat", "beta",  aux);
    beta = aux(0);
    matio::read_mat("../lab1/data.mat", "gamma", aux);
    gamma = aux(0);
    std::cout << "alpha = " << alpha << std::endl;
    std::cout << "beta  = " << beta  << std::endl;
    std::cout << "gamma = " << gamma << std::endl;

    /*
     * Example of numeric integration.
     * Let's make the control signal constant for Ts.
     */
    u = 1;

    // Now let's instantiate and set values to initial condition.
    state_type x0(2);
    x0[0] = 0;
    x0[1] = 0;

    // Finally, integrate using RungeKutta with fixed-step of (Ts / 1000) seconds.
    integrate_const(rk4, edoAeropendulumNonLinear, x0, 0.0, Ts, Ts / 1000);

    // Print result on screen, i.e., x(Ts)
    std::cout << x0[0] << ", " << x0[1] << std::endl;

    /*
     * Declaring matrices and multiplying them.
     * A = [1 2
     *      3 4]
     * B = [5 6
     *      7 8]
     * C = A * B;
     */
    MatrixXd A {
        {1.0, 2.0},
        {3.0, 4.0}
    };
    Matrix<double, 2, 2> B {
        {5.0, 6.0},
        {7.0, 8.0}
    };
    MatrixXd C = A * B;
    std::cout << "C = " << std::endl << C << std::endl;

    /*
     * Create a Matlab file with A, B and C matrices.
     */
    matio::MatioFile matlab_file("../lab1/important_data.mat");
    matlab_file.write_mat("A", A.cast<double>());
    matlab_file.write_mat("B", B.cast<double>());
    matlab_file.write_mat("C", C.cast<double>());

    system("pause");

    return 0;
}
