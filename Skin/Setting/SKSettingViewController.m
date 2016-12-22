//
//  SKSettingViewController.m
//  Skin
//
//  Created by duoyi on 16/12/21.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "SKSettingViewController.h"
#import "SKManager.h"

@interface SKSettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *ident = @"ident";

@implementation SKSettingViewController
{
    UITableViewCell *_selectCell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Setting";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ident];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"圣诞";
    }
    else
    {
        cell.textLabel.text = @"blue";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    _selectCell.accessoryType = UITableViewCellAccessoryNone;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    _selectCell = cell;
    
    if (indexPath.row == 0)
    {
        [[SKManager shareInstance] setThemeName:nil];
    }
    else if (indexPath.row == 1)
    {
       [[SKManager shareInstance] setThemeName:@"blue"];
    }
    
}
@end
