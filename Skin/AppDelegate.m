//
//  AppDelegate.m
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "AppDelegate.h"
#import "SKHomeViewController.h"
#import "SKSettingViewController.h"
#import "SKUINavigationController.h"
#import "SKUITabBarItem.h"
#import "SKUITabBarController.h"
#import "SKManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    SKHomeViewController *homeVC = [[SKHomeViewController alloc] init];
    SKSettingViewController *settingVC = [[SKSettingViewController alloc] init];
    SKUINavigationController *homeNavigationVC = [[SKUINavigationController alloc] initWithRootViewController:homeVC];
    SKUINavigationController *settingNavigationVC = [[SKUINavigationController alloc] initWithRootViewController:settingVC];
    
    homeVC.tabBarItem = [[SKUITabBarItem alloc] initWithTitle:@"Home" imageName:@"icon_bangong.png" selectImage:@"icon_bangong_hover.png" tag:1];
    settingVC.tabBarItem = [[SKUITabBarItem alloc] initWithTitle:@"Setting" imageName:@"icon_setting.png" selectImage:@"icon_setting_hover.png" tag:2];
    SKUITabBarController *tabbarVC = [[SKUITabBarController alloc] init];
    tabbarVC.viewControllers = @[homeNavigationVC, settingNavigationVC];
    
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
    
    [self loadSkin];
    return YES;
}

- (void)loadSkin
{
    NSString *skinName = [[NSUserDefaults standardUserDefaults] objectForKey:kThemeSkinName];
    // 设置主题
    [[SKManager shareInstance] setThemeName:skinName];
}

@end
