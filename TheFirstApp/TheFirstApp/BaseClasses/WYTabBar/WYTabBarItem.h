//
//  WYTabBarItem.h
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/27.
//

#import <UIKit/UIKit.h>

extern NSString * _Nullable const WYNotificationTabBarItemChanged;

NS_ASSUME_NONNULL_BEGIN

@interface WYTabBarItem : UIView

@property (nonatomic, strong) UITabBarItem *tabBarItem;//关联原生TabBarItem
@property (nonatomic, assign, getter=isSelected) BOOL selected;//选择状态
@property (nonatomic, strong) UIImageView *imageView;//图标
@property (nonatomic, strong) UILabel *titleLabel;//文字
@property (nonatomic, strong) UIColor *itemTitleColor;//文字默认颜色
@property (nonatomic, strong) UIColor *selectedItemTitleColor;//文字选中状态颜色
@property (nonatomic, strong) UIFont *itemTitleFont;//文字字体


/// 初始化方法，默认文字和图标上下间距接近官方数据radio为5pt
/// @param itemImageRatio 文字和图标间距参数
- (instancetype)initWithItemImageRatio:(CGFloat)itemImageRatio;

@end

NS_ASSUME_NONNULL_END
