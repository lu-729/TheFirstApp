//
//  TestTabBarVController.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/28.
//

#import "WYTabBarVController.h"
#import "HomeViewController.h"
#import "StoreViewController.h"
#import "MirrorViewController.h"
#import "SquareViewController.h"
#import "MineViewController.h"
#import "BaseNavigationController.h"

@interface WYTabBarVController ()

@end

@implementation WYTabBarVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubViewControllers];
}

- (void)addSubViewControllers {
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"HomeViewController",@"StoreViewController",@"SquareViewController",@"MineViewController"]];
    NSArray *imageArr = @[@"tabBar_home",@"tabBar_store",@"tabBar_square",@"tabBar_mine"];
    NSArray *selectedImageArr = @[@"tabBar_home_selected",@"tabBar_store_selected",@"tabBar_square_selected",@"tabBar_mine_selected"];
    NSArray *titleArr = @[@"首页",@"商家",@"广场",@"我的"];

    for (int i=0; i<arr.count; i++) {
        //使用NSClassFromString获取类名并创建对应类对象
        UIViewController *vc = [[NSClassFromString(arr[i]) alloc] init];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem.image = [UIImage imageNamed:imageArr[i]];
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageArr[i]];
        nav.tabBarItem.title = titleArr[i];
        nav.navigationItem.title = titleArr[i];
        [arr replaceObjectAtIndex:i withObject:nav];
    }
    NSArray *navArr = [NSArray arrayWithArray:arr];
    [self setViewControllers:navArr];
}



@end
