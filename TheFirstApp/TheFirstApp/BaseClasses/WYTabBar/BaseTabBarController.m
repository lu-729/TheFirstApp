//
//  CPTabBarViewController.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/20.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)loadView {
    [super loadView];
    WYTabBar *tabBar = [[WYTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    self.wyTabBar = tabBar;
    [self.tabBar addSubview:tabBar];
    [self.tabBar setTranslucent:NO];
    [self.tabBar setBackgroundImage:UIImage.new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideOriginalControls) name:WYNotificationTabBarItemChanged
                                               object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideOriginalControls];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self hideOriginalControls];
}

- (void)hideOriginalControls {
    self.wyTabBar.frame = CGRectMake(0, 0, SCREENWIDTH, 49.f);
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj setHidden:YES];
        }
    }];
}

//设置nav的方式只能选[setViewControllers:]
- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    [self.wyTabBar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.wyTabBar.tabBarItems = [NSMutableArray array];
    for (UINavigationController *nav in viewControllers) {
        NSString *title = nav.tabBarItem.title;
        nav.tabBarItem.title = title;
        [self.wyTabBar addTabBarItem:nav.tabBarItem];
    }
    [super setViewControllers:viewControllers];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    self.wyTabBar.selectedItem.selected = NO;
    self.wyTabBar.selectedItem = self.wyTabBar.tabBarItems[selectedIndex];
    self.wyTabBar.selectedItem.selected = YES;
}

#pragma mark - BaseTabBarDelegate Method

- (void)tabBar:(WYTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}

@end
