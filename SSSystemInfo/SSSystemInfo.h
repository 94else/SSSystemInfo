//
//  SSSystemInfo.h
//  SSSystemInfoSample
//
//  Created by Snow on 6/28/16.
//  Copyright © 2016 Snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSSystemInfo : NSObject

+(NSString * )deviceString;

+ (BOOL)isDevicePhone;

+ (BOOL)isDevicePad;

@end
