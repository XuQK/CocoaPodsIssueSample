//
//  Reward.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public struct Reward {
    public let mount: Double
    public let type: String?

    public init(mount: Double, type: String? = nil) {
        self.mount = mount
        self.type = type
    }
}
