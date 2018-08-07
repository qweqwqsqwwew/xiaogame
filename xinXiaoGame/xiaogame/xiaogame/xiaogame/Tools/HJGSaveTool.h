//
//  HJGSaveTool.h
//  Lottery
//
//  Created by DH on 2017/7/31.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Unique_id @"unique_id"
#define Token @"token"
#define UserName @"username"
#define Account @"account"

#define FilterList @"FilterList"



//震动权限全局
#define ISZHEN       @"iszhen"          //震动权限定义
//声音权限
#define ISSHENG       @"isshengyin"     //声音权限定义

@interface HJGSaveTool : NSObject

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setValue:(id)value forKey:(NSString *)defaultName;

+ (id)valueForKey:(NSString *)defaultName;

+(void)removeObjectForKey:(NSString*)key;

+(void)clearAll;


@end
