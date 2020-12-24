//
//  AppDelegate.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //使用available判断当前系统版本是否为iOS13或更新的版本
    if(@available(iOS 13,*)) {
        return YES;
    } else {
        NSLog(@"当前版本为iOS12或以前的");
        //创建window和tabBar控制器并将tabBar控制器设为window的根控制器
        self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
        BaseTabBarController *tabBarCtrl = [[BaseTabBarController alloc] init];
        self.window.rootViewController = tabBarCtrl;
        self.window.backgroundColor = [UIColor whiteColor];
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
