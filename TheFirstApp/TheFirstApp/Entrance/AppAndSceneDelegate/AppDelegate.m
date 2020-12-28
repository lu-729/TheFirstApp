//
//  AppDelegate.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import "AppDelegate.h"
#import "WYTabBarVController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建window和tabBar控制器并将tabBar控制器设为window的根控制器
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    WYTabBarVController *tabBarCtrl = [[WYTabBarVController alloc] init];
    self.window.rootViewController = tabBarCtrl;
    self.window.backgroundColor = [UIColor whiteColor];
    //显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}

@end
