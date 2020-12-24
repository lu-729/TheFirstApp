//
//  WYTabBar.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/22.
//

#import "WYTabBar.h"

@implementation WYTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"jiahao"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"jiahao-2"] forState:UIControlStateHighlighted];
        [self addSubview:button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat buttonW = self.frame.size.width / 5.f;
    CGFloat buttonH = self.frame.size.height;
    NSInteger index = 0;
    //遍历TabBar的所有子视图
    for (UIView *subView in self.subviews) {
//        subView.backgroundColor = [UIColor blackColor];
        //判断当前subView，如果为添加的UIbutton则设置它的中心位置为TabBar的中心
        if ([subView isKindOfClass:[UIButton class]]) {
            subView.frame = CGRectMake(0, 0, buttonW, buttonH);
            subView.center = CGPointMake(self.width * 0.5f, self.height * 0.5f);
            [self bringSubviewToFront:subView];
        }
        //判断当前subView，如果为UITabBarButton，则设置其frame，如果不是则中断本次循环继续下一次循环
        if (![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat buttonX = index>1?buttonW*(index+1):buttonW*index;
        subView.frame  = CGRectMake(buttonX, 0.f, buttonW, buttonH);
        index++;
    }
//    NSLog(@"self.subView = %@",self.subviews);
}

@end
