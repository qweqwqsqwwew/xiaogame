//
//  HJGIconController.m
//  xiaogame
//
//  Created by Developer on 2018/8/4.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGIconController.h"
#import <HXPhotoPicker.h>
@interface HJGIconController ()<HXAlbumListViewControllerDelegate>
@property (strong, nonatomic) HXPhotoManager *manager;
@property (strong, nonatomic) HXDatePhotoToolManager *toolManager;

@property (nonatomic, strong) UIButton *fromPhotoBut;

@end

@implementation HJGIconController

- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        _manager.configuration.singleSelected = YES;
        _manager.configuration.albumListTableView = ^(UITableView *tableView) {
            //            NSSLog(@"%@",tableView);
        };
        _manager.configuration.singleJumpEdit = YES;
        _manager.configuration.movableCropBox = YES;
        _manager.configuration.movableCropBoxEditSize = YES;
        //        _manager.configuration.movableCropBoxCustomRatio = CGPointMake(1, 1);
    }
    return _manager;
}

- (HXDatePhotoToolManager *)toolManager {
    if (!_toolManager) {
        _toolManager = [[HXDatePhotoToolManager alloc] init];
    }
    return _toolManager;
}

- (UIButton *)fromPhotoBut
{
    if (!_fromPhotoBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.backgroundColor = RGB(63, 129, 52);
        [theView setTitle:@"Select an image from album" forState:0];
        [theView addTarget:self action:@selector(fromPhotoButClick) forControlEvents:UIControlEventTouchUpInside];
        [theView setTitleColor:[UIColor whiteColor] forState:0];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(14) weight:UIFontWeightBold];
        theView.layer.cornerRadius = W(4);
        theView.clipsToBounds = YES;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-H(45));
            make.centerX.equalTo(self.view);
            make.size.equalTo(CGSizeMake(W(200), H(60)));
        }];
        _fromPhotoBut = theView;
    }
    return _fromPhotoBut;
}

- (void)fromPhotoButClick{
    
    self.manager.configuration.saveSystemAblum = YES;
    
    __weak typeof(self) weakSelf = self;
    if (self.manager.configuration.requestImageAfterFinishingSelection) {
        [self hx_presentAlbumListViewControllerWithManager:self.manager done:^(NSArray<HXPhotoModel *> *allList, NSArray<HXPhotoModel *> *photoList, NSArray<HXPhotoModel *> *videoList, NSArray<UIImage *> *imageList, BOOL original, HXAlbumListViewController *viewController) {
            // requestImageAfterFinishingSelection = YES 时 imageList才会有值
            NSSLog(@"%ld张图片",photoList.count);
            NSSLog(@"%@",imageList);
        } cancel:^(HXAlbumListViewController *viewController) {
            NSSLog(@"取消了");
        }];
    }else {
        [self hx_presentAlbumListViewControllerWithManager:self.manager done:^(NSArray<HXPhotoModel *> *allList, NSArray<HXPhotoModel *> *photoList, NSArray<HXPhotoModel *> *videoList, NSArray<UIImage *> *imageList, BOOL original, HXAlbumListViewController *viewController) {
            // requestImageAfterFinishingSelection = YES 时 imageList才会有值
            if (photoList.count > 0) {
                //            HXPhotoModel *model = photoList.firstObject;
                //            weakSelf.imageView.image = model.previewPhoto;
                [weakSelf.view showLoadingHUDText:@"获取图片中"];
                [weakSelf.toolManager getSelectedImageList:photoList requestType:0 success:^(NSArray<UIImage *> *imageList) {
                    [weakSelf.view handleLoading];
                    
                    
                    
//                    weakSelf.imageView.image = imageList.firstObject;
                } failed:^{
                    [weakSelf.view handleLoading];
                    [weakSelf.view showImageHUDText:@"获取失败"];
                }];
                NSSLog(@"%ld张图片",photoList.count);
            }else if (videoList.count > 0) {
                [weakSelf.toolManager getSelectedImageList:allList success:^(NSArray<UIImage *> *imageList) {
                    
                    
                    
                    
//                    weakSelf.imageView.image = imageList.firstObject;
                } failed:^{
                    
                }];
                
                // 通个这个方法将视频压缩写入临时目录获取视频URL  或者 通过这个获取视频在手机里的原路径 model.fileURL  可自己压缩
                [weakSelf.view showLoadingHUDText:@"视频写入中"];
                [weakSelf.toolManager writeSelectModelListToTempPathWithList:videoList success:^(NSArray<NSURL *> *allURL, NSArray<NSURL *> *photoURL, NSArray<NSURL *> *videoURL) {
                    NSSLog(@"%@",videoURL);
                    [weakSelf.view handleLoading];
                } failed:^{
                    [weakSelf.view handleLoading];
                    [weakSelf.view showImageHUDText:@"写入失败"];
                    NSSLog(@"写入失败");
                }];
                NSSLog(@"%ld个视频",videoList.count);
            }
        } cancel:^(HXAlbumListViewController *viewController) {
            NSSLog(@"取消了");
        }];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configNav];
    
    [self configView];
    
    [self fromPhotoBut];
}

