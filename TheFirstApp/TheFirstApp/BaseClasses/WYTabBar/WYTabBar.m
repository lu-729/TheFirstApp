//
//  BaseTabBar.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/27.
//

#import "WYTabBar.h"

@implementation WYTabBar

- (NSMutableArray<WYTabBarItem *> *)tabBarItems {
    if (_tabBarItems == nil) {
        _tabBarItems = [[NSMutableArray alloc] init];
    }
    return _tabBarItems;
}


- (void)addTabBarItem:(UITabBarItem *)item {
    WYTabBarItem *tabBarItem = [[WYTabBarItem alloc] initWithItemImageRatio:5.f];
    tabBarItem.itemTitleFont = self.itemTitleFont ?:[UIFont systemFontOfSize:10.f];
    tabBarItem.itemTitleColor = self.itemTitleColor ?:[UIColor darkGrayColor];
    tabBarItem.selectedItemTitleColor = self.itemselectedTitleColor ?:[UIColor blackColor];
    //与原生UITabBarItem相关联
    tabBarItem.tabBarItem = item;
    [self addSubview:tabBarItem];
    [self.tabBarItems addObject:tabBarItem];
    //给tabBarItem设置点击手势
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarItemClick:)];
    [tabBarItem addGestureRecognizer:tapGR];
    if (self.tabBarItems.count == 1) {
        [self onClickTabBarItem:tabBarItem];
    }
}


- (void)tabBarItemClick:(UITapGestureRecognizer *)tap {
    WYTabBarItem *tabBarItem = (WYTabBarItem *)tap.view;
    [self onClickTabBarItem:tabBarItem];
}


- (void)onClickTabBarItem:(WYTabBarItem *)tabBarItem {
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
        [self.delegate tabBar:self didSelectedItemFrom:self.selectedItem.tag to:tabBarItem.tag];
    }
    //把上一个选中的item的选中状态取消，把当前选中的item的选中状态保存下来
    self.selectedItem.selected = NO;
    self.selectedItem = tabBarItem;
    self.selectedItem.selected = YES;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    int count = (int)self.tabBarItems.count;
    CGFloat itemY = 0;
    CGFloat itemH = h;
    CGFloat itemW = w / self.tabBarItems.count;
    for (int index=0; index<count; index++) {
        WYTabBarItem *tabBarItem = self.tabBarItems[index];
        tabBarItem.tag = index;
        CGFloat itemX = itemW * index;
        tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
}

@end
