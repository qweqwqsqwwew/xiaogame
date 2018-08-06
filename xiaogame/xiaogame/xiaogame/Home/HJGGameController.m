//
//  HJGGameController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGGameController.h"
#import "HJGGameView.h"
#import "HJGSettingController.h"
#import "AceGooeyMenu.h"
#import "HJGIconController.h"
#import "HJGAboutController.h"
#import "HJGLevelController.h"
@interface HJGGameController ()<AceGooeyMenuDelegate>


@property (nonatomic, strong) HJGGameView *gameView;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger xianTotal;

@end

@implementation HJGGameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configBaseData];
    
    [self configNav];
    
    [self configView];
}

- (void)configBaseData{
    
    self.xianTotal = 10000;
    
    self.total = 0;
    
    self.dataArr = @[@"0_1",@"0_2",@"0_3",@"0_4",@"0_5",@"0_6",@"0_7",@"0_8",@"0_9",@"0_10",@"0_J",@"0_Q",@"0_K",
                  @"1_1",@"1_2",@"1_3",@"1_4",@"1_5",@"1_6",@"1_7",@"1_8",@"1_9",@"1_10",@"1_J",@"1_Q",@"1_K",
                  @"2_1",@"2_2",@"2_3",@"2_4",@"2_5",@"2_6",@"2_7",@"2_8",@"2_9",@"2_10",@"2_J",@"2_Q",@"2_K",
                  @"3_1",@"3_2",@"3_3",@"3_4",@"3_5",@"3_6",@"3_7",@"3_8",@"3_9",@"3_10",@"3_J",@"3_Q",@"3_K",
                     ];
    
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
}

#pragma mark - configView
- (void)configView{
    self.view.backgroundColor = RGB(63, 129, 52);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[[UIView alloc]init]];
    
    [self gameView];
    
    self.gameView.xianMoneyLab.text = [NSString stringWithFormat:@"$%ld",self.xianTotal];
    
    CGPoint point = CGPointMake(WIDTH- W(40), kMarginTopHeight + H(60));
    
    AceGooeyMenu *vi = [[AceGooeyMenu alloc] initWithArcWithCenter:point radius:35 BubbleColor:[UIColor blueColor]];
    vi.BuddleStrArr = @[@"头像", @"关于", @"等级"];
    vi.delegate = self;
    
    [self.view addSubview:vi];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [vi click];
    });
    
    
    [self firstLoading];
}


