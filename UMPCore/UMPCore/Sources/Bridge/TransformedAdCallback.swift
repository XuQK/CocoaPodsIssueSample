//
//  TransformedAdCallback.swift
//  UMPCore
//
//  Created by 龚文 on 10/30/23.
//

import Foundation

class TransformedAdCallback: IUnityCallback, IUnityBannerCallback, IUnityInterstitialCallback, IUnityRewardCallback {
    private let callback: UnionedAdCallbacks

    init(callback: UnionedAdCallbacks) {
        self.callback = callback
    }

    func onAdLoaded(unitId: String, mediationAd: IMediationAd) {
        callback.onAdLoaded(unitId, mediationAd.toJson())
    }

    func onAdFailedToLoad(unitId: String, errorClient: ErrorClient) {
        callback.onAdFailedToLoad(unitId, errorClient.toJson())
    }

    func onAdFailedToShow(unitId: String, errorClient: ErrorClient) {
        callback.onAdFailedToShow(unitId, errorClient.toJson())
    }

    func onAdImpression(unitId: String) {
        callback.onAdImpression(unitId)
    }

    func onAdPaid(unitId: String, adValue: AdValue, extraParams: [String: Any?]?) {
        callback.onAdPaid(unitId, Int32(adValue.value), adValue.currencyCode, extraParams?.toJson())
    }

    func onUserEarnedReward(unitId: String, reward: Reward) {
        callback.onAdEarnedReward(unitId)
    }

    func onAdClicked(unitId: String) {
        callback.onAdClicked(unitId)
    }

    func onAdClosed(unitId: String) {
        callback.onAdClosed(unitId)
    }

    func onBannerDetailClosed(unitId: String) {
        callback.onBannerDetailOpened(unitId)
    }

    func onBannerDetailOpened(unitId: String) {
        callback.onBannerDetailClosed(unitId)
    }
}
