 //
//  HJGNetManger.m
//  Lottery
//
//  Created by DH on 2017/8/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGNetManger.h"
#import "HJGTabBarController.h"
#import "AppDelegate.h"
#import <BADataEntity.h>
#define RSA_Privite_key        @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKTsPxVFs46szp+1CqmzFAGvJ9Nx+CIG/F/9j8rk8zmmSay2/O1bME/s5h9aUU3UW/YkjGwJQtxkrVO9SzBOrGMyUm+A+kslL2tQf2f+RBYJCQv8GTydOFjc/7AR1Nfj/WYJglEyVJY/01+3T0Lb/cJSM7mvDfZs/wfFMbiOWGwtAgMBAAECgYBRO2v29lXyuHstfua5n1MDYVqkc0ZcvEQio6nnrc1/X8B6Kcd6waeSNoVCfCH/y9Ff87CWphkgpRYaYOpf6OBPUPnoB1Aa5tUJuoQjpCyl9OPI4d67tnzkwBa4t4iit+Dk4bYyqLXO+ra8co1uV/H3VVKeYcC/C1seNmwkZYZqAQJBANo1NKXU0IFlxzGroMe/tT+6SwztTfL4ExsuDUuiJdAy1oYJEbQq/7gXIS4yvkEWkCQIiXn02yhbHsLevXySUxECQQDBfIQgC+SqIfOvDeiE3oQtJ/Fsu2Z4kaWE8p7q/D34GcP2OJAj0DJYvaWPUGiljzQnHGBTz/LB/XtdONGwrk9dAkEAuxtMXbYyZAJl382PPDjCrjaMDDWf1Wuq1m+SrvwG+JPfJ2e3aopEZBJRPU/9m8pBJuS7HXw8QEqCAg8E5ECEQQJAIj/5X3bbfmZOLZGntEVzXk7wxI+TvwoBI7yS9wO5sH5XGvG+SiijkOPZN7pDG/Nyhu3V+2AXF9HYEZNqQv1IHQJAQ9klodKDDjS5gNnb7fxsSJ95+Hxt3Fz+bG3hqrqjzaVdSPUWbWYo8Jtu0zY8kmQaU5gg+hcj88w/68UftLlTzA=="
@implementation HJGNetManger

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)HJGGet:(NSString *)url IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    
    [HJGNetManger HJGGet:url withHost:@"" IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];
}


+ (void)HJGGet:(NSString *)url withHost:(NSString*)host IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = [NSString stringWithFormat:@"%@%@",host,url];
        baData.needCache = NO;
        
        
        [BANetManager ba_request_GETWithEntity:baData successBlock:^(id response) {
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];

                                [HJGSaveTool setObject:@"0" forKey:@"haveNetCount"];
                            successBlock(json[@"data"]);

                
        } failureBlock:^(NSError *error) {
                
                failBlock(error);

                
        } progressBlock:nil];

}



+ (void)HJGPost:(NSString *)url withHost:(NSString*)host paramDic:(NSDictionary *)dic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    

        BADataEntity *baData = [BADataEntity new];
        baData.urlString = [NSString stringWithFormat:@"%@%@",host,url];
        baData.parameters = dic;
        baData.needCache = NO;
        
        [BANetManager ba_request_POSTWithEntity:baData successBlock:^(id response) {
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];

                            successBlock(json[@"data"]);

                
        } failureBlock:^(NSError *error) {

                
                        failBlock(error);
        } progressBlock:nil];
        
}


+ (void)HJGPost:(NSString *)url paramDic:(NSDictionary *)dic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

    [HJGNetManger HJGPost:url withHost:@"" paramDic:dic IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];
}


//获取首页轮播信息
+ (void)getSlideshow:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    
    [self HJGGet:rArgument IsNeedCashe:NO responseSuccess:successBlock responseFail:failBlock];

}


//获取首页lottery——notice数据
+ (void)getHomeLotteryNotice:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

    [self HJGGet:rArgument IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];

}

//获取开奖数据
+ (void)getOpenAwardData:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

     [self HJGGet:rArgument IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];

}


//通用get网络请求
+ (void)getCommenData:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    [self HJGGet:rArgument IsNeedCashe:NO responseSuccess:successBlock responseFail:failBlock];
}

//通用post网络请求
+ (void)postCommenData:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

    [self HJGPost:rArgument paramDic:paraDic IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];
}


+ (void)panHidden:(HJGResponseSuccess)su Fail:(HJGResponseFail)fail{
   [self HJGGet:@"mob_safe" IsNeedCashe:NO responseSuccess:su responseFail:fail];
}



+ (void)getUrl:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
        
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = rArgument;
        baData.needCache = NO;
        
        
        [BANetManager ba_request_GETWithEntity:baData successBlock:^(id response) {
//                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
//
                                successBlock(response);
        } failureBlock:^(NSError *error) {
                
                                failBlock(error);
                
        } progressBlock:nil];
        
        
}

+ (void)postUrl:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
        
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = rArgument;
        baData.parameters = paraDic;
        baData.needCache = NO;
        
        [BANetManager ba_request_POSTWithEntity:baData successBlock:^(id response) {
//                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
//
                                successBlock(response);
        } failureBlock:^(NSError *error) {
                               failBlock(error);
        } progressBlock:nil];
        
}

@end
