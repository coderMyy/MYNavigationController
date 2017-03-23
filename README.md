# MYNavigationController
### 写在最前 : 通常情况下 , 导航的作用域为整个屏幕 , 即使把view范围缩小 , 但是push的效果依然存在于全局 . 此demo将导航的作用域可以进行随意压缩 , 便可以实现在页面中的页面可以局部性的push , pop 

## 使用范例 : 
```
   创建弹窗菜单 , 并创建MYNavigationController导航控制器对其包装 , 设置需要展示的frame以及弹出动画类型.
    MenuController *menu = [[MenuController alloc]init];
    MYNavigationController *nav = [[MYNavigationController alloc]initWithShowFrame:CGRectMake(0, (my_Screen_Height - 388)*0.5, my_Screen_Width, 388) ShowStyle:MYPresentedViewShowStyleFromBottomSpringStyle root:menu callback:^(id callback) {

    NSLog(@"----------点击了-------%@",callback);

    }];
//弹出弹窗
    [self presentViewController:nav animated:YES completion:nil];
//值得注意的是 : callback为MYNavigationController导航控制器的一个公开属性 , 在内部菜单中 , 可以自行实现 , 并回调出任意内容

```
</p>
![image](https://github.com/coderMyy/MYNavigationController框架/raw/master/MYNavigationController/examplePic/first.gif)
</p>
![image](https://github.com/coderMyy/MYNavigationController/blob/master/examplePic/222.gif)
</p>
![image](https://github.com/coderMyy/MYNavigationController/blob/master/examplePic/333.gif)
</p>
![image](https://github.com/coderMyy/MYNavigationController/blob/master/examplePic/444.gif)

## ---- 其他具体的内容 , 请见demo 
