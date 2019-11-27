//
//  NSString+WYCategory.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WYCheckStringType) {
    /**
     *  手机号
     */
    phoneString = 0,
    /**
     *  邮箱
     */
    emailString,
    /**
     *  全数字
     */
    numberString,
    /**
     *  全小写字母
     */
    minusculeString,
    /**
     *  全大写字母
     */
    majusculeString,
    /**
     *  身份证
     */
    IDCardString,
    /**
     *  全中文字符
     */
    ChineseString,
    /**
     *  无特殊符号但是包含 _
     */
    SpecialSymbolBut_,
};

@interface NSString (WYCategory)

/**
 *  获取例如 138****3838 格式的字符串
 *
 *  @return 138****3838 格式的字符串
 */
- (NSString *)wy_safePhone;
/**
 *  判断字符串是否为nil 移除 空格 回车 后
 *
 *  @return 1
 */
- (BOOL)wy_isEmpty;
/**
 *  获取对象的字符串类型
 *
 *  @return 字符串类型
 */
- (BOOL)wy_stringIsPureInt;
/**
 *  float判断
 *
 *  @return YES？NO
 */
- (BOOL)wy_isPureFloat;
/**
 *  正则校验
 *
 *  @param type   需要校验的类型
 *
 *  @return YES？NO
 */
- (BOOL)wy_checkStringType:(WYCheckStringType)type;
/**
 自定义正则
 
 @param regularString 正则
 @return 判断
 */
- (BOOL)wy_checkStringRegularString:(NSString *)regularString;
/**
 *  获取NSMutableAttributedString类型的字符串
 *
 *  @return NSMutableAttributedString类型的字符串
 */
- (NSMutableAttributedString *)wy_mutableAttributedString;

/**
 判断是否是几位小数以内的数字
 
 @param count count
 
 @return yes||no
 */
- (BOOL)wy_checkNumberWithMainCount:(NSInteger)count;

#pragma mark
#pragma mark -- 字符串SIZE

/**
 字符串宽度
 
 @param font 字体
 @return 宽度
 */
- (CGFloat)wy_widthWithFont:(UIFont *)font;

/**
 根据字体大小 字间距 计算字符串宽度

 @param font font description
 @param wordSpace wordSpace description
 @return return value description
 */
- (CGFloat)wy_widthWithFont:(UIFont *)font wordSpace:(CGFloat)wordSpace;

/**
 字符串高度
 
 @param font 字体
 @return 高度
 */
- (CGFloat)wy_heightWithFont:(UIFont *)font width:(CGFloat)width;

/**
 根据字体大小 行间距 宽度 计算字符串高度
 
 @param font font description
 @param lineSpace lineSpace description
 @param width width description
 @return return value description
 */
- (CGFloat)wy_heightWithFont:(UIFont *)font
                   lineSpace:(CGFloat)lineSpace
                       width:(CGFloat)width;
@end
