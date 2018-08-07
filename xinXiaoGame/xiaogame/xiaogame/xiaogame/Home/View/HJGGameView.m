//
//  HJGGameView.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGGameView.h"

@implementation HJGGameView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
 
    [self backImageView];
    
    [self zhuangImageView];
    
    
    [self zhuangCuo1];
    
    [self zhuangCuo10];
    
    [self zhuangCuo100];
    
    [self zhuangCuo500];
    
    [self zhuangPai1];
    
    [self zhuangPai2];
    
    [self zhuangPai3];
    
    [self zhuangNormal];
    
    [self xianNormal];
    
    [self winImageView];
    
    [self xianIcon];
    
    [self xianPai1];

    [self xianPai2];
    
    [self xianPai3];
    
    [self xianMoneyLab];
    
    [self xianCuo1];
    
    [self xianCuo10];
    
    [self xianCuo100];
    
    [self xianCuo500];
    
    [self dealBut];
    
    [self paiImageView];
    
    [self middleMoneyImageView];
    
    [self middleMoneyLab];
    
}


- (UIImageView *)backImageView
{
    if (!_backImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"zhuozi"];
        [self addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(H(50));
            make.left.equalTo(self).offset(-W(42));
            make.right.equalTo(self).offset(W(42));
            make.top.equalTo(self).offset(H(52));
        }];
        _backImageView = theView;
    }
    return _backImageView;
}


- (UIImageView *)zhuangImageView
{
    if (!_zhuangImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"zhuangIcon"];
        [self addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
            make.size.equalTo(CGSizeMake(W(120), H(150)));
        }];
        _zhuangImageView = theView;
    }
    return _zhuangImageView;
}

- (UIButton *)zhuangCuo1
{
    if (!_zhuangCuo1) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_1"] forState:UIControlStateNormal];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.left.equalTo(self.backImageView).offset(W(80));
            make.top.equalTo(self.backImageView).offset(H(100));
        }];
        _zhuangCuo1 = theView;
    }
    return _zhuangCuo1;
}


- (UIButton *)zhuangCuo10
{
    if (!_zhuangCuo10) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_10"] forState:UIControlStateNormal];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.left.equalTo(self.backImageView).offset(W(160));
            make.top.equalTo(self.backImageView).offset(H(60));
        }];
        _zhuangCuo10 = theView;
    }
    return _zhuangCuo10;
}


- (UIButton *)zhuangCuo100
{
    if (!_zhuangCuo100) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_100"] forState:UIControlStateNormal];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.left.equalTo(self.backImageView).offset(W(240));
            make.top.equalTo(self.backImageView).offset(H(60));
        }];
        _zhuangCuo100 = theView;
    }
    return _zhuangCuo100;
}

- (UIButton *)zhuangCuo500
{
    if (!_zhuangCuo500) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_500"] forState:UIControlStateNormal];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.right.equalTo(self.backImageView).offset(W(-85));
            make.top.equalTo(self.backImageView).offset(H(100));
        }];
        _zhuangCuo500 = theView;
    }
    return _zhuangCuo500;
}

- (UIImageView *)zhuangPai1
{
    if (!_zhuangPai1) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"2_Q"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(60), H(80)));
            make.left.equalTo(self.zhuangCuo1.right).offset(W(30));
            make.top.equalTo(self.zhuangCuo1.bottom);
        }];
        _zhuangPai1 = theView;
    }
    return _zhuangPai1;
}


- (UIImageView *)zhuangPai2
{
    if (!_zhuangPai2) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"2_6"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(60), H(80)));
            make.left.equalTo(self.zhuangPai1.left).offset(W(40));
            make.top.equalTo(self.zhuangPai1);
        }];
        _zhuangPai2 = theView;
    }
    return _zhuangPai2;
}

- (UIImageView *)zhuangPai3
{
    if (!_zhuangPai3) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"3_3"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(60), H(80)));
            make.left.equalTo(self.zhuangPai2.left).offset(W(40));
            make.top.equalTo(self.zhuangPai1);
        }];
        _zhuangPai3 = theView;
    }
    return _zhuangPai3;
}

- (UIImageView *)zhuangNormal
{
    if (!_zhuangNormal) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"Normal"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.backImageView);
            make.top.equalTo(self.zhuangPai1.bottom);
            make.size.equalTo(CGSizeMake(W(150), H(30)));
        }];
        _zhuangNormal = theView;
    }
    return _zhuangNormal;
}


- (UIImageView *)winImageView
{
    if (!_winImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"win"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.backImageView);
            make.size.equalTo(CGSizeMake(W(160), H(90)));
            make.centerY.equalTo(self.backImageView.centerY).offset(H(10));
        }];
        _winImageView = theView;
    }
    return _winImageView;
}

