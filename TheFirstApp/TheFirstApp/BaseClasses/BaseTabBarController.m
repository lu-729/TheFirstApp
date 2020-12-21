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

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}

- (void)addChildViewControllers {
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"HomeViewController",@"StoreViewController",@"MirrorViewController",@"SquareViewController",@"MineViewController"]];
    NSArray *imageArr = @[@"tabBar_home",@"tabBar_store",@"tabBar_mirror",@"tabBar_square",@"tabBar_mine"];
    NSArray *selectedImageArr = @[@"tabBar_home_selected",@"tabBar_store_selected",@"tabBar_mirror_selected",@"tabBar_square_selected",@"tabBar_mine_selected"];
    NSArray *titleArr = @[@"首页",@"商家",@"魔镜",@"广场",@"我的"];
    
    for (int i=0; i<arr.count; i++) {
        //使用NSClassFromString获取类名并创建类对象
        UIViewController *vc = [[NSClassFromString(arr[i]) alloc] init];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        //设置子视图
        vc.title = titleArr[i];
        vc.tabBarItem.image = [UIImage imageNamed:imageArr[i]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageArr[i]];
        //将数组arr里面的vc换成对应的nav
        [arr replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = arr;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
