//
//  MYAnimationManager.h
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define my_Screen_Width  [UIScreen mainScreen].bounds.size.width
#define my_Screen_Height  [UIScreen mainScreen].bounds.size.height
#define my_Screen_Bounds [UIScreen mainScreen].bounds

typedef NS_ENUM(NSInteger){
    
    //从上到下降动画
    MYPresentedViewShowStyleFromTopDropStyle       = 0,
    //从上到下展开动画
    MYPresentedViewShowStyleFromTopSpreadStyle     = 1,
    //从上到下弹簧效果
    MYPresentedViewShowStyleFromTopSpringStyle     = 2,
    //从下到上下降动画
    MYPresentedViewShowStyleFromBottomDropStyle    = 3,
    //从下到上展开动画
    MYPresentedViewShowStyleFromBottomSpreadStyle  = 4,
    //从下到上弹簧效果
    MYPresentedViewShowStyleFromBottomSpringStyle  = 5,
    //直接呈现效果
    MYPresentedViewShowStyleSuddenStyle  = 6
    
}MYPresentedViewShowStyle;

typedef void(^handleBack)(id callback);

@interface MYAnimationManager : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>

//记录当前模态状态
@property (nonatomic, assign,getter=isPresented) BOOL presented;
//动画类型
@property (assign, nonatomic) MYPresentedViewShowStyle showStyle;
//frame
@property (assign, nonatomic) CGRect showViewFrame;
//是否显示暗色蒙板
@property (nonatomic, assign,getter=isNeedClearBack) BOOL clearBack;

@end
