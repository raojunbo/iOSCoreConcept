//
//  UIDevice+Hardware.m
//  PFastCalculation
//
//  Created by Aslan on 7/8/16.
//  Copyright © 2016 Knowin. All rights reserved.
//

#import "UIDevice+Hardware.h"
#import <mach-o/dyld.h>
#include <sys/sysctl.h>
#import <sys/stat.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <mach/mach.h>
#include <arpa/inet.h>
#include <ifaddrs.h>

static NSString *PF_UIDevice_platfrom = nil;

@implementation UIDevice (Hardware)

+ (NSString *)kb_systemVersion
{
    static NSString *version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion;
    });
    return version;
}

+ (BOOL)kb_isPad
{
    static dispatch_once_t one;
    static BOOL pad;
    dispatch_once(&one, ^{
        pad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    return pad;
}


+ (BOOL)kb_canMakePhoneCalls
{
    __block BOOL can;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        can = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    });
    return can;
}

+ (NSString *)kb_ipAddressWIFI
{
    NSString *address = nil;
    struct ifaddrs *addrs = NULL;
    if (getifaddrs(&addrs) == 0) {
        struct ifaddrs *addr = addrs;
        while (addr != NULL) {
            if (addr->ifa_addr->sa_family == AF_INET) {
                if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:
                               inet_ntoa(((struct sockaddr_in *)addr->ifa_addr)->sin_addr)];
                    break;
                }
            }
            addr = addr->ifa_next;
        }
    }
    freeifaddrs(addrs);
    return address;
}

+ (NSString *)kb_ipAddressCell
{
    NSString *address = nil;
    struct ifaddrs *addrs = NULL;
    if (getifaddrs(&addrs) == 0) {
        struct ifaddrs *addr = addrs;
        while (addr != NULL) {
            if (addr->ifa_addr->sa_family == AF_INET) {
                if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:@"pdp_ip0"]) {
                    address = [NSString stringWithUTF8String:
                               inet_ntoa(((struct sockaddr_in *)addr->ifa_addr)->sin_addr)];
                    break;
                }
            }
            addr = addr->ifa_next;
        }
    }
    freeifaddrs(addrs);
    return address;
}

+ (NSString *)kb_modelName
{
    static NSString *momdelName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        momdelName = [[UIDevice currentDevice].model stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    });
    return momdelName;
}

- (NSString *)__pf_platform
{
    static dispatch_once_t one;
    static NSString *model;
    dispatch_once(&one, ^{
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        model = [NSString stringWithUTF8String:machine];
        free(machine);
    });
    return model;
}

// maybe json or xml config file is better
- (NSString *)__pf_platformString
{
    static dispatch_once_t one;
    static NSString *name = @"Unknown";
    dispatch_once(&one, ^{
        // @see http://theiphonewiki.com/wiki/Models
        NSString *platform = [self __pf_platform];
        if (!platform) return;
        
        NSDictionary *dict = @{
                               // iPhone
                               @"iPhone1,1": @"iPhone1G",
                               @"iPhone1,2": @"iPhone3G",
                               @"iPhone2,1": @"iPhone3GS",
                               @"iPhone3,1": @"iPhone4GSM",
                               @"iPhone3,2": @"iPhone4GSMRevA",
                               @"iPhone3,3": @"iPhone4CDMA",
                               @"iPhone4,1": @"iPhone4s",
                               @"iPhone5,1": @"iPhone5GSM",
                               @"iPhone5,2": @"iPhone5CDMA",
                               @"iPhone5,3": @"iPhone5cGSM",
                               @"iPhone5,4": @"iPhone5cGlobal",
                               @"iPhone6,1": @"iPhone5sGSMCDMA",
                               @"iPhone6,2": @"iPhone5sGlobal",
                               @"iPhone7,1": @"iPhone6Plus",
                               @"iPhone7,2": @"iPhone6",
                               @"iPhone8,1": @"iPhone6s",
                               @"iPhone8,2": @"iPhone6sPlus",
                               @"iPhone8,4": @"iPhoneSE",
                               
                               // iPod
                               @"iPod1,1": @"iPodTouch1G",
                               @"iPod2,1": @"iPodTouch2G",
                               @"iPod3,1": @"iPodTouch3G",
                               @"iPod4,1": @"iPodTouch4G",
                               @"iPod5,1": @"iPodTouch5G",
                               
                               // iPad
                               @"iPad1,1": @"iPad",
                               @"iPad2,1": @"iPad2WiFi",
                               @"iPad2,2": @"iPad2GSM",
                               @"iPad2,3": @"iPad2CDMA",
                               @"iPad2,4": @"iPad2WiFiRevA",
                               @"iPad3,1": @"iPad3WiFi",
                               @"iPad3,2": @"iPad3GSMCDMA",
                               @"iPad3,3": @"iPad3GSM",
                               @"iPad3,4": @"iPad4WiFi",
                               @"iPad3,5": @"iPad4GSM",
                               @"iPad3,6": @"iPad4GSMCDMA",
                               @"iPad4,1": @"iPadAirWiFi",
                               @"iPad4,2": @"iPadAirCellular",
                               
                               // iPad Mini
                               @"iPad2,5": @"iPadMiniWiFi",
                               @"iPad2,6": @"iPadMiniGSM",
                               @"iPad2,7": @"iPadMiniGSMCDMA",
                               @"iPad4,4": @"iPadMiniRetinaWiFi",
                               @"iPad4,5": @"iPadMiniRetinaCellular",
                               
                               // Xcode iOS Simulator
                               @"i386": @"iOSi386Simulator",
                               @"x86_64": @"iOSx8664Simulator"
                               };
        name = dict[platform];
        if (!name) {
            name = platform;
        }
    });
    return name;
}

- (NSString *)platformString
{
    if (PF_UIDevice_platfrom == nil) {
        PF_UIDevice_platfrom = [self __pf_platformString];
    }
    return PF_UIDevice_platfrom;
}

+ (NSString *)kb_deviceModel
{
    return [self kb_modelName];
}

+ (NSString *)kb_deviceType
{
    return [[[UIDevice currentDevice] platformString] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSString *)kb_getProxy
{
    //得到代理
    CFDictionaryRef proxySettings = CFNetworkCopySystemProxySettings();
    NSDictionary *dictProxy = (__bridge_transfer id)proxySettings;
    NSLog(@"%@",dictProxy);
    
    //是否开启了http代理
    
    NSString *url = @"";
    if ([[dictProxy objectForKey:@"HTTPEnable"] boolValue]) {
        
        NSString *proxyAddress = [dictProxy objectForKey:@"HTTPProxy"];
        NSNumber *proxyPort = [dictProxy objectForKey:@"HTTPPort"];
        url = [NSString stringWithFormat:@"http://%@:%ld", proxyAddress, [proxyPort longValue]];
    }
    return url;
}

@end
