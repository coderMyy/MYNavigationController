//
//  AdressViewController.m
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/23.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "AdressViewController.h"

@interface AdressViewController ()

@property (weak, nonatomic) IBOutlet UITextView *adress;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UIImageView *starImageview;

@end

@implementation AdressViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    switch (_tag) {
        case 1:
            self.adress.text   = @"https://github.com/coderMyy/MYCoreTextLabel";
            self.tipLabel.text = @"轻量级图文混排 , 实现图片文字混排 , 可显示常规链接比如网址,@,话题等 , 可以自定义链接字,设置关键字高亮等功能 . 适用于微博,微信,IM聊天对话等场景 . 实现这些功能仅用了几百行代码，耦合性也较低";
            break;
        case 2:
            self.adress.text   = @"https://github.com/coderMyy/MYPhotoBrowser";
            self.tipLabel.text = @"简易版照片浏览器。功能主要有 ： 点击点放大缩小 ， 长按保存发送给好友操作 ， 带文本描述照片，从点击照片放大，当前浏览照片缩小等功能。功能逐渐完善增加中，两行代码集成";
            break;
        case 3:
            self.adress.text   = @"https://github.com/coderMyy/MYDropMenu";
            self.tipLabel.text = @"上拉下拉菜单，可随意自定义，随意修改大小，位置，各个项目通用";
            break;
        case 4:
            self.adress.text   = @"http://blog.csdn.net/codermy";
            self.tipLabel.text = @"博客地址,一般会记录一些偏门的,或者容易出错的东西..";
            break;
        default:
            break;
    }
    
    [self shake];
}


- (IBAction)copyClick:(id)sender {
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.adress.text;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拷贝成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)shake
{
    //创建keyFrame
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"transform.rotation";
    
    animation.repeatCount = MAXFLOAT;
    
    animation.duration = 0.1;
    
    animation.values = @[@(-M_PI_4 *0.2),@(M_PI_4 *0.2),@(-M_PI_4 *0.2),@(M_PI_4 *0.2)];
    
    [self.starImageview.layer addAnimation:animation forKey:@"shake"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.starImageview.layer removeAnimationForKey:@"shake"];
}

@end
