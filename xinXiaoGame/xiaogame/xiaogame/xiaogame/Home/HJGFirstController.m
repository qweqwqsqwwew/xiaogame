//
//  HJGFirstController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGFirstController.h"
#import <AXWebViewController.h>
#import "HJGGameController.h"
#define r9rkRM8w @"r9rkRM8w.api.lncld"
@interface HJGFirstController ()

@end

@implementation HJGFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [SVProgressHUD showWithStatus:@"正在载入..."];
    
    [self judgerFrom];
    
}

#pragma mark - loadVC

- (void)loadVC{
    
    HJGGameController *vc = [[HJGGameController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];

}


//时间
- (NSString *)judge{
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
    NSDate *currendate = [dateFormatter dateFromString:dateTime];
    NSDate *date = [dateFormatter dateFromString:@"2018-08-12"];
    NSComparisonResult result = [date compare:currendate];
    if (result == NSOrderedDescending)
    {
        return @"disi";
    }
    else if (result == NSOrderedAscending)
    {
        return @"diwu";
    }
    return @"meile";
}


- (void)judgerFrom{
    
    if ([[self judge] isEqualToString:@"disi"]) {
        
        [self loadVC];
        [SVProgressHUD dismiss];
        
    }else if ([[self judge] isEqualToString:@"diwu"]){
        
        [self get];
    }else{
        
        [self loadVC];
        [SVProgressHUD dismiss];
    }
    
    
    
}


- (void)get{
    
    [BANetManager ba_setValue:@"r9rkRM8wke9zXJ39PJf5xJRz-gzGzoHsz" forHTTPHeaderKey:@"X-LC-Id"];

    [BANetManager ba_setValue:@"PEvWi0VfpmNiqum2OT729fpe" forHTTPHeaderKey:@"X-LC-Key"];
    

    NSString *gaga  = [NSString stringWithFormat:@"%@",r9rkRM8w];

    NSString *hh = [NSString stringWithFormat:@"https://%@.net/1.1/classes/config/5ad95842ee920a3f733ffe27",gaga];
    
    [HJGNetManger getUrl:hh IsNeedCashe:NO responseSuccess:^(id response) {
        if ([response[@"isOpen"] intValue] == 1) {
            [SVProgressHUD dismiss];
            
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:response[@"openUrl"]];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
            nav.navigationBar.tintColor = [UIColor colorWithRed:0.322 green:0.322 blue:0.322 alpha:1.00];
            
            [HJGSaveTool setObject:response[@"jpushKey"] forKey:@"jpushKey"];
            [self presentViewController:nav animated:NO completion:NULL];
            webVC.showsToolBar = YES;
            webVC.navigationType = 1;
        }else{
            [self loadVC];
            [SVProgressHUD dismiss];
        }
    } responseFail:^(NSError *error) {
        [self loadVC];
        [SVProgressHUD dismiss];
        
    }];
}


@end
