//
//  BaseTabBar.h
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/27.
//

#import <UIKit/UIKit.h>
#import "WYTabBarItem.h"

@class WYTabBar;
@protocol WYTabBarDelegate <NSObject>

- (void)tabBar:(WYTabBar *_Nullable)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end

NS_ASSUME_NONNULL_BEGIN

@interface WYTabBar : UIView

@property (nonatomic, strong) NSMutableArray <WYTabBarItem *> *tabBarItems;
@property (nonatomic, strong) WYTabBarItem *selectedItem;
@property (nonatomic, weak) id<WYTabBarDelegate> delegate;

// 以下是对WYTabBarItem属性的暴露
@property (nonatomic, strong) UIColor *itemTitleColor;
@property (nonatomic, strong) UIColor *itemselectedTitleColor;
@property (nonatomic, strong) UIFont *itemTitleFont;

- (void)addTabBarItem:(UITabBarItem *)item;

@end

NS_ASSUME_NONNULL_END
