//
//  HJGAboutController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGAboutController.h"

@interface HJGAboutController ()

@end

@implementation HJGAboutController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"关于我们";
    
}

#pragma mark - configView
- (void)configView{
    
    
}

@end
