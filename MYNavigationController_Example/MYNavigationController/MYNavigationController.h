//
//  MYNavigationController.h
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYAnimationManager.h"

@interface MYNavigationController : UINavigationController

//创建菜单
- (instancetype)initWithShowFrame:(CGRect)showFrame ShowStyle:(MYPresentedViewShowStyle)showStyle root:(UIViewController *)rootController callback:(handleBack)callback;
//是否展开
@property (nonatomic, assign,getter=isPresented) BOOL presented;
//是否需要显示透明蒙板
@property (nonatomic, assign,getter=isNeedClearBack) BOOL clearBack;
//回调
@property (copy, nonatomic)handleBack callback;

@end
