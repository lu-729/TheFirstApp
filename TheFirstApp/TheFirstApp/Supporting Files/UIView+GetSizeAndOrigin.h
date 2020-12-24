//
//  UIView+GetSizeAndOrigin.h
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GetSizeAndOrigin)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;

@end

@interface UIView (FindFirstResponder)

- (UIView *)findFirstResponder;

@end

NS_ASSUME_NONNULL_END
