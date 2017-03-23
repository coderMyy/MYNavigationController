//
//  MYContainerController.m
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "MYContainerController.h"
#import "MYBackView.h"

@interface MYContainerController ()

//蒙板点击层 (只处理点击)
@property (nonatomic, strong) UIControl *coverView;
//蒙板背景展示图(只处理颜色展示)
@property (nonatomic, strong) MYBackView *backView;

@end

@implementation MYContainerController

- (MYBackView *)backView
{
    if (!_backView) {
        _backView = [[MYBackView alloc]initWithFrame:my_Screen_Bounds];
        if (self.isNeedClearBack) {
            
            _backView.backColorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.000001];
        }else{
            
            _backView.backColorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            if (_showFrame.origin.y > 64) {
                _backView.topView.backgroundColor   = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            }
        }
        [_backView addSubview:self.coverView];
    }
    return _backView;
}

//蒙板
- (UIControl *)coverView
{
    if (!_coverView) {
        
        _coverView = [[UIControl alloc]initWithFrame:my_Screen_Bounds];
        [_coverView addTarget:self action:@selector(coverViewTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverView;
}


//重写布局
- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
    //容器frame,不能遮挡导航栏 , 透明除外
    self.containerView.frame = my_Screen_Bounds;
    self.presentedView.frame = self.showFrame;
    [self.containerView insertSubview:self.backView belowSubview:self.presentedView];
}


//蒙板点击
- (void)coverViewTouch
{
    [UIView animateWithDuration:0.1 animations:^{
        self.backView.backColorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.001];
        self.backView.topView.backgroundColor       = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.001];
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    } completion:^(BOOL finished) {
        
        if ([self.presentedViewController isKindOfClass:[MYNavigationController class]]) {
            MYNavigationController *presentedVc           = (MYNavigationController *)self.presentedViewController;
            presentedVc.presented                        = NO;
        }
        [self.coverView removeFromSuperview];
    }];
}

@end
