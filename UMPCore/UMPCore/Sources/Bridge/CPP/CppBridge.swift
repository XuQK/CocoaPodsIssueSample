//
//  CppBridge.swift
//  UMPCore
//
//  Created by 龚文 on 10/30/23.
//
//  Swift&C++互操作文档：https://www.swift.org/documentation/cxx-interop/#exposing-swift-apis-to-c
//  TODO: Swift&C++相互回调

import Foundation

public class CppBridge {
    public static func setPluginExtraParameter(groupId: String, key: String, value: UnsafePointer<Int8>?) {
        guard let cString = value else {
            PluginManager.setExtraParameter(groupId: groupId, key: key, value: nil)
            return
        }

        PluginManager.setExtraParameter(groupId: groupId, key: key, value: String(cString: cString))
        cString.deallocate()
    }

    public static func getPluginExtraParameter(groupId: String, key: String) -> UnsafeMutablePointer<Int8>? {
        getCharPointer(from: PluginManager.getExtraParameter(groupId: groupId, key: key))
    }

    public static func setExtraParameter(handle: Int, unitId: String, key: String, value: String) {
        (OCBridge.clientHandlePool[handle] as? IAdClient)?.setExtraParameter(unitId: unitId, key: key, value: value)
    }

    public static func load(handle: Int, unitId: String) {
        (OCBridge.clientHandlePool[handle] as? IFullScreenClient)?.load(unitId: unitId)
    }

    public static func isReady(handle: Int, unitId: String) -> Bool {
        (OCBridge.clientHandlePool[handle] as? IAdClient)?.isReady(unitId: unitId) ?? false
    }

    public static func show(handle: Int, unitId: String) {
        (OCBridge.clientHandlePool[handle] as? IAdClient)?.show(unitId: unitId)
    }

    public static func destroy(handle: Int, unitId: String) {
        (OCBridge.clientHandlePool[handle] as? IAdClient)?.destroy(unitId: unitId)
    }

    public static func load(handle: Int, unitId: String, width: Int, height: Int, position: Int) {
        (OCBridge.clientHandlePool[handle] as? IBannerClient)?.load(unitId: unitId, width: width, height: height, position: position)
    }

    public static func hide(handle: Int, unitId: String) {
        (OCBridge.clientHandlePool[handle] as? IBannerClient)?.hide(unitId: unitId)
    }

    public static func getCharPointer(from optionalString: String?) -> UnsafeMutablePointer<Int8>? {
        guard let string = optionalString else {
            return nil
        }

        return strdup(string)
    }
}
