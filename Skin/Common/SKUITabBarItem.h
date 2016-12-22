//
//  SKUITabBarItem.h
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKUITabBarItem : UITabBarItem

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *selectImageName;
- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName selectImage:(NSString *)selectImage tag:(NSInteger)tag;

@end
