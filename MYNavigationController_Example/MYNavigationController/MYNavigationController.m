//
//  MYNavigationController.m
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "MYNavigationController.h"

@interface MYNavigationController ()
//动画管理
@property (nonatomic, strong) MYAnimationManager *animationManager;

@end

@implementation MYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//管理
- (MYAnimationManager *)animationManager
{
    if (!_animationManager) {
        _animationManager = [[MYAnimationManager alloc]init];
    }
    return _animationManager;
}



- (instancetype)initWithShowFrame:(CGRect)showFrame ShowStyle:(MYPresentedViewShowStyle)showStyle root:(UIViewController *)rootController callback:(handleBack)callback
{
    //断言
    //    NSParameterAssert(![@(showStyle)isKindOfClass:[NSNumber class]]||![@(isBottomMenu)isKindOfClass:[NSNumber class]]);
    if (self = [super initWithRootViewController:rootController]) {
        
        //设置管理
        self.transitioningDelegate          = self.animationManager;
        self.modalPresentationStyle         = UIModalPresentationCustom;
        self.callback                       = callback;
        self.animationManager.showStyle     = showStyle;
        self.animationManager.showViewFrame = showFrame;
    }
    return self;
}



- (void)setClearBack:(BOOL)clearBack
{
    _clearBack = clearBack;
    
    self.animationManager.clearBack = clearBack;
}

@end
