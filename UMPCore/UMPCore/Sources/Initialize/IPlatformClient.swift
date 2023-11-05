//
//  IPlatformClient.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IPlatformClient {
    static var platform: Platform { get }

    static func initialize(appKey: String?, callback: @escaping InitializeCallback)
    static func createClient(adFormat: AdFormat, callback: IUnityCallback) -> IAdClient?
    static func showDebugger()
}
