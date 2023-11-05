//
//  BaseAdClient.swift
//  UMPCore
//
//  Created by 龚文 on 10/26/23.
//

import Foundation

open class BaseAdClient: NSObject, IAdClient {
    public let adFormat: AdFormat
    public let platform: Platform
    private let callback: IUnityCallback
    public private(set) var extraParameters = [String: [String: String?]]()
    public private(set) var isDestroyed = false

    public private(set) lazy var unityHandler: UnityHandler = .init(adClient: self, callback: callback)

    init(adFormat: AdFormat, platform: Platform, callback: IUnityCallback) {
        self.adFormat = adFormat
        self.platform = platform
        self.callback = callback
    }

    public final func setExtraParameter(unitId: String, key: String, value: String?) {
        Handler.runOnMainThread { [self] in
            unityHandler.setExtraParameter(unitId: unitId, key: key, value: value)
            var group = extraParameters[unitId, default: [:]]
            group[key] = value
            extraParameters[unitId] = group
        }
    }

    public final func isReady(unitId: String) -> Bool {
        let _ = unityHandler.isReady(unitId: unitId)
        return isReadyImpl(unitId: unitId)
    }

    public final func show(unitId: String) {
        Handler.runOnMainThread {
            self.unityHandler.show(unitId: unitId)
            self.showImpl(unitId: unitId)
        }
    }

    public final func destroy(unitId: String) {
        if isDestroyed {
            return
        }
        Handler.runOnMainThread {
            if self.isDestroyed {
                return
            }
            self.isDestroyed = true

            self.unityHandler.destroy(unitId: unitId)
            self.destroyImpl(unitId: unitId)
        }
    }

    open func isReadyImpl(unitId: String) -> Bool {
        fatalError("Not Implementation")
    }

    open func showImpl(unitId: String) {
        fatalError("Not Implementation")
    }

    open func destroyImpl(unitId: String) {
        fatalError("Not Implementation")
    }
}
