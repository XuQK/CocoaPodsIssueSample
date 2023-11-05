//
//  CBridge.cpp
//  UMPCore
//
//  Created by 龚文 on 10/30/23.
//

#include <UMPCore/UMPCore-Swift.h>
#include "Bridge.h"

void Plugin_setExtraParameter(const char *groupId, const char *key, const char *value) {
    UMPCore::CppBridge::setPluginExtraParameter(groupId, key, reinterpret_cast<const int8_t *>(value));
}

char * Plugin_getExtraParameter(const char *groupId, const char *key) {
    // C#端需要手动回收
    return reinterpret_cast<char *>(UMPCore::CppBridge::getPluginExtraParameter(groupId, key));
}

void Client_setExtraParameter(long handle, const char *unitId, const char *key, const char *value) {
    UMPCore::CppBridge::setExtraParameter(handle, unitId, key, value);
}

void Client_load(long handle, const char *unitId) {
    UMPCore::CppBridge::load(handle, unitId);
}

bool Client_isReady(long handle, const char *unitId) {
    return UMPCore::CppBridge::isReady(handle, unitId);
}

void Client_show(long handle, const char *unitId) {
    UMPCore::CppBridge::show(handle, unitId);
}

void Client_destroy(long handle, const char *unitId) {
    UMPCore::CppBridge::destroy(handle, unitId);
}

void Client_load2(long handle, const char *unitId, int width, int height, int position) {
    UMPCore::CppBridge::load(handle, unitId, width, height, position);
}

void Client_hide(long handle, const char *unitId) {
    UMPCore::CppBridge::hide(handle, unitId);
}
