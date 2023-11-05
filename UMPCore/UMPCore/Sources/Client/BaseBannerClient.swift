//
//  BaseBannerClient.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

open class BaseBannerClient: BaseAdClient, IBannerClient {
    public init(platform: Platform, callback: IUnityBannerCallback) {
        super.init(adFormat: .banner, platform: platform, callback: callback)
    }

    public final func load(unitId: String, width: Int, height: Int, position: Int) {
        Handler.runOnMainThread {
            self.unityHandler.load(unitId: unitId, width: width, height: height, position: position)
            self.loadImpl(unitId: unitId, width: width, height: height, position: position)
        }
    }

    public final func hide(unitId: String) {
        Handler.runOnMainThread {
            self.unityHandler.hide(unitId: unitId)
            self.hideImpl(unitId: unitId)
        }
    }

    open func loadImpl(unitId: String, width: Int, height: Int, position: Int) {
        fatalError("Not Implementation")
    }

    open func hideImpl(unitId: String) {
        fatalError("Not Implementation")
    }
}
