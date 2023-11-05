//
//  TestInteropWithCpp.hpp
//  UMPTest
//
//  Created by 龚文 on 10/23/23.
//

#ifndef TestInteropWithCpp_hpp
#define TestInteropWithCpp_hpp

#include <stdio.h>


#ifdef __cplusplus
#include <string>

struct Person2 {
    std::string m_name;
    int m_age;
    Person2(std::string name, int age);
    std::string callFromSwift(std::string param);
};

extern "C" {
char * callFromSwift(const char *param);
}
#endif


#endif /* TestInteropWithCpp_hpp */
