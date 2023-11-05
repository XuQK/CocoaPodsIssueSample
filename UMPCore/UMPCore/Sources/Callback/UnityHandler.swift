//
//  UnityHandler.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public class UnityHandler: IBannerClient, IFullScreenClient, IUnityBannerCallback, IUnityInterstitialCallback, IUnityRewardCallback {
    private let adClient: IAdClient
    public let adFormat: AdFormat
    public let platform: Platform
    private let callback: IUnityCallback

    init(adClient: IAdClient, callback: IUnityCallback) {
        self.adClient = adClient
        self.adFormat = adClient.adFormat
        self.platform = adClient.platform
        self.callback = callback
    }

    public func setExtraParameter(unitId: String, key: String, value: String?) {
        log(unitId: unitId, message: "key:\(key),value:\(String(describing: value))")
    }

    public func load(unitId: String, width: Int, height: Int, position: Int) {
        log(unitId: unitId, message: "width:\(width),height:\(height),position:\(position))")
    }

    public func load(unitId: String) {
        log(unitId: unitId, message: "")
    }

    public func isReady(unitId: String) -> Bool {
        log(unitId: unitId, message: "")
        return false
    }

    public func show(unitId: String) {
        log(unitId: unitId, message: "")
    }

    public func hide(unitId: String) {
        log(unitId: unitId, message: "")
    }

    public func destroy(unitId: String) {
        log(unitId: unitId, message: "")
    }

    public func onAdLoaded(unitId: String, mediationAd: IMediationAd) {
        log(unitId: unitId, message: mediationAd.toJson())
        Handler.runOnMainThread {
            (self.callback as! IUnityAdLoadCallback).onAdLoaded(unitId: unitId, mediationAd: mediationAd)
        }
    }

    public func onAdFailedToLoad(unitId: String, errorClient: ErrorClient) {
        log(unitId: unitId, message: errorClient.toJson())
        Handler.runOnMainThread { [self] in
            (callback as! IUnityAdLoadCallback as IUnityAdLoadCallback).onAdFailedToLoad(unitId: unitId, errorClient: errorClient)
        }
    }

    public func onAdFailedToShow(unitId: String, errorClient: ErrorClient) {
        log(unitId: unitId, message: errorClient.toJson())
        Handler.runOnMainThread { [self] in
            (callback as! IUnityAdFailedToShowListener).onAdFailedToShow(unitId: unitId, errorClient: errorClient)
        }
    }

    public func onAdImpression(unitId: String) {
        log(unitId: unitId, message: "")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityAdImpressionCallback).onAdImpression(unitId: unitId)
        }
    }

    public func onAdPaid(unitId: String, adValue: AdValue, extraParams: [String: Any?]?) {
        log(unitId: unitId, message: "value:\(adValue.value),currencyCode:\(adValue.currencyCode),extraParams:\(String(describing: extraParams?.toJson()))")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityAdPaidListener).onAdPaid(unitId: unitId, adValue: adValue, extraParams: extraParams)
        }
    }

    public func onAdClicked(unitId: String) {
        log(unitId: unitId, message: "")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityAdClickListener).onAdClicked(unitId: unitId)
        }
    }

    public func onAdClosed(unitId: String) {
        log(unitId: unitId, message: "")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityAdCloseListener).onAdClosed(unitId: unitId)
        }
    }

    public func onUserEarnedReward(unitId: String, reward: Reward) {
        log(unitId: unitId, message: "reward:\(reward)")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityRewardCallback).onUserEarnedReward(unitId: unitId, reward: reward)
        }
    }

    public func onBannerDetailOpened(unitId: String) {
        log(unitId: unitId, message: "")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityBannerCallback).onBannerDetailOpened(unitId: unitId)
        }
    }

    public func onBannerDetailClosed(unitId: String) {
        log(unitId: unitId, message: "")
        Handler.runOnMainThread { [self] in
            (callback as! IUnityBannerCallback).onBannerDetailClosed(unitId: unitId)
        }
    }

    func log(unitId: String, message: String, function: String = #function) {
        if !PluginManager.testMode {
            return
        }
        let functionName = function.shortFunctionName()
        let clientid = Unmanaged.passUnretained(adClient as AnyObject).toOpaque()
        Logger.d(message: "【\(functionName)】{client_id=@\(clientid),\(adFormat.name())_\(platform.name)_\(unitId),message => \(message)}")
    }
}
