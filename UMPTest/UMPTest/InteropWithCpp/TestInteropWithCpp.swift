//
//  TestInteropWithCpp.swift
//  UMPTest
//
//  Created by 龚文 on 10/23/23.
//

import Foundation

public class TestInteropWithCpp {
    /**
     * 验证在Framework中 Swift-C++互调实现
     */
    public static func main() {
        var person = Person2("commercial1", 666)
        let result = person.callFromSwift("param1")
        print("Swift-Cpp-interop [Swfit call C++]  =>  Result: \(result)")

        let result2 = String(cString: callFromSwift("param3"))
        print("Swift-Cpp-interop Direct Call [Swift call C++]   =>  Result: \(result2)")
    }

    public static func callFromCpp(param: String) -> String {
        print("Swift-Cpp-interop Direct Call [C++ call Swift]   =>  Param: \(param)")
        return "done " + param
    }
}

public class SwiftPerson {
    public var name: String
    public var age: Int

    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    public func callFromCpp(param: String) -> String {
        print("Swift-Cpp-interop [C++ call Swfit]  =>  Name: \(name), Age: \(age), Param: \(param)")
        return "done " + param
    }
}
