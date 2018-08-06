//
//  BaseDataConfig.h
//  Lottery
//
//  Created by Developer on 2018/3/29.
//  Copyright © 2018年 DH. All rights reserved.
//

#ifndef BaseDataConfig_h
#define BaseDataConfig_h


//全局通知定义名
#define AppLogin  @"appLogin"   //app登录
#define AppOutLogin @"appOutLogin" //app退出登录

#define SIXTog      @"sixTog"      //六合彩选中

#define guanfangLottery   @"guanfangLottery"   //官方彩数据

#define OfficeTimeNot   @"officetimeNot"   //官方彩倒计时post

#define TraditionTimeNot @"TraditionTimeNot" //传统彩倒计时post

#define refreshMoney    @"refreshmoney"    //下单成功刷新余额

#define openAwardNot    @"openAwardNot"    //开奖动画

#define chatOpenWardTimeLost @"chatOpenWardTimeLost"  //聊天倒计时通知

#define deviceTokenNot @"deviceToken"              //聊天推送

#define firstLaunch @"firstLaunch"

#define chat_message_username @"chat_message_username"  //聊天消息带人的usename

#define chat_message_nikename @"chat_message_nikename"  //聊天消息带人的nikename

//审核
#define ShenHeToken   @"ShenHeToken"

#define shenHeServe   @"http://128.199.179.7:8080/"

#define shenHeName    @"shenHeName"

#define is_resiter_push @"is_resiter_push"

#define office_money_danwei  @"office_money_danwei"

//这个宏加上后，可以去掉'mas_'这个前缀了
#define MAS_SHORTHAND
//这个宏加上后，可以去掉自动包装方法的'mas_'前缀
#define MAS_SHORTHAND_GLOBALS
//注意，这两个宏必须定义在这个头文件的上面，因为"Masonry.h"中要用到上面2个宏，如果已经定义过了的话
#import <Masonry.h>

#define videoListUrl(Pages)  [NSString stringWithFormat:@"http://c.m.163.com/nc/video/list/V9LG4B3A0/y/%d-10.html",(Pages-1)*10]

//生产服务器地址



//聊天自定义消息扩展字段key值
#define RED_PacketId     @"redPacketID"

#define RED_PacketIntro   @"redPacketIntro"

#define RED_Packet_from   @"redPacketFrom"

#define RED_Packet_BEGETTER  @"redPacketBeGetter"                 //领红包的人

#define RED_Packet_total_number   @"redPacketTotalNumber"

#define SEND_MONEY_FROM    @"sendMoneyFrom"             //打赏人

#define BE_SEND_MONEY      @"be_sendMoney"                //被打赏人

#define BE_SEND_ICON_URL   @"be_sender_iconUrl"             //被打赏人的头像

#define SEND_MONEY_AMOUNT   @"send_money_amount"            //打赏的金额

#define SEND_MONEY_TIME      @"send_money_time"             //打赏时间

#define SEND_MONEY_ICON_URL   @"send_money_iconUrl"         //打赏人头像

#define HAVE_GET_PACKET_ID     @"have_get_packet_id"          //抢到红包的id

#define ROOM_CHAT_ID         @"room_chat_id"                    //聊天室id

#define Current_room_id     @"Current_room_id"                  //当前roomid

#define chatTimeLostNot     @"ChatTimeLostNot"                  //聊天倒计时通知    让其置空

#define chatNickName        @"chatNickName"                     //聊天nickName

#define sendMoneyFromNickname   @"sendMoneyFromNickname"        //大商人nickName

#define be_sendMoneyNickname @"be_sendMoneyNickname"            //被打赏人的nickname

/*********************************************************************************************************************************************/

#define is_TCP        @"1"                                      //是否走TCP

//#define Socket_token_url  @"https://35.201.253.4:443/platform/web/v1/draw/token"       //socket请求的url

#define APPUserId  @"admin@ruok.co"
#define APPPwd     @"ruok123"                                //未登录状态的管理员id和密码


#define parent_user_type @"parent_user_type"                 //记录这个房间是不是测试房间

