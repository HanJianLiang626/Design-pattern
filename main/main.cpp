#include <iostream>
#include <thread>

#include "test.hpp"

int main()
{
	auto pTest = MagicSingleton<Test>::GetInstance();
	return 0;
}