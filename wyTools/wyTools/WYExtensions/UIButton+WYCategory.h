//
//  UIButton+WYCategory.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WYButtonEdgeInsetsStyle) {
    WYButtonEdgeInsetsStyleTop, // image在上，label在下
    WYButtonEdgeInsetsStyleLeft, // image在左，label在右
    WYButtonEdgeInsetsStyleBottom, // image在下，label在上
    WYButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (WYCategory)

+ (UIButton *)wy_buttonWithTitle:(NSString *)title titleColor:(NSString *)titleColor font:(UIFont *)font;
+ (UIButton *)wy_buttonWithImage:(NSString *)image;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)wy_layoutButtonWithEdgeInsetsStyle:(WYButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space;

@end
