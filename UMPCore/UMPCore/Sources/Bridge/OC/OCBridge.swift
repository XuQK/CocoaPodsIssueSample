//
//  OCBridge.swift
//  UMPCore
//
//  Created by 龚文 on 10/27/23.
//  OC文档：https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html

import Foundation

public class OCBridge: NSObject {
    public private(set) static var platformHandlePool: [Int: IPlatformClient.Type?] = [:]
    public private(set) static var clientHandlePool: [Int: AnyObject?] = [:]
    private static var platformPool: [String: IPlatformClient.Type?] = [:]

    @objc public static func initializePlugin(testMode: Bool, callback: @escaping InitializeCallback) {
        PluginManager.initialize(testMode: testMode, callback: callback)
    }

    @objc public static func initializePlatform(platform: Int, className: String, appKey: String?, callback: @escaping InitializeCallback) {
        let platformClientType = retrievePlatformClientType(className: className)
        platformClientType?.initialize(appKey: appKey, callback: callback)
        platformHandlePool[platform] = platformClientType
    }

    @objc public static func createClient(
        platform: Int,
        adFormat: Int,
        callback: UnionedAdCallbacks) -> Int
    {
        guard let format = AdFormat(rawValue: adFormat) else {
            return 0
        }
        guard let client = platformHandlePool[platform]?!.createClient(
            adFormat: format, callback: TransformedAdCallback(callback: callback))
        else {
            return 0
        }
        let handle = ObjectIdentifier(client as AnyObject).hashValue
        clientHandlePool[handle] = client as AnyObject
        return handle
    }

    private static func retrievePlatformClientType(className: String) -> IPlatformClient.Type? {
        guard let platformClientType = platformPool[className] else {
            guard let nsClass = NSClassFromString(className) else {
                return nil
            }
            let platformClientType2 = nsClass as? IPlatformClient.Type
            platformPool[className] = platformClientType2
            return platformClientType2
        }
        return platformClientType
    }
}