- (UIImageView *)xianNormal
{
    if (!_xianNormal) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"Normal"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.backImageView);
            make.bottom.equalTo(self.xianPai1.top).offset(H(-H(3)));
            make.size.equalTo(CGSizeMake(W(150), H(30)));
        }];
        _xianNormal = theView;
    }
    return _xianNormal;
}


- (UIImageView *)xianPai1
{
    if (!_xianPai1) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"1_K"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(60), H(80)));
            make.left.equalTo(self.zhuangPai1);
            make.bottom.equalTo(self.xianCuo1.top).offset(H(20));
        }];
        _xianPai1 = theView;
    }
    return _xianPai1;
}


- (UIImageView *)xianPai2
{
    if (!_xianPai2) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"2_J"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(60), H(80)));
            make.left.equalTo(self.xianPai1).offset(W(40));
            make.top.equalTo(self.xianPai1);
        }];
        _xianPai2 = theView;
    }
    return _xianPai2;
}


- (UIImageView *)xianPai3
{
    if (!_xianPai3) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"0_9"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(60), H(80)));
            make.left.equalTo(self.xianPai2).offset(W(40));
            make.top.equalTo(self.xianPai1);
        }];
        _xianPai3 = theView;
    }
    return _xianPai3;
}


- (UIButton *)xianCuo1
{
    if (!_xianCuo1) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_1"] forState:UIControlStateNormal];
        theView.tag = 1;
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.left.equalTo(self.backImageView).offset(W(80));
            make.bottom.equalTo(self.backImageView).offset(-H(100));
        }];
        _xianCuo1 = theView;
    }
    return _xianCuo1;
}


- (UIButton *)xianCuo10
{
    if (!_xianCuo10) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_10"] forState:UIControlStateNormal];
        theView.tag = 10;
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.left.equalTo(self.backImageView).offset(W(160));
            make.bottom.equalTo(self.backImageView).offset(-H(60));
        }];
        _xianCuo10 = theView;
    }
    return _xianCuo10;
}


- (UIButton *)xianCuo100
{
    if (!_xianCuo100) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_100"] forState:UIControlStateNormal];
        theView.tag = 100;
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.left.equalTo(self.backImageView).offset(W(240));
            make.bottom.equalTo(self.backImageView).offset(-H(60));
        }];
        _xianCuo100 = theView;
    }
    return _xianCuo100;
}

- (UIButton *)xianCuo500
{
    if (!_xianCuo500) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Chip_500"] forState:UIControlStateNormal];
        theView.tag = 500;
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.right.equalTo(self.backImageView).offset(W(-85));
            make.bottom.equalTo(self.backImageView).offset(-H(100));
        }];
        _xianCuo500 = theView;
    }
    return _xianCuo500;
}

- (UIButton *)dealBut
{
    if (!_dealBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"Deal"] forState:0];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.backImageView).offset(-W(45));
            make.bottom.equalTo(self.xianCuo500.top).offset(-H(70));
            make.size.equalTo(CGSizeMake(W(80), H(80)));
        }];
        _dealBut = theView;
    }
    return _dealBut;
}

- (UIImageView *)xianIcon
{
    if (!_xianIcon) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"4"];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(90), H(90)));
            make.left.equalTo(self.backImageView).offset(W(55));
            make.top.equalTo(self.xianNormal).offset(-H(25));
        }];
        _xianIcon = theView;
    }
    return _xianIcon;
}

- (UILabel *)xianMoneyLab
{
    if (!_xianMoneyLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"$1000";
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(16) weight:UIFontWeightBold];
        theView.textColor = [UIColor whiteColor];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.xianIcon);
            make.top.equalTo(self.xianIcon.bottom);
            make.height.equalTo(H(20));
        }];
        _xianMoneyLab = theView;
    }
    return _xianMoneyLab;
}



- (UIImageView *)paiImageView
{
    if (!_paiImageView) {
        UIImageView * theView = [[UIImageView alloc] initWithFrame:CGRectMake(W(30), H(30), W(50), H(70))];
        theView.image = [UIImage imageNamed:@"paibeimain.jpg"];
        [self addSubview:theView];
        _paiImageView = theView;
    }
    return _paiImageView;
}


- (UIImageView *)middleMoneyImageView
{
    if (!_middleMoneyImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@""];
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.backImageView).offset(W(90));
            make.size.equalTo(CGSizeMake(W(50), H(50)));
            make.centerY.equalTo(self.backImageView);
        }];
        _middleMoneyImageView = theView;
    }
    return _middleMoneyImageView;
}

- (UILabel *)middleMoneyLab
{
    if (!_middleMoneyLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.font = [UIFont systemFontOfSize:W(27) weight:UIFontWeightBold];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.textColor = [UIColor whiteColor];
        theView.text= @"$0";
        [self.backImageView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.middleMoneyImageView.right).offset(W(10));
            make.centerY.equalTo(self.middleMoneyImageView);
            make.height.equalTo(H(30));
        }];
        _middleMoneyLab = theView;
    }
    return _middleMoneyLab;
}

@end
