//
//  AppDelegate.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "StoreViewController.h"
#import "MirrorViewController.h"
#import "SquareViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //使用available判断当前系统版本是否为iOS13或更新的版本
    if(@available(iOS 13,*)) {
        return YES;
    } else {
        NSLog(@"调用App方法");
        self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
        //创建视图控制器、导航控制器以及TabBar控制器
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        StoreViewController *storeVC = [[StoreViewController alloc] init];
        MirrorViewController *mirrorVC = [[MirrorViewController alloc] init];
        SquareViewController *squareVC = [[SquareViewController alloc] init];
        MineViewController *mineVC = [[MineViewController alloc] init];
        UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
        UINavigationController *storeNav = [[UINavigationController alloc] initWithRootViewController:storeVC];
        UINavigationController *mirrorNav = [[UINavigationController alloc] initWithRootViewController:mirrorVC];
        UINavigationController *squareNav = [[UINavigationController alloc] initWithRootViewController:squareVC];
        UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
        UITabBarController *tabbarCtrl = [[UITabBarController alloc] init];
        [tabbarCtrl setViewControllers:@[homeNav,storeNav,mirrorNav,squareNav,mineNav]];
        //将tabBar控制器添加为window的根控制器
        self.window.rootViewController = tabbarCtrl;
        homeVC.view.backgroundColor = [UIColor redColor];
        storeVC.view.backgroundColor = [UIColor orangeColor];
        mirrorVC.view.backgroundColor = [UIColor yellowColor];
        squareVC.view.backgroundColor = [UIColor greenColor];
        mineVC.view.backgroundColor = [UIColor blueColor];
        //显示窗口
        [self.window makeKeyAndVisible];
        return YES;
    }
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
