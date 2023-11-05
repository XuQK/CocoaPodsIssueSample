//
//  OCBridge.m
//  UMPCore
//
//  Created by 龚文 on 10/30/23.
//

#import <Foundation/Foundation.h>
#include <UMPCore/UMPCore-Swift.h>
#include "Bridge.h"
#import "Utils.h"

void Plugin_initialize(bool testMode, InitializeCallback callback) {
    [OCBridge initializePluginWithTestMode:testMode callback:callback];
}

void Platform_initialize(int platform, const char *className, const char *appKey, InitializeCallback callback) {
    [OCBridge initializePlatformWithPlatform:platform
                                   className:[Utils stringFromCString:className]
                                      appKey:[Utils stringFromCString:appKey]
                                    callback:callback];
}

long Platform_createClient(int platform, int adFormat, struct UnionedAdCallbacks callback) {
    return [OCBridge createClientWithPlatform:platform adFormat:adFormat callback:callback];
}
