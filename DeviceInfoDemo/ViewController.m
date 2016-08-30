//
//  ViewController.m
//  DeviceInfoDemo
//
//  Created by CHANEL on 16/8/30.
//  Copyright © 2016年 cici. All rights reserved.
//

#import "ViewController.h"

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
    
    CGRect screenBounds = [ [UIScreen mainScreen]bounds];   //获取屏幕视觉尺寸,如6splus的宽度是414(设计尺寸1242 × 2208,物理尺寸1080 × 1920)
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
    
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    CGFloat batteryLevel = [[UIDevice currentDevice] batteryLevel]; //手机电量,0~1.0浮点值 -1为未知,如模拟器
    [lb setTitle:[NSString stringWithFormat:@"%.2f", batteryLevel] forState:UIControlStateNormal];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];     // 当前应用名称
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSLog(@"当前应用名称：%@",appCurName);
    
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];      // 当前应用软件版本  比如：1.0.1
    NSLog(@"当前应用软件版本:%@",appCurVersion);
    
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];      // 当前应用版本号码   int类型
    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
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
    CGFloat batteryLevel = [[UIDevice currentDevice] batteryLevel];

//    [[NSNotificationCenter defaultCenter]
//     addObserverForName:UIDeviceBatteryLevelDidChangeNotification
//     object:nil queue:[NSOperationQueue mainQueue]
//     usingBlock:^(NSNotification *notification) {
//         // Level has changed
//         NSLog(@"Battery Level Change");
//         NSLog(@"电池电量：%.2f", [UIDevice currentDevice].batteryLevel);
//
//     }];
    [lb setTitle:[NSString stringWithFormat:@"%.2f", batteryLevel] forState:UIControlStateNormal];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
