//
//  BaseFullscreenClient.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

open class BaseFullscreenClient: BaseAdClient, IFullScreenClient {
    public init(adFormat: AdFormat, platform: Platform, callback: IUnityFullscreenCallback) {
        super.init(adFormat: adFormat, platform: platform, callback: callback)
    }

    public final func load(unitId: String) {
        Handler.runOnMainThread {
            self.unityHandler.load(unitId: unitId)
            self.loadImpl(unitId: unitId)
        }
    }

    open func loadImpl(unitId: String) {
        fatalError("Not Implementation")
    }
}