- (UIColor *)randomColor {
    
    return RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
}
#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Choose Avatar";
    
}

#pragma mark - configView
- (void)configView{
    // 创建一个装载九宫格的容器
    UIView *containerView = [[UIView alloc] init];
    [self.view addSubview:containerView];
    containerView.backgroundColor = [UIColor whiteColor];

    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
    // 给该容器添加布局代码
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(kMarginTopHeight);
        make.right.equalTo(-15);
        make.height.equalTo(H(500));
    }];
    // 为该容器添加宫格View
    for (int i = 0; i < arr.count; i++) {
        UIButton  *view = [[UIButton alloc] init];
        view.tag = 100+i;
        [view addTarget:self action:@selector(iconButClick:) forControlEvents:UIControlEventTouchUpInside];
//        view.image = [UIImage imageNamed:arr[i]];
        [view setImage:[UIImage imageNamed:arr[i]] forState:0];
        [containerView addSubview:view];
    }
    // 执行九宫格布局
    [containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:10 fixedInteritemSpacing:20 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
    
}

- (void)iconButClick:(UIButton *)but{
    
    if (_block) {
        _block(but.imageView.image);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)albumListViewController:(HXAlbumListViewController *)albumListViewController didDoneAllList:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photoList videos:(NSArray<HXPhotoModel *> *)videoList original:(BOOL)original {
    if (photoList.count > 0) {
        HXPhotoModel *model = photoList.firstObject;
        
        
        
//        self.imageView.image = model.previewPhoto;
        
        if (_block) {
            _block(model.previewPhoto);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
        NSSLog(@"%ld张图片",photoList.count);
    }else if (videoList.count > 0) {
        __weak typeof(self) weakSelf = self;
        [self.toolManager getSelectedImageList:allList success:^(NSArray<UIImage *> *imageList) {
            
            
            
//            weakSelf.imageView.image = imageList.firstObject;
        } failed:^{
            
        }];
        
        // 通个这个方法将视频压缩写入临时目录获取视频URL  或者 通过这个获取视频在手机里的原路径 model.fileURL  可自己压缩
        [self.view showLoadingHUDText:@"视频写入中"];
        [self.toolManager writeSelectModelListToTempPathWithList:videoList success:^(NSArray<NSURL *> *allURL, NSArray<NSURL *> *photoURL, NSArray<NSURL *> *videoURL) {
            NSSLog(@"%@",videoURL);
            [weakSelf.view handleLoading];
        } failed:^{
            [weakSelf.view handleLoading];
            [weakSelf.view showImageHUDText:@"写入失败"];
            NSSLog(@"写入失败");
        }];
        NSSLog(@"%ld个视频",videoList.count);
    }
}


@end