#define fobid_words @"fobid_words"                          //禁止说话的敏感词

//默认域名
#define defaultServe_host   @"defaultServe_host"

//网络状态
#define network_status   @"network_status"

//存储的github上新域名数组字段
#define newHost_fromGithub  @"newHost_fromGithub"

#define TCPMoney_change   @"TCPMoney_change"

#define MoneyEditCommen   @"MoneyEditCommen"

#define MoneyEditOffice   @"MoneyEditOffice"

//全局主题色
#define APPColor [UIColor colorWithHexRGB:0xf6f6fa]

#define  hiddenAll @"hiddenAll"

//购彩页滑动点击
#define  BUYScrollAnimation  @"BUYScrollAnimation"

#define RSA_Privite_Key        @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKTsPxVFs46szp+1CqmzFAGvJ9Nx+CIG/F/9j8rk8zmmSay2/O1bME/s5h9aUU3UW/YkjGwJQtxkrVO9SzBOrGMyUm+A+kslL2tQf2f+RBYJCQv8GTydOFjc/7AR1Nfj/WYJglEyVJY/01+3T0Lb/cJSM7mvDfZs/wfFMbiOWGwtAgMBAAECgYBRO2v29lXyuHstfua5n1MDYVqkc0ZcvEQio6nnrc1/X8B6Kcd6waeSNoVCfCH/y9Ff87CWphkgpRYaYOpf6OBPUPnoB1Aa5tUJuoQjpCyl9OPI4d67tnzkwBa4t4iit+Dk4bYyqLXO+ra8co1uV/H3VVKeYcC/C1seNmwkZYZqAQJBANo1NKXU0IFlxzGroMe/tT+6SwztTfL4ExsuDUuiJdAy1oYJEbQq/7gXIS4yvkEWkCQIiXn02yhbHsLevXySUxECQQDBfIQgC+SqIfOvDeiE3oQtJ/Fsu2Z4kaWE8p7q/D34GcP2OJAj0DJYvaWPUGiljzQnHGBTz/LB/XtdONGwrk9dAkEAuxtMXbYyZAJl382PPDjCrjaMDDWf1Wuq1m+SrvwG+JPfJ2e3aopEZBJRPU/9m8pBJuS7HXw8QEqCAg8E5ECEQQJAIj/5X3bbfmZOLZGntEVzXk7wxI+TvwoBI7yS9wO5sH5XGvG+SiijkOPZN7pDG/Nyhu3V+2AXF9HYEZNqQv1IHQJAQ9klodKDDjS5gNnb7fxsSJ95+Hxt3Fz+bG3hqrqjzaVdSPUWbWYo8Jtu0zY8kmQaU5gg+hcj88w/68UftLlTzA=="

#define FontCommenColor [UIColor colorWithIntegerRed:63 green:63 blue:63]

#define FontSelectColor [UIColor colorWithIntegerRed:102 green:29 blue:172]


#define MW(float) [UIView setMWidth:(float)]
#define MH(float) [UIView setMHeight:(float)]

#define NW(float) MW(float * 1.15 / 3.0)
#define NH(float) MH(float * 1.15 / 3.0)
//屏幕适配
//适配
#define W(float) [UIView setWidth:(float)]
#define H(float) [UIView setHeight:(float)]


#define DefineSize(float) (float * 1.15 / 3.0) * 320.f / 414.f

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define F(float) [UIFont SHSystemFontOfSize:float/(96/72)]


//已经下单的标志
#define HavePlaceOrderID @"HavePlaceOrderID"

//官方彩购彩页注单设定页面弹出标志
#define officeLotterySureSetting  @"officeLotterySureSetting"

#define kStatusBarHeight 20

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define kNavigationBarHeight (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define kMarginTopHeight (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define kTabBarHeight (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)



#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define IOS11_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )

#define IOS10_OR_EARLIER    ( !IOS11_OR_LATER )
#define IOS9_OR_EARLIER     ( !IOS10_OR_LATER )


//适配

#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


#endif /* BaseDataConfig_h */
