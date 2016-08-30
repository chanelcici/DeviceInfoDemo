//
//  ViewController.m
//  DeviceInfoDemo
//
//  Created by CHANEL on 16/8/30.
//  Copyright © 2016年 cici. All rights reserved.
//

#import "ViewController.h"
#import <sys/utsname.h> //获取设备型号用,如iPhone5s,iPhone6,iPhone6splus等

@interface ViewController ()

@end

@implementation ViewController
UIButton *lb;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    lb = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:lb];
    lb.backgroundColor = [UIColor greenColor];
    [lb addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect screenBounds = [ [UIScreen mainScreen]bounds];   //获取屏幕视觉尺寸,如6splus(标准视图)的宽度是414*736(设计尺寸1242*2208,物理尺寸1080*1920)
    NSLog(@"screenBounds.width: %f", screenBounds.size.width);
    NSLog(@"screenBounds.height: %f", screenBounds.size.height);
    
    NSString* deviceModel = [[UIDevice currentDevice] model];    //只能区分iPad, iPhone, iPod Touch
    NSLog(@"deviceModel: %@", deviceModel);
    
    NSString* localizedModel = [[UIDevice currentDevice] localizedModel];   //没啥用 iPhone
    NSLog(@"localizedModel: %@", localizedModel);
    
    NSString* systemName = [[UIDevice currentDevice] systemName];   //没啥用 iPhone OS
    NSLog(@"systemName: %@", systemName);
    
    NSString* systemVersion = [[UIDevice currentDevice] systemVersion]; //iOS系统版本,如9.3.5
    NSLog(@"systemVersion: %@", systemVersion);
    
    NSString* name = [[UIDevice currentDevice] name];   //手机名字,如CHANEL's iPhone 6s Plus
    NSLog(@"name: %@", name);
    
    NSString *uuid = [[NSUUID UUID] UUIDString];    //UUID,如F8C8B3C2-04FD-4082-8C9F-34EF78DBCDA3,每次生成不一样,需要持久化存储在keychain
    NSLog(@"uuid: %@", uuid);
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];     //各种信息
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];    //app名称
    NSLog(@"app名称：%@",appCurName);
    
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];      // app版本号  比如：1.0.1
    NSLog(@"app版本号:%@",appCurVersion);
    
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];      // Build版本号
    NSLog(@"Build版本号：%@",appCurVersionNum);
    /* 字典里的信息
     {
     BuildMachineOSBuild = 15G31;
     CFBundleDevelopmentRegion = "zh_CN";
     CFBundleDisplayName = "\U8bbe\U5907\U4fe1\U606f";
     CFBundleExecutable = DeviceInfoDemo;
     CFBundleIdentifier = "com.chinaums.DeviceInfoDemo";
     CFBundleInfoDictionaryVersion = "6.0";
     CFBundleInfoPlistURL = "Info.plist -- file:///var/containers/Bundle/Application/66FFC712-AFCC-428C-9F03-E7152138E675/DeviceInfoDemo.app/";
     CFBundleName = DeviceInfoDemo;
     CFBundleNumericVersion = 0;
     CFBundlePackageType = APPL;
     CFBundleShortVersionString = "1.2.1";
     CFBundleSignature = "????";
     CFBundleSupportedPlatforms =     (
     iPhoneOS
     );
     CFBundleVersion = 467;
     DTCompiler = "com.apple.compilers.llvm.clang.1_0";
     DTPlatformBuild = 13E230;
     DTPlatformName = iphoneos;
     DTPlatformVersion = "9.3";
     DTSDKBuild = 13E230;
     DTSDKName = "iphoneos9.3";
     DTXcode = 0731;
     DTXcodeBuild = 7D1014;
     LSRequiresIPhoneOS = 1;
     MinimumOSVersion = "8.0";
     UIDeviceFamily =     (
     1,
     2
     );
     UILaunchStoryboardName = LaunchScreen;
     UIMainStoryboardFile = Main;
     UIRequiredDeviceCapabilities =     (
     arm64
     );
     UISupportedInterfaceOrientations =     (
     UIInterfaceOrientationPortrait,
     UIInterfaceOrientationLandscapeLeft,
     UIInterfaceOrientationLandscapeRight
     );
     }
     */
    
}

-(void)action {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    CGFloat batteryLevel = [[UIDevice currentDevice] batteryLevel]; //手机电量,0~1.0浮点值 -1为未知,如模拟器
    [lb setTitle:[NSString stringWithFormat:@"%.2f", batteryLevel] forState:UIControlStateNormal];
}

+ (NSString*)deviceModelName {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    //iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceModel isEqualToString:@"iPad4,4"]
        ||[deviceModel isEqualToString:@"iPad4,5"]
        ||[deviceModel isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceModel isEqualToString:@"iPad4,7"]
        ||[deviceModel isEqualToString:@"iPad4,8"]
        ||[deviceModel isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return deviceModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
