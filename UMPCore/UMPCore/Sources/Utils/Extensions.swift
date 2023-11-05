//
//  Extensions.swift
//  UMPCore
//
//  Created by 龚文 on 10/26/23.
//

import Foundation

public typealias SwiftCallback<T> = (_ result: T) -> Void

extension Dictionary {
    private var jsonData: Data? {
        try? JSONSerialization.data(withJSONObject: self)
        // try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }

    func toJson() -> String? {
        if let jsonData {
            return String(data: jsonData, encoding: .utf8)
        }
        return nil
    }
}

public extension String {
    func shortFunctionName() -> String {
        let index = self.firstIndex(of: "(") ?? self.endIndex
        return self[..<index].description
    }
}
