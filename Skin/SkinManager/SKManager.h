//
//  SKManager.h
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kThemeChangedNotification @"themeChanged"
#define kThemeSkinName @"kThemeSkinName"

@interface SKManager : NSObject

+(instancetype)shareInstance;
-(UIImage *)themeImageWithName:(NSString *)imageName;
//主题名称
@property (nonatomic, strong) NSString *themeName;

@end
