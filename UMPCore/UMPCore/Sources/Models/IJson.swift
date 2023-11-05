//
//  IJson.swift
//  UMPCore
//
//  Created by 龚文 on 10/26/23.
//

import Foundation

public protocol IJson {
    func toJson() -> String
}

public protocol IEncodableJson: IJson, Encodable {}

public extension IEncodableJson {
    func toJson() -> String {
        let jsonEncoder = JSONEncoder()
        // jsonEncoder.outputFormatting = .prettyPrinted
        do {
            let encodeObject = try jsonEncoder.encode(self)
            return String(data: encodeObject, encoding: .utf8)!
        } catch {
            fatalError("\(error)")
        }
    }
}
