//
//  IMediationAd.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IMediationAd: IJson {}

public protocol IRevenueAd: IMediationAd {
    var revenue: Double { get }
}

open class MediationAd: IMediationAd {
    private var dictionary: [String: Any?] = [:]

    public init() {}

    public func put(key: String, value: Any?) {
        dictionary[key] = value
    }

    public func merge(dictionary: [String: Any?]) {
        for item in dictionary {
            self.dictionary[item.key] = item.value
        }
    }

    public func toJson() -> String {
        dictionary.toJson()!
    }

    private static let sEmptyMediationAd = MediationAd()

    public static func create() -> IMediationAd {
        sEmptyMediationAd
    }
}

open class RevenueAd: MediationAd, IRevenueAd {
    public let revenue: Double

    public required init(revenue: Double) {
        self.revenue = revenue
        super.init()
        put(key: "revenue", value: revenue)
    }
}
