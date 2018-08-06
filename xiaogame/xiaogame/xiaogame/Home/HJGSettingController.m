//
//  HJGSettingController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGSettingController.h"

@interface HJGSettingController ()

@end

@implementation HJGSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"个人中心";
    
}

#pragma mark - configView
- (void)configView{
    
    self.view.backgroundColor = [UIColor redColor];
    
}

@end
