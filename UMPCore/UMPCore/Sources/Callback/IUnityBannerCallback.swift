//
//  IUnityBannerCallback.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IUnityBannerCallback:
    IUnityCallback,
    IUnityAdLoadCallback,
    IUnityAdImpressionCallback,
    IUnityAdPaidListener,
    IUnityAdClickListener
{
    func onBannerDetailClosed(unitId: String)
    func onBannerDetailOpened(unitId: String)
}
