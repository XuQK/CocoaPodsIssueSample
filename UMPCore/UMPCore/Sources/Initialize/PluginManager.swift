//
//  PluginManager.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public class PluginManager {
    public static let Tag: String = "MPlugins:"
    private static var extraParameters = [String: [String: String?]]()
    public private(set) static var testMode: Bool = false

    public static func initialize(testMode: Bool, callback: @escaping InitializeCallback) {
        PluginManager.testMode = testMode
        callback(true)
    }

    public static func setExtraParameter(groupId: String, key: String, value: String?) {
        var group = extraParameters[groupId, default: [:]]
        group[key] = value
        extraParameters[groupId] = group
    }

    public static func getExtraParameter(groupId: String, key: String) -> String? {
        extraParameters[groupId]?[key] ?? nil
    }
}
