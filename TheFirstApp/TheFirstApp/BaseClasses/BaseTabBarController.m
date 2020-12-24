//
//  CPTabBarViewController.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/20.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "StoreViewController.h"
#import "MirrorViewController.h"
#import "SquareViewController.h"
#import "MineViewController.h"
#import "BaseNavigationController.h"
#import "WYTabBar.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self useCustomTabBar];
    [self addChildViewControllers];
    [self setTabBarItemAttributes];
}

//使用KVC将分栏控制器自带的TabBar替换成自定义的
- (void)useCustomTabBar {
    WYTabBar *customTabBar = [[WYTabBar alloc] init];
    [self setValue:customTabBar forKey:@"tabBar"];
}

- (void)addChildViewControllers {
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"HomeViewController",@"StoreViewController",@"SquareViewController",@"MineViewController"]];
    NSArray *imageArr = @[@"tabBar_home",@"tabBar_store",@"tabBar_square",@"tabBar_mine"];
    NSArray *selectedImageArr = @[@"tabBar_home_selected",@"tabBar_store_selected",@"tabBar_square_selected",@"tabBar_mine_selected"];
    NSArray *titleArr = @[@"首页",@"商家",@"广场",@"我的"];
    //创建视图控制器及其对应的导航控制器
    for (int i=0; i<arr.count; i++) {
        //使用NSClassFromString获取类名并创建对应类对象
        UIViewController *vc = [[NSClassFromString(arr[i]) alloc] init];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        //设置控制器对应tabBarItem的标题以及正常状态和选中状态下的图标,图片渲染模式为原始状态
        UIImage *image = [[UIImage imageNamed:imageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImage = [[UIImage imageNamed:selectedImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArr[i] image:image selectedImage:selectedImage];
        //将数组arr里面的vc换成对应的nav
        [arr replaceObjectAtIndex:i withObject:nav];
    }
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    //将导航控制器设置为分栏控制器的子控制器
    self.viewControllers = arr;
}

//统一设置TabBarItem的文字字体大小和颜色属性
- (void)setTabBarItemAttributes {
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attr[NSForegroundColorAttributeName] = [UIColor colorWithRed:230/255.f green:230/255.f blue:230/255.f alpha:1];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}

@end
