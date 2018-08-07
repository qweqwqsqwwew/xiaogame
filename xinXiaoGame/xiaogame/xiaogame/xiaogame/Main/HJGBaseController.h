//
//  HJGBaseController.h
//  Lottery
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJGBaseController : UIViewController

@property (nonatomic, strong) NSString *itemCode;


@property (nonatomic, assign) NSInteger itemClass;

//六合彩清空所有数据
@property (nonatomic, assign) BOOL cleanAll;

@end
