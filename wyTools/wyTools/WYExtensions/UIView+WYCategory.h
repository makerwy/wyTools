//
//  UIView+WYCategory.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WYCategory)

#pragma mark -
#pragma mark - 关于位置

/**
 * 获取视图 x 坐标
 *
 *  @return x 坐标
 */
- (CGFloat)wy_X;
/**
 * 获取视图 y 坐标
 *
 *  @return y 坐标
 */
- (CGFloat)wy_Y;
/**
 * 获取视图 宽度
 *
 *  @return 宽度
 */
- (CGFloat)wy_Width;
/**
 * 获取视图 高度
 *
 *  @return 高度
 */
- (CGFloat)wy_Height;
/**
 * 获取视图 最右边 距 父视图左边 距离
 *
 *  @return 距离
 */
- (CGFloat)wy_MaxX;
/**
 * 获取视图 最下边 距 父视图上边 距离
 *
 *  @return 距离
 */
- (CGFloat)wy_MaxY;
/**
 *  获取视图 中心点 X
 *
 *  @return center.x
 */
- (CGFloat)wy_MidX;
/**
 *  获取视图 中心点 Y
 *
 *  @return center.y
 */
- (CGFloat)wy_MidY;

#pragma mark -
#pragma mark - 关于设置圆角

/**
 *  切圆
 */
- (void)wy_fillCorner;
/**
 *  切指定圆角
 *
 *  @param radius 圆角半径
 */
- (void)wy_cornerWithRadius:(CGFloat)radius;
/**
 *  设置边框
 *
 *  @param radius      半径
 *  @param borderWidth 边框宽度
 *  @param colorString 边框颜色 6位16进制字符串
 */
- (void)wy_borderWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(NSString *)colorString;

#pragma mark -
#pragma mark - 关于画线

/**
 *  画线
 *
 *  @param top   居上
 *  @param left  居左
 *  @param right 居右
 */
- (void)wy_lineFromTop:(float)top left:(float)left toRight:(float)right;
/**
 *  上部横线
 */
- (void)wy_topLine;
/**
 *  下部横线
 */
- (void)wy_bottomLine;

/**
 颜色 透明度 半径 偏移
 
 @param colorString 1
 @param opacity 1
 @param radius 1
 @param offset 1
 */
- (void)wy_shadowColorString:(NSString *)colorString opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;

#pragma mark
#pragma mark -- XIB

@property(assign, nonatomic) IBInspectable CGFloat wy_radius;
@property(assign, nonatomic) IBInspectable CGFloat wy_borderWidth;
@property(strong, nonatomic) IBInspectable UIColor *wy_borderColor;

@property(assign, nonatomic) IBInspectable CGFloat wy_shadowRadius;
@property(strong, nonatomic) IBInspectable UIColor *wy_shadowColor;
@property(assign, nonatomic) IBInspectable CGFloat wy_shadowOpacity;
@property(assign, nonatomic) IBInspectable CGSize wy_shadowOffset;

+ (instancetype)loadXib;

@end
