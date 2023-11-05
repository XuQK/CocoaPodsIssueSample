//
//  IUnityFullscreenCallback.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IUnityFullscreenCallback:
    IUnityCallback,
    IUnityAdLoadCallback,
    IUnityAdFailedToShowListener,
    IUnityAdImpressionCallback,
    IUnityAdPaidListener,
    IUnityAdClickListener,
    IUnityAdCloseListener
{}
