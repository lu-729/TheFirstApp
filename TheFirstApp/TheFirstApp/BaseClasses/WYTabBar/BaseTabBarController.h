//
//  CPTabBarViewController.h
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/20.
//

#import <UIKit/UIKit.h>
#import "WYTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController : UITabBarController <WYTabBarDelegate>

@property (nonatomic, strong) WYTabBar *wyTabBar;

@end

NS_ASSUME_NONNULL_END
