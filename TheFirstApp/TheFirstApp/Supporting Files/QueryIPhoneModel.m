//
//  QueryIPhoneModel.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/25.
//



#import "QueryIPhoneModel.h"

@implementation QueryIPhoneModel

//判断手机是否为刘海类型，前提条件是状态栏不是隐藏状态
+ (BOOL)queryIsBangModelPhone {
    if ([UIApplication sharedApplication].statusBarHidden == NO && [UIApplication sharedApplication]. statusBarFrame.size.height > 20.f) {
        return YES;
    }
    return NO;
}

@end
