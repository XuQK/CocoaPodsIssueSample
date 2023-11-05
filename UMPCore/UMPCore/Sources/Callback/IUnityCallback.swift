//
//  IUnityCallback.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IUnityCallback {}

public protocol IUnityAdLoadCallback {
    func onAdLoaded(unitId: String, mediationAd: IMediationAd)
    func onAdFailedToLoad(unitId: String, errorClient: ErrorClient)
}

public protocol IUnityAdFailedToShowListener {
    func onAdFailedToShow(unitId: String, errorClient: ErrorClient)
}

public protocol IUnityAdImpressionCallback {
    func onAdImpression(unitId: String)
}

public protocol IUnityAdPaidListener {
    func onAdPaid(unitId: String, adValue: AdValue, extraParams: [String: Any?]?)
}

public protocol IUnityAdClickListener {
    func onAdClicked(unitId: String)
}

public protocol IUnityAdCloseListener {
    func onAdClosed(unitId: String)
}
