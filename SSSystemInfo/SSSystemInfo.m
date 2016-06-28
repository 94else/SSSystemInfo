//
//  SSSystemInfo.m
//  SSSystemInfoSample
//
//  Created by Snow on 6/28/16.
//  Copyright © 2016 Snow. All rights reserved.
//

#import "SSSystemInfo.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>

@implementation SSSystemInfo


//https://www.theiphonewiki.com/wiki/Models
+(NSString * )deviceString{
    static NSString *deviceString = nil;
    if (deviceString) {
        return deviceString;
    }
//    __IPHONE_4_0
    
    NSMutableDictionary *deviceDict = [NSMutableDictionary dictionaryWithCapacity:50];
    
    
    //Apple TV
    [deviceDict addEntriesFromDictionary:@{
                                           @"AppleTV1,1":@"Apple TV",
                                           @"AppleTV2,1":@"Apple TV 2G",
                                           @"AppleTV3,1":@"Apple TV 3G",
                                           @"AppleTV3,2":@"Apple TV 3G",
                                           @"AppleTV5,3":@"Apple TV 4G",
                                           }];
    
    //Apple Watch
    [deviceDict addEntriesFromDictionary:@{
                                           @"Watch1,1":@"Apple Watch",
                                           @"Watch1,2":@"Apple Watch",
                                           }];
    
    //iPad
    [deviceDict addEntriesFromDictionary:@{
                                           @"iPad1,1":@"iPad",
                                           
                                           @"iPad2,1":@"iPad 2",
                                           @"iPad2,2":@"iPad 2",
                                           @"iPad2,3":@"iPad 2",
                                           @"iPad2,4":@"iPad 2",
                                           
                                           @"iPad3,1":@"iPad 3",
                                           @"iPad3,2":@"iPad 3",
                                           @"iPad3,3":@"iPad 3",
                                           
                                           @"iPad3,4":@"iPad 4",
                                           @"iPad3,5":@"iPad 4",
                                           @"iPad3,6":@"iPad 4",
                                           
                                           @"iPad4,1":@"iPad Air",
                                           @"iPad4,2":@"iPad Air",
                                           @"iPad4,3":@"iPad Air",
                                           
                                           @"iPad5,3":@"iPad Air 2",
                                           @"iPad5,4":@"iPad Air 2",
                                           
                                           @"iPad6,7":@"iPad Pro (12.9 inch)",
                                           @"iPad6,8":@"iPad Pro (12.9 inch)",
                                           
                                           @"iPad6,3":@"iPad Pro (9.7 inch)",
                                           @"iPad6,4":@"iPad Pro (9.7 inch)",
                                           }];
    
    //iPad mini
    [deviceDict addEntriesFromDictionary:@{
                                           @"iPad2,5":@"iPad mini",
                                           @"iPad2,6":@"iPad mini",
                                           @"iPad2,7":@"iPad mini",
                                           
                                           @"iPad4,4":@"iPad mini 2",
                                           @"iPad4,5":@"iPad mini 2",
                                           @"iPad4,6":@"iPad mini 2",
                                           
                                           @"iPad4,7":@"iPad mini 3",
                                           @"iPad4,8":@"iPad mini 3",
                                           @"iPad4,9":@"iPad mini 3",
                                           
                                           @"iPad5,1":@"iPad mini 4",
                                           @"iPad5,2":@"iPad mini 4",
                                           }];
    
    //iPhone
    [deviceDict addEntriesFromDictionary:@{
                                          @"iPhone1,1": @"iPhone",
                                          
                                          @"iPhone1,2": @"iPhone 3G",
                                          
                                          @"iPhone2,1": @"iPhone 3GS",
                                          
                                          @"iPhone3,1": @"iPhone 4",
                                          @"iPhone3,2": @"iPhone 4",
                                          @"iPhone3,3": @"iPhone 4",
                                          
                                          @"iPhone4,1":@"iPhone 4S",
                                          
                                          @"iPhone5,1":@"iPhone 5",
                                          @"iPhone5,1":@"iPhone 5",
                                          
                                          @"iPhone5,3":@"iPhone 5c",
                                          @"iPhone5,4":@"iPhone 5c",
                                          
                                          @"iPhone6,1":@"iPhone 5s",
                                          @"iPhone6,2":@"iPhone 5s",
                                          
                                          @"iPhone7,2":@"iPhone 6",
                                          @"iPhone7,1":@"iPhone 6 Plus",
                                          
                                          @"iPhone8,1":@"iPhone 6s",
                                          @"iPhone8,2":@"iPhone 6s Plus",
                                          @"iPhone8,4":@"iPhone SE",
                                          }];
    
    //iPod touch
    [deviceDict addEntriesFromDictionary:@{
                                           @"iPod1,1":@"iPod touch",
                                           @"iPod2,1":@"iPod touch 2G",
                                           @"iPod3,1":@"iPod touch 3G",
                                           @"iPod4,1":@"iPod touch 4G",
                                           @"iPod5,1":@"iPod touch 5G",
                                           @"iPod7,1":@"iPod touch 6G",
                                           }];
    
    [deviceDict addEntriesFromDictionary:@{
                                           @"i386": @"Simulator",
                                           @"x86_64": @"Simulator",
                                           }];
    

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *device = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    deviceString = [deviceDict objectForKey:device];
    if (deviceString == nil) {
        deviceString = device;
    }
    
    return deviceString;
}

+ (BOOL)isDevicePhone
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    NSString * deviceType = [UIDevice currentDevice].model;
    
    if ( [deviceType rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].length > 0 ||
        [deviceType rangeOfString:@"iPod" options:NSCaseInsensitiveSearch].length > 0 ||
        [deviceType rangeOfString:@"iTouch" options:NSCaseInsensitiveSearch].length > 0 )
    {
        return YES;
    }
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    
    return NO;
}

+ (BOOL)isDevicePad
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    NSString * deviceType = [UIDevice currentDevice].model;
    
    if ( [deviceType rangeOfString:@"iPad" options:NSCaseInsensitiveSearch].length > 0 )
    {
        return YES;
    }
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    
    return NO;
}

@end
