//
//  HJGSaveTool.m
//  Lottery
//
//  Created by DH on 2017/7/31.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGSaveTool.h"

@implementation HJGSaveTool

+ (void)setObject:(id)value forKey:(NSString *)defaultName{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+(void)setValue:(id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(id)valueForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+(void)removeObjectForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)clearAll {
    NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = userDefatluts.dictionaryRepresentation;;
    for(NSString* key in [dictionary allKeys]){
        if ([key isEqualToString:@"isFirst"]) {
            continue;
        }
        
        if (![key isEqualToString:@"dhGuidePage"]&&![key isEqualToString:firstLaunch]&&![key isEqualToString:@"shenhere"]&&![key isEqualToString:@"shenhetongji"]&&![key isEqualToString:@"NH_UUID"]&&![key isEqualToString:@"NH_UUID_IS_FIRST_CREAT"]&&![key isEqualToString:ShenHeToken]&&![key isEqualToString:defaultServe_host]&&![key isEqualToString:network_status]&&![HJGSaveTool objectForKey:newHost_fromGithub]&&![key isEqualToString:MoneyEditCommen]&&![HJGSaveTool objectForKey:MoneyEditOffice]&&![HJGSaveTool objectForKey:office_money_danwei]) {
            [userDefatluts removeObjectForKey:key];
            [userDefatluts synchronize];
        }
    }
}


@end
