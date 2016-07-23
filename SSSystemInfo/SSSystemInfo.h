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

#pragma -- 内存
+ (unsigned long long)physicalMemory;
// 获取当前设备可用内存(单位：MB）
+ (unsigned long long)availableMemory;
// 获取当前任务所占用的内存（单位：MB）
+ (unsigned long long)usedMemory;
+ (void)logMemoryInfo;

@end
