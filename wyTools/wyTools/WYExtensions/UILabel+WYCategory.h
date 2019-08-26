//
//  UILabel+WYCategory.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WYCategory)

+ (UILabel *)wy_labelWithFont:(UIFont *)font textColor:(NSString *)textColor;
+ (UILabel *)wy_labelWithFont:(UIFont *)font textColor:(NSString *)textColor textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)wy_labelWithText:(NSString *)text font:(UIFont *)font textColor:(NSString *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
