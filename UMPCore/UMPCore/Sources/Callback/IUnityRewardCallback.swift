//
//  IUnityRewardCallback.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public protocol IUnityRewardCallback: IUnityFullscreenCallback {
    func onUserEarnedReward(unitId: String, reward: Reward)
}
