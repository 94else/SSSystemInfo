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
// 获取当前设备可用内存及所占内存的头文件
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <Foundation/NSProcessInfo.h>

@implementation SSSystemInfo


#pragma mark - deviceString
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

#pragma -- 内存信息
+ (unsigned long long)physicalMemory{
    return [NSProcessInfo processInfo].physicalMemory;
}

// 获取当前设备可用内存(单位：MB）
+ (unsigned long long)availableMemory
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return vm_page_size *vmStats.free_count;
}

// 获取当前任务所占用的内存（单位：MB）
+ (unsigned long long)usedMemory
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size ;
}


//打印内存信息
+(void)logMemoryInfo {
    int mib[6];
    mib[0] = CTL_HW;
    mib[1] = HW_PAGESIZE;
    
    int pagesize;
    size_t length;
    length = sizeof (pagesize);
    if (sysctl (mib, 2, &pagesize, &length, NULL, 0) < 0)
    {
        fprintf (stderr, "getting page size");
    }
    
    mach_msg_type_number_t count = HOST_VM_INFO_COUNT;
    
    vm_statistics_data_t vmstat;
    if (host_statistics (mach_host_self (), HOST_VM_INFO, (host_info_t) &vmstat, &count) != KERN_SUCCESS)
    {
        fprintf (stderr, "Failed to get VM statistics.");
    }
    task_basic_info_64_data_t info;
    unsigned size = sizeof (info);
    task_info (mach_task_self (), TASK_BASIC_INFO_64, (task_info_t) &info, &size);
    
    double unit = 1024 * 1024;
    double total = (vmstat.wire_count + vmstat.active_count + vmstat.inactive_count + vmstat.free_count) * pagesize / unit;
    double wired = vmstat.wire_count * pagesize / unit;
    double active = vmstat.active_count * pagesize / unit;
    double inactive = vmstat.inactive_count * pagesize / unit;
    double free = vmstat.free_count * pagesize / unit;
    double resident = info.resident_size / unit;
    /*
     　　wired是系统核心占用的，永远不会从系统物理[内存]中驱除。
     　　active表示这些[内存]数据正在使用种，或者刚被使用过。
     　　inactive表示这些[内存]中的数据是有效的，但是最近没有被使用。
     　　free, 表示这些[内存]中的数据是无效的，这些空间可以随时被程序使用。
     
     　　当free的[内存]低于某个值（这个值是由你的物理[内存]大小决定的），系统则会按照以下顺序使用inactive的资源。
     
     首先, 如果inactive的数据最近被调用了，系统会把它们的状态改变成active,并接在原有active[内存]逻辑地址的后面,
     
     如果inactive的[内存]数据最近没有被使用过，但是曾经被更改过而还没有在硬盘的相应虚拟[内存]中做修改，系统会对相应硬盘的虚拟[内存]做修改，并把这部分物理[内存]释放为free供程序使用。
     
     如果inactive[内存]中得数据被在映射到硬盘后再没有被更改过，则直接释放成free。
     最后如果active的[内存]一段时间没有被使用，会被暂时改变状态为inactive。
     　　
     所以说，如果你的系统里有少量的free memeory和大量的inactive的memeory，说明你的[内存]是够用的，系统运行在最佳状
     态，只要需要,系统就会使用它们，不用担心。而反之如果系统的free memory和inactive memory都很少，而active memory
     很多，说明你的[内存]不够了。当然一开机，大部分[内存]都是free,这时系统反而不在最佳状态，因为很多数据都需要从硬盘
     
     */
    
    NSLog(@"===================================================");
    NSLog(@"Total:%.2lfMb", total);
    NSLog(@"PhysicalMemory:%.2fMb", [NSProcessInfo processInfo].physicalMemory / unit);
    NSLog(@"Wired:%.2lfMb", wired);
    NSLog(@"Active:%.2lfMb", active);
    NSLog(@"Inactive:%.2lfMb", inactive);
    NSLog(@"Free:%.2lfMb", free);
    NSLog(@"Resident:%.2lfMb", resident);
}


@end
