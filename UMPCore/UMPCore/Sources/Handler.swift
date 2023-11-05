//
//  Handler.swift
//  UMPCore
//
//  Created by 龚文 on 10/26/23.
//

import Foundation

class Handler {
    private init() {}

    static func runOnMainThread(work: @escaping @Sendable @convention(block) () -> Void) {
        if Thread.current.isMainThread {
            work()
        } else {
            DispatchQueue.main.async {
                work()
            }
        }
    }
}
