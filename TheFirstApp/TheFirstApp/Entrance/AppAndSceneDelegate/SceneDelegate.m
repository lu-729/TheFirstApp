//
//  SceneDelegate.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import "SceneDelegate.h"
#import "HomeViewController.h"
#import "StoreViewController.h"
#import "MirrorViewController.h"
#import "SquareViewController.h"
#import "MineViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
    NSLog(@"调用Scene方法");
    //创建window
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.window.windowScene = (UIWindowScene *)scene;
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
    
    [self.window makeKeyAndVisible];
}




- (void)sceneDidDisconnect:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
