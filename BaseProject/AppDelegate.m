//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "AllNetManager.h"
#import "UIColor+Art.h"
#import "WelcomeViewController.h"
#import "TabViewController.h"
#import <BmobSDK/Bmob.h>
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"


@interface AppDelegate ()

@end
#define  versionKey @"version"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self setupAppearance];
//    [self configGlobalUIStyle];
    // Override point for customization after application launch.
    [Bmob registerWithAppKey:@"1ed94c951cd3306c4bd7820ed99ddee2"];
    [UMSocialData setAppKey:@"572ab2be67e58ea55800000d"];
    
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
//    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
//    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
//    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
//                                              secret:@"04b48b094faeb16683c32669824ebdad"
//                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];


    [self initializeWithApplication:application];
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    //从偏好设置里面取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:versionKey];
    
    //判断是否有新版本
    //如果系统有新版本好就运行新特性
    if (![currentVersion isEqualToString:lastVersion]) {
        WelcomeViewController  *newFecture = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"guide"];
        self.window .rootViewController  = newFecture;
        //保存当前的版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:versionKey];
    }else{
      
        _window.rootViewController = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"home"];
    }
    

    
    
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
     UIEdgeInsets standardEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // Navi
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundColor:YCColor(247, 76, 83)];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"my_topbg"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:24], NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    // Tabbar
//    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"clear.png"]];
//    
//    UIImage * backgroundForTabBar = [[UIImage imageNamed:@"tabbar_back.png"] resizableImageWithCapInsets:standardEdgeInsets
//                                                                                            resizingMode:UIImageResizingModeStretch];
//    [[UITabBar appearance] setBackgroundImage:backgroundForTabBar];
//    
//    UIImage * backgroundForSelectedTabBarItem = [[UIImage imageNamed:@"tabbar_selected_back.png"] resizableImageWithCapInsets:standardEdgeInsets
//                                                                                                                 resizingMode:UIImageResizingModeStretch];
//    [[UITabBar appearance] setSelectionIndicatorImage:backgroundForSelectedTabBarItem];
    
//    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor] }forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSBackgroundColorAttributeName : [UIColor redColor] } forState:UIControlStateHighlighted];
    
    
}
- (void)setupAppearance
{
    UIEdgeInsets standardEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // Navi
    UIImage * backgroundForNavigationBar = [[UIImage imageNamed:@"navigation_back.png"] resizableImageWithCapInsets:standardEdgeInsets
                                                                                                       resizingMode:UIImageResizingModeStretch];
    [[UINavigationBar appearance] setBackgroundImage:backgroundForNavigationBar
                                       forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary * textAttributesOfTitleOnNavigationBar = @{UITextAttributeTextColor: [UIColor colorWithHex:0x222222],
                                                            UITextAttributeTextShadowColor: [UIColor clearColor]};
    
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributesOfTitleOnNavigationBar];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"clear.png"]];
    
    
    
    // Tabbar
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"clear.png"]];
    
    UIImage * backgroundForTabBar = [[UIImage imageNamed:@"tabbar_back.png"] resizableImageWithCapInsets:standardEdgeInsets
                                                                                            resizingMode:UIImageResizingModeStretch];
    [[UITabBar appearance] setBackgroundImage:backgroundForTabBar];
    
    UIImage * backgroundForSelectedTabBarItem = [[UIImage imageNamed:@"tabbar_selected_back.png"] resizableImageWithCapInsets:standardEdgeInsets
                                                                                                                 resizingMode:UIImageResizingModeStretch];
    [[UITabBar appearance] setSelectionIndicatorImage:backgroundForSelectedTabBarItem];
    
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor colorWithHex:0x999999] }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor whiteColor] }
                                             forState:UIControlStateHighlighted];
    
    
    
    
}

@end
