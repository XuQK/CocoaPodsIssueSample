//
//  ErrorClient.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public struct ErrorClient: IEncodableJson {
    public let code: Int
    public let message: String

    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}
