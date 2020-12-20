//
//  BaseViewController.h
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title tabBarItemIcon:(NSString *)icon tabBarItemSelectedIcon:(NSString *)selectedIcon;

@end

NS_ASSUME_NONNULL_END