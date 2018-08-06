//
//  HJGLevelController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGLevelController.h"

@interface HJGLevelController ()

@end

@implementation HJGLevelController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"用户等级";
    
}

#pragma mark - configView
- (void)configView{
    
    
}

@end
