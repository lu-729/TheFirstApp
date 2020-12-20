//
//  CPTabBarViewController.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/20.
//

#import "CPTabBarController.h"
#import "HomeViewController.h"
#import "StoreViewController.h"
#import "MirrorViewController.h"
#import "SquareViewController.h"
#import "MineViewController.h"

@interface CPTabBarController ()

@end

@implementation CPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图控制器、导航控制器以及TabBar控制器
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    StoreViewController *storeVC = [[StoreViewController alloc] init];
    MirrorViewController *mirrorVC = [[MirrorViewController alloc] init];
    SquareViewController *squareVC = [[SquareViewController alloc] init];
//    MineViewController *mineVC = [[MineViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor redColor];
    homeVC.title = @"首页";
    storeVC.view.backgroundColor = [UIColor orangeColor];
    storeVC.title = @"商家";
    mirrorVC.view.backgroundColor = [UIColor yellowColor];
    mirrorVC.title = @"魔镜";
    squareVC.view.backgroundColor = [UIColor greenColor];
    squareVC.title = @"广场";
//    mineVC.view.backgroundColor = [UIColor blueColor];
//    mineVC.title = @"我的";
//    mineVC.tabBarItem.image = [UIImage imageNamed:@"tabBar_mine"];
//    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_mine_selected"];
    
    MineViewController *mineVC = [[MineViewController alloc] initWithTitle:@"我的" tabBarItemIcon:@"tabBar_mine" tabBarItemSelectedIcon:@"tabBar_mine_selected"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UINavigationController *storeNav = [[UINavigationController alloc] initWithRootViewController:storeVC];
    UINavigationController *mirrorNav = [[UINavigationController alloc] initWithRootViewController:mirrorVC];
    UINavigationController *squareNav = [[UINavigationController alloc] initWithRootViewController:squareVC];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    [self setViewControllers:@[homeNav,storeNav,mirrorNav,squareNav,mineNav]];
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
