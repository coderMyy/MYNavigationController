//
//  MYContainerController.h
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYNavigationController.h"

@interface MYContainerController : UIPresentationController

@property (nonatomic, assign) MYPresentedViewShowStyle style;
@property (nonatomic, assign,getter=isNeedClearBack) BOOL clearBack;
//frame
@property (assign, nonatomic) CGRect showFrame;

@end
