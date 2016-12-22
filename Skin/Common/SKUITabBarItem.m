//
//  SKUITabBarItem.m
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "SKUITabBarItem.h"
#import "SKManager.h"

@implementation SKUITabBarItem

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName selectImage:(NSString *)selectImageName tag:(NSInteger)tag
{
    UIImage *image = [[SKManager shareInstance] themeImageWithName:imageName];
    UIImage *selectImage = [[SKManager shareInstance] themeImageWithName:selectImageName];
    self = [super initWithTitle:title image:image tag:tag];
    if (self)
    {
        self.imageName = imageName;
        self.selectImageName = selectImageName;
        self.selectedImage = selectImage;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImage) name:kThemeChangedNotification object:nil];
    }
    return self;
}

- (void)changeImage
{
    UIImage *image = [[SKManager shareInstance] themeImageWithName:self.imageName];
    self.image = image;
    
    UIImage *selectImage = [[SKManager shareInstance] themeImageWithName:self.selectImageName];
    self.selectedImage = selectImage;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeChangedNotification object:nil];
}

@end
