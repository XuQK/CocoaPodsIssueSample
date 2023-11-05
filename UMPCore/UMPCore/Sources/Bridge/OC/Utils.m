//
//  Utils.m
//  UMPCore
//
//  Created by 龚文 on 10/30/23.
//

#import <Foundation/Foundation.h>
#import "Utils.h"

@implementation Utils

+ (NSString *)stringFromCString:(const char *)cString {
    if (cString == NULL) {
        return nil;
    }

    return [NSString stringWithUTF8String:cString];
}

@end
