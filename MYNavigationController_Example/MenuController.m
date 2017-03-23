//
//  MenuController.m
//  MYNavigationController_Example
//
//  Created by 孟遥 on 2017/3/22.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "MenuController.h"
#import "MYNavigationController.h"

@interface MenuController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *listView; //菜单列表

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UIView *titleView; //自定义titleView

@property (nonatomic, strong) UILabel *titleLabel; //标题

@property (nonatomic, strong) UILabel *listPathLabel; //已选择路径

@property (nonatomic, strong) UIButton *backButton; //返回按钮

@end

@implementation MenuController

#pragma mark - 假数据
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@"目录一",@"目录二",@"目录三",@"目录四",@"目录五",@"目录六", nil];
    }
    return _dataSource;
}

#pragma mark - 列表
- (UITableView *)listView
{
    if (!_listView) {
        _listView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_listView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.rowHeight = 50;
    }
    return _listView;
}

#pragma mark - 标题
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font     = [UIFont systemFontOfSize:17 weight:1];
        _titleLabel.text     = @"路径选择";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark - 路径展示
- (UILabel *)listPathLabel
{
    if (!_listPathLabel) {
        _listPathLabel = [[UILabel alloc]init];
        _listPathLabel.textColor = [UIColor redColor];
        _listPathLabel.font = [UIFont systemFontOfSize:14 weight:0.5];
        _listPathLabel.text = @"当前选择 : ";
    }
    return _listPathLabel;
}

#pragma mark - 返回
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"jy_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(returnBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

#pragma mark - 标题栏容器
- (UIView *)titleView
{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor blueColor];
        
        [_titleView addSubview:self.backButton];
        [_titleView addSubview:self.titleLabel];
        [_titleView addSubview:self.listPathLabel];
        
        _backButton.frame = CGRectMake(0, 0, 50, 44);
        _titleLabel.frame    = CGRectMake(0, 0, self.view.bounds.size.width, 44);
        _listPathLabel.frame = CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame), self.view.bounds.size.width - 30, 44);
    }
    return _titleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    //设置当前路径
    if (_lastSelectedStr.length) {
        self.listPathLabel.text = self.lastSelectedStr;
    }
}

#pragma mark - UI
- (void)configUI
{
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.listView];
    self.titleView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 88); //自定义view充当标题栏部分
    self.listView.frame  = CGRectMake(0, CGRectGetMaxY(self.titleView.frame),self.view.bounds.size.width,300); //cell高度为50 , 一共显示6个cell
}



#pragma mark - 处理导航
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES; //为了使菜单的标题栏可以符合我们格式布局,直接隐藏原导航即可,标题栏部分我们自行写一个
    
    if (self.navigationController.childViewControllers.count < 2) {
        self.backButton.hidden = YES;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:16 weight:1];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}


#pragma mark - 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuController *menu = [[MenuController alloc]init];
    NSString *currentPath = [NSString stringWithFormat:@"%@%@/",self.listPathLabel.text,self.dataSource[indexPath.row]]; //当前选择路径
    menu.lastSelectedStr = currentPath; //将当前路径传入下层
    [self.navigationController pushViewController:menu animated:YES];
    
#warning  ----------- 值得注意的是 -------------
    //导航控制器中,有个callback可以使用 .为id类型 , 你可以将任意的元素回调到触发弹窗的控制器中 , 方便处理数据
    MYNavigationController *nav = (MYNavigationController *)self.navigationController;
    if (nav.callback) {
        nav.callback(self.dataSource[indexPath.row]);
    }
}

#pragma mark - 返回上一级
- (void)returnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
