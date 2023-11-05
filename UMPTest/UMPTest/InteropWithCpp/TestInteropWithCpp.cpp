//
//  TestInteropWithCpp.cpp
//  UMPTest
//
//  Created by 龚文 on 10/23/23.
//

#include <iostream>
#include <UMPTest/UMPTest-Swift.h>
#include "TestInteropWithCpp.hpp"


Person2::Person2(std::string name, int age) {
    m_name = name;
    m_age = age;
}

std::string Person2::callFromSwift(std::string param) {
    std::cout << "Swift-Cpp-interop [Swfit call C++]  =>  " << "Name: " << m_name << ", Age: " << m_age << ", Param: " << param << std::endl;

    UMPTest::SwiftPerson swiftPerson = UMPTest::SwiftPerson::init("commercial2", 666);
    std::string result = swiftPerson.callFromCpp("param2");
    std::cout << "Swift-Cpp-interop [C++ call Swift]  =>  " << "Result: " << result << std::endl;

    return "done " + param;
}

char * callFromSwift(const char *param) {
    std::cout << "Swift-Cpp-interop Direct Call [Swift call C++]   =>  " << "Param: " << param << std::endl;

    std::string result = UMPTest::TestInteropWithCpp::callFromCpp("param4");
    std::cout << "Swift-Cpp-interop Direct Call [C++ call Swift]   =>  " << "Result: " << result << std::endl;

    char *result2 = strdup("done param3");

    // free(result2);
    return result2;
}
