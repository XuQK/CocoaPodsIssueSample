//
//  AdFormat.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public enum AdFormat: Int {
    case banner=0
    case interstitial=1
    case reward=2

    public func name() -> String {
        switch self {
        case .banner:
            "Banner"
        case .interstitial:
            "Interstitial"
        case .reward:
            "Reward"
        }
    }
}
