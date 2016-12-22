   //
//  SKManager.m
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "SKManager.h"

@implementation SKManager

+(instancetype)shareInstance
{
    static SKManager *shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        // 读取主题名字
        _themeName = nil;
#warning 读取配置文件 如果有
    }
    return self;
}

- (void)setThemeName:(NSString *)themeName
{
    _themeName = themeName;
    // 设置主题 发通知 改主题
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangedNotification object:nil];
    
}

- (UIImage *)themeImageWithName:(NSString *)imageName
{
    if (self.themeName && imageName)
    {
        return [self imageWithName:imageName];
    }
    else
    {
        UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        return image;
    }
    
}

// 返回图片地址
- (UIImage *)imageWithName:(NSString *)imageName
{
    NSString *themePath = [self themePathWithThemeName];
    //图片路径
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    UIImage *image = [[UIImage imageWithContentsOfFile:imagePath] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (!image)
    {
        NSLog(@"图片为空 检查路径 文件名");
    }
    return image;
}

// 根据主题名获取主题路径
- (NSString *)themePathWithThemeName
{
    NSString *themePath = nil;
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) lastObject];
    NSString *name = [NSString stringWithFormat:@"/Skin/%@",_themeName];
    themePath = [docPath stringByAppendingString:name];
    return themePath;
}

@end
