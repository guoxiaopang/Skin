//
//  SKUITabBarController.m
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "SKUITabBarController.h"
#import "SKManager.h"

@interface SKUITabBarController ()

@end

@implementation SKUITabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImage) name:kThemeChangedNotification object:nil];
    
}

- (void)changeImage
{
    UIImage *image = [[SKManager shareInstance] themeImageWithName:@"tabbar_background.png"];
    self.tabBar.backgroundImage = image;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeChangedNotification object:nil];
}

@end
