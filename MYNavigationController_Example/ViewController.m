//
//  ViewController.m
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "ViewController.h"
#import "MenuController.h"
#import "MYNavigationController.h"
#import "AdressViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *exampleListView;

@property (nonatomic, strong) NSArray *listArray;

@end

@implementation ViewController

- (NSArray *)listArray
{
    if (!_listArray) {
        _listArray = @[@"效果一",@"效果二",@"效果三",@"朋友圈表情文字网址等混排框架",@"照片浏览器框架",@"常用万能菜单框架",@"博客"];
    }
    return _listArray;
}

- (UITableView *)exampleListView
{
    if (!_exampleListView) {
        _exampleListView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_exampleListView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"useExampleCell"];
        _exampleListView.delegate = self;
        _exampleListView.dataSource = self;
        _exampleListView.rowHeight = 60;
    }
    return _exampleListView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"使用列表";
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.exampleListView];
}


#pragma mark - dataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"useExampleCell"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:18 weight:1];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            [self exampleOne];
        }
            break;
        case 1:
        {
            [self exampleTwo];
        }
  
            break;
        case 2:
        {
            [self exampleThree];
        }
            break;

        case 3:
        {
            AdressViewController *adressVc = [[AdressViewController alloc]init];
            adressVc.tag = 1;
            [self.navigationController pushViewController:adressVc animated:YES];
        }
            break;
        case 4:
        {
            AdressViewController *adressVc = [[AdressViewController alloc]init];
            adressVc.tag = 2;
            [self.navigationController pushViewController:adressVc animated:YES];
        }
            break;
        case 5:
        {
            AdressViewController *adressVc = [[AdressViewController alloc]init];
            adressVc.tag = 3;
            [self.navigationController pushViewController:adressVc animated:YES];
        }
 
            break;
        case 6:
        {
            AdressViewController *adressVc = [[AdressViewController alloc]init];
            adressVc.tag = 4;
            [self.navigationController pushViewController:adressVc animated:YES];
        }
            break;

        default:
            break;
    }
    
}



#pragma mark - 例一
- (void)exampleOne
{
    
    //ShowFrame : 你需要展示的弹窗的frame , 记住 ,如果不需要隐藏这个小弹窗的导航, 那么导航部分的44高度 也需要计算进showFrame中
    //ShowStype :
    /*
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
     */
    
    //root : 即导航控制器包装的控制器
    //callback: 用于回调数据 . 是 MYNavigationController公开的属性之一 , 你可以在菜单中获取到该callback , 进行数据回调
    
    MenuController *menu = [[MenuController alloc]init];
    MYNavigationController *nav = [[MYNavigationController alloc]initWithShowFrame:CGRectMake(0, my_Screen_Height - 388, my_Screen_Width, 388) ShowStyle:MYPresentedViewShowStyleFromBottomDropStyle root:menu callback:^(id callback) {
        
        NSLog(@"----------点击了-------%@",callback);
        
    }];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 例二
- (void)exampleTwo
{
    MenuController *menu = [[MenuController alloc]init];
    MYNavigationController *nav = [[MYNavigationController alloc]initWithShowFrame:CGRectMake(0, (my_Screen_Height - 388)*0.5, my_Screen_Width, 388) ShowStyle:MYPresentedViewShowStyleFromBottomSpringStyle root:menu callback:^(id callback) {
        
        NSLog(@"----------点击了-------%@",callback);
        
    }];
    [self presentViewController:nav animated:YES completion:nil];
}


#pragma mark - 例三
- (void)exampleThree
{
    MenuController *menu = [[MenuController alloc]init];
    MYNavigationController *nav = [[MYNavigationController alloc]initWithShowFrame:CGRectMake(0, 64, my_Screen_Width, 388) ShowStyle:MYPresentedViewShowStyleFromTopDropStyle root:menu callback:^(id callback) {
        
        NSLog(@"----------点击了-------%@",callback);
        
    }];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
