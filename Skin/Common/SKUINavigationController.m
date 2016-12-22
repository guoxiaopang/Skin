//
//  SKUINavigationController.m
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "SKUINavigationController.h"
#import "SKManager.h"

@interface SKUINavigationController ()

@end

@implementation SKUINavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSkin) name:kThemeChangedNotification object:nil];
}

- (void)changeSkin
{
    UIImage *image = [[SKManager shareInstance] themeImageWithName:@"navigationbar_background.png"];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeChangedNotification object:nil];
}

@end
