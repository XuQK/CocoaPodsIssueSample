//
//  AdValue.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public struct AdValue {
    public let value: Int
    public let currencyCode: String

    public init(value: Int, currencyCode: String? = nil) {
        self.value = value
        self.currencyCode = currencyCode ?? "USD"
    }
}
