//
//  IAdClient.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IAdClient {
    var adFormat: AdFormat { get }
    var platform: Platform { get }

    func setExtraParameter(unitId: String, key: String, value: String?)
    func isReady(unitId: String) -> Bool
    func show(unitId: String)
    func destroy(unitId: String)
}

public protocol IBannerClient: IAdClient {
    func load(unitId: String, width: Int, height: Int, position: Int)
    func hide(unitId: String)
}

public protocol IFullScreenClient: IAdClient {
    func load(unitId: String)
}
