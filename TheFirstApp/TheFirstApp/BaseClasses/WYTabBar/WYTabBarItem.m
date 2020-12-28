//
//  WYTabBarItem.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/27.
//

#import "WYTabBarItem.h"

NSString *const WYNotificationTabBarItemChanged = @"WYNotificationTabBarItemChanged";

@implementation WYTabBarItem

- (instancetype)initWithItemImageRatio:(CGFloat)itemImageRatio {
    self = [super init];
    if (self) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self).offset(-5);
        }];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        itemImageRatio = itemImageRatio <= 0 ? 5 : itemImageRatio;
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeZero);
            make.bottom.mas_equalTo(titleLabel.mas_top).offset(-itemImageRatio);
        }];
        
        _titleLabel = titleLabel;
        _imageView = imageView;
    }
    return self;
}


#pragma mark -

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    [self updateViewContent];
}

- (void)setItemTitleFont:(UIFont *)itemTitleFont {
    _itemTitleFont = itemTitleFont;
    if (itemTitleFont) {
        self.titleLabel.font = itemTitleFont;
    }
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    _itemTitleColor = itemTitleColor;
}

- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor {
    _selectedItemTitleColor = selectedItemTitleColor;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    _tabBarItem = tabBarItem;
    [tabBarItem addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [tabBarItem addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [tabBarItem addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

#pragma mark -

- (void)dealloc {
    [self.tabBarItem removeObserver:self forKeyPath:@"title"];
    [self.tabBarItem removeObserver:self forKeyPath:@"image"];
    [self.tabBarItem removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [[NSNotificationCenter defaultCenter] postNotificationName:WYNotificationTabBarItemChanged object:nil];
    [self updateViewContent];
}

- (void)updateViewContent {
    //设置文字属性
    NSDictionary *textAttributes = self.selected ? [[UITabBarItem appearance] titleTextAttributesForState:(UIControlStateSelected)] : [[UITabBarItem appearance] titleTextAttributesForState:(UIControlStateNormal)];
    if (textAttributes.count) {
        NSString *name = self.tabBarItem.title;
        self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:name attributes:textAttributes];
    } else {
        self.titleLabel.text = self.tabBarItem.title;
        self.titleLabel.textColor = self.isSelected ? self.selectedItemTitleColor : self.itemTitleColor;
    }
    //设置图标属性
    UIImage *image = self.selected ? self.tabBarItem.selectedImage : self.tabBarItem.image;
//    if (image == nil) {
//        image = self.selected ? [self.tabBarItem valueForKey:@"_selectedTemplateImage"] : [self.tabBarItem valueForKey:@"_templateImage"];
//    }
    if (self.isSelected) {
        if (image) {
            self.imageView.image = image;
        } else {
            self.imageView.image = nil;
        }
    } else {
        if (image) {
            self.imageView.image = image;
        } else {
            self.imageView.image = nil;
        }
    }
    CGSize imageSize = CGSizeMake(25.f, 25.f);
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(imageSize);
    }];
    [self setNeedsUpdateConstraints];
//    [UIView animateWithDuration:0.5f animations:^{
//        [self layoutIfNeeded];
//    }];
}

@end