- (void)buddleButtonClick:(NSUInteger)btnNum
{
    NSLog(@"%ld",btnNum);
    
    if (btnNum == 0) {
        HJGIconController *icVC = [[HJGIconController alloc]init];
        @weakify_self;
        icVC.block = ^(UIImage *value) {
            @strongify_self;
            self.gameView.xianIcon.image = value;
        };
        [self.navigationController pushViewController:icVC animated:YES];
    }else if (btnNum ==1){
        HJGAboutController *vc = [[HJGAboutController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (btnNum ==2){
        HJGLevelController *vc = [[HJGLevelController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}


- (HJGGameView *)gameView
{
    if (!_gameView) {
        HJGGameView * theView = [[HJGGameView alloc] init];
        theView.backImageView.userInteractionEnabled = YES;
        [theView.dealBut addTarget:self action:@selector(dealButClick) forControlEvents:UIControlEventTouchUpInside];
        [theView.xianCuo1 addTarget:self action:@selector(pressChou:) forControlEvents:UIControlEventTouchUpInside];
        [theView.xianCuo10 addTarget:self action:@selector(pressChou:) forControlEvents:UIControlEventTouchUpInside];
        [theView.xianCuo100 addTarget:self action:@selector(pressChou:) forControlEvents:UIControlEventTouchUpInside];
        [theView.xianCuo500 addTarget:self action:@selector(pressChou:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(kMarginTopHeight - 30);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
        _gameView = theView;
    }
    return _gameView;
}


- (void)onClickRight{
    
    HJGSettingController *vc = [[HJGSettingController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 初始化状态

- (void)firstLoading{
    
    self.gameView.zhuangPai1.alpha = 0.f;
    self.gameView.zhuangPai2.alpha = 0.f;
    self.gameView.zhuangPai3.alpha = 0.f;
    self.gameView.zhuangNormal.alpha = 0.f;
    self.gameView.winImageView.alpha = 0.f;
    self.gameView.xianNormal.alpha = 0.f;
    self.gameView.xianPai1.alpha = 0.f;
    self.gameView.xianPai2.alpha = 0.f;
    self.gameView.xianPai3.alpha = 0.f;
    
    
    
    
}


#pragma mark - 点击筹码
- (void)pressChou:(UIButton *)but{
    
    but.userInteractionEnabled = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        but.userInteractionEnabled = YES;
    });
    
    UIButton *zhuangB = nil;
    if (but.tag == 1) {
        zhuangB = self.gameView.zhuangCuo1;
    }else if (but.tag == 10 ){
        zhuangB = self.gameView.zhuangCuo10;
    }else if (but.tag == 100 ){
        zhuangB = self.gameView.zhuangCuo100;
    }else if (but.tag == 500 ){
        zhuangB = self.gameView.zhuangCuo500;
    }
    
    [self addProductsAnimation:but.imageView dropToPoint:CGPointMake(self.gameView.middleMoneyImageView.center.x-50, self.gameView.middleMoneyImageView.center.y) isNeedNotification:YES];
    @weakify_self;
    self.addShopCarFinished = ^{
        @strongify_self;

        dispatch_async(dispatch_get_main_queue(), ^{
            self.gameView.middleMoneyImageView.image = but.imageView.image;
        });
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addProductsAnimation:zhuangB.imageView dropToPoint:self.gameView.middleMoneyImageView.center isNeedNotification:YES];
        self.addShopCarFinished = ^{
        };

    });
    
    self.total = self.total + but.tag *2;
    
    self.gameView.middleMoneyLab.text = [NSString stringWithFormat:@"$%ld",self.total];
    
    
    self.xianTotal = self.xianTotal - but.tag;
    
    
    if (self.xianTotal < 0) {
        
        self.xianTotal = self.xianTotal + 10000;
    }
    
    self.gameView.xianMoneyLab.text = [NSString stringWithFormat:@"$%ld",self.xianTotal];
    
}


- (BOOL)judgeWinAndLose:(NSArray *)arr{
    
    
    NSMutableArray *arrr = [NSMutableArray array];
    
    [arr enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *str_arr = [obj componentsSeparatedByString:@"_"];
        
        [arrr addObject:str_arr[1]];
    }];
    
    int zhuang = [arrr[0] intValue] + [arrr[1] intValue] + [arrr[2] intValue];
    
    int xian = [arrr[3] intValue] + [arrr[4] intValue] + [arrr[5] intValue];
    
    if (xian>zhuang) {
        return YES;
    }else{
        return NO;
    }
    
}


#pragma mark - 点击结算
- (void)dealButClick{
    
    
    if (self.total <1) {
        [SVProgressHUD setMinimumDismissTimeInterval:2.f];
        [SVProgressHUD showErrorWithStatus:@"请先下筹码！！！"];
        return;
    }
    
    self.gameView.xianCuo1.userInteractionEnabled = NO;
    self.gameView.xianCuo10.userInteractionEnabled = NO;
    self.gameView.xianCuo100.userInteractionEnabled = NO;
    self.gameView.xianCuo500.userInteractionEnabled = NO;
    
//    NSMutableArray *randomArray = [[NSMutableArray alloc] init];
//
//    while ([randomArray count] < 6) {
//        int r = arc4random() % [self.dataArr count];
//        [randomArray addObject:[self.dataArr objectAtIndex:r]];
//    }
//
    
    NSMutableSet *randomSet = [[NSMutableSet alloc] init];
    
    while ([randomSet count] < 6) {
        int r = arc4random() % [self.dataArr count];
        [randomSet addObject:[self.dataArr objectAtIndex:r]];
    }
    
    NSArray *randomArray = [randomSet allObjects];
    
    self.gameView.zhuangPai1.image = [UIImage imageNamed:randomArray[0]];
    self.gameView.zhuangPai2.image = [UIImage imageNamed:randomArray[1]];
    self.gameView.zhuangPai3.image = [UIImage imageNamed:randomArray[2]];
    self.gameView.xianPai1.image = [UIImage imageNamed:randomArray[3]];
    self.gameView.xianPai2.image = [UIImage imageNamed:randomArray[4]];
    self.gameView.xianPai3.image = [UIImage imageNamed:randomArray[5]];
    
    
    if ([self judgeWinAndLose:randomArray]) {
        self.gameView.winImageView.image  = [UIImage imageNamed:@"win"];
        self.xianTotal = self.xianTotal + self.total;
    }else{
        
        self.gameView.winImageView.image = [UIImage imageNamed:@"lose"];
    }
    
    
    self.gameView.dealBut.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.gameView.dealBut.userInteractionEnabled = YES;
    });
    
    
    
    
    
    
    CGFloat m = 0.9;
    
    [self addProductsAnimation:self.gameView.paiImageView dropToPoint:self.gameView.zhuangPai1.center isNeedNotification:YES];
    @weakify_self;
    self.addShopCarFinished = ^{
        @strongify_self;
        self.gameView.zhuangPai1.alpha = 1.f;
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1* m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addProductsAnimation:self.gameView.paiImageView dropToPoint:self.gameView.zhuangPai2.center isNeedNotification:YES];
        @weakify_self;
        self.addShopCarFinished = ^{
            @strongify_self;
            self.gameView.zhuangPai1.alpha = 1.f;
            self.gameView.zhuangPai2.alpha = 1.f;
        };
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2* m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addProductsAnimation:self.gameView.paiImageView dropToPoint:self.gameView.zhuangPai3.center isNeedNotification:YES];
        @weakify_self;
        self.addShopCarFinished = ^{
            @strongify_self;
            self.gameView.zhuangPai1.alpha = 1.f;
            self.gameView.zhuangPai2.alpha = 1.f;
            self.gameView.zhuangPai3.alpha = 1.f;
        };
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addProductsAnimation:self.gameView.paiImageView dropToPoint:self.gameView.xianPai1.center isNeedNotification:YES];
        @weakify_self;
        self.addShopCarFinished = ^{
            @strongify_self;
            self.gameView.zhuangPai1.alpha = 1.f;
            self.gameView.zhuangPai2.alpha = 1.f;
            self.gameView.zhuangPai3.alpha = 1.f;
            self.gameView.xianPai1.alpha = 1.f;
            
        };
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4* m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addProductsAnimation:self.gameView.paiImageView dropToPoint:self.gameView.xianPai2.center isNeedNotification:YES];
        @weakify_self;
        self.addShopCarFinished = ^{
            @strongify_self;
            self.gameView.zhuangPai1.alpha = 1.f;
            self.gameView.zhuangPai2.alpha = 1.f;
            self.gameView.zhuangPai3.alpha = 1.f;
            self.gameView.xianPai1.alpha = 1.f;
            self.gameView.xianPai2.alpha = 1.f;
            
        };
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5* m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addProductsAnimation:self.gameView.paiImageView dropToPoint:self.gameView.xianPai3.center isNeedNotification:YES];
        @weakify_self;
        self.addShopCarFinished = ^{
            @strongify_self;
            self.gameView.zhuangPai1.alpha = 1.f;
            self.gameView.zhuangPai2.alpha = 1.f;
            self.gameView.zhuangPai3.alpha = 1.f;
            self.gameView.xianPai1.alpha = 1.f;
            self.gameView.xianPai2.alpha = 1.f;
            self.gameView.xianPai3.alpha = 1.f;

            
        };
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7*m  * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.gameView.winImageView.alpha = 1.f;
        self.gameView.zhuangNormal.alpha = 1.f;
        self.gameView.xianNormal.alpha = 1.f;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9*m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self firstLoading];
        
        self.gameView.middleMoneyImageView.image = [UIImage imageNamed:@""];
        
        self.gameView.middleMoneyLab.text  = @"$0";
        self.gameView.xianMoneyLab.text = [NSString stringWithFormat:@"$%ld",self.xianTotal];
        
        self.gameView.xianCuo1.userInteractionEnabled = YES;
        self.gameView.xianCuo10.userInteractionEnabled = YES;
        self.gameView.xianCuo100.userInteractionEnabled = YES;
        self.gameView.xianCuo500.userInteractionEnabled = YES;
    });
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9.2*m * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self dealButClick];
//    });
    
    
    
    self.total = 0;

}





@end
