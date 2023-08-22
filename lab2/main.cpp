#include <dac.hpp>
#include <chrono>
using namespace std::chrono_literals;
Dac* board;

int main()
{
	board = new Dac("COM9");

	int i = 20;
	while (i > 0)
	{
		board->digitalWrite(CH3, HIGH);
		delayMs(100);

		board->digitalWrite(CH3, LOW);
		delayMs(200);

		i = i - 1;
	}

	return 0;
}
