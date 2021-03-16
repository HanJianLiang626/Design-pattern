#include <iostream>

#include "../Singleton/singleton.hpp"

class Test
{
public:
    Test() { std::cout << "New..." << std::endl; }
    ~Test() { std::cout << "Delete..." << std::endl; }
    void print() const { std::cout << "Test print" << std::endl; }
};