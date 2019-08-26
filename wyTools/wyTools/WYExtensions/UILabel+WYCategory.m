//
//  UILabel+WYCategory.m
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import "UILabel+WYCategory.h"
#import "UIColor+WYHex.h"

@implementation UILabel (WYCategory)

+ (UILabel *)wy_labelWithFont:(UIFont *)font textColor:(NSString *)textColor {
    return [UILabel wy_labelWithFont:font textColor:textColor textAlignment:NSTextAlignmentLeft];
}
+ (UILabel *)wy_labelWithFont:(UIFont *)font textColor:(NSString *)textColor textAlignment:(NSTextAlignment)textAlignment {
    return [UILabel wy_labelWithText:nil font:font textColor:textColor textAlignment:textAlignment];
}
+ (UILabel *)wy_labelWithText:(NSString *)text font:(UIFont *)font textColor:(NSString *)textColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = [UIColor wy_colorWithHexString:textColor];
    label.textAlignment = textAlignment;
    label.text = text;
    return label;
}
@end
