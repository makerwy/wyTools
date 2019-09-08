//
//  UIView+WYCategory.m
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import "UIView+WYCategory.h"
#import "UIColor+WYHex.h"

@implementation UIView (WYCategory)

#pragma mark -
#pragma mark - 关于位置

/**
 * 获取视图 x 坐标
 *
 *  @return x 坐标
 */
- (CGFloat)wy_X {
    return self.frame.origin.x;
}
/**
 * 获取视图 y 坐标
 *
 *  @return y 坐标
 */
- (CGFloat)wy_Y {
    return self.frame.origin.y;
}
/**
 * 获取视图 宽度
 *
 *  @return 宽度
 */
- (CGFloat)wy_Width {
    return self.frame.size.width;
}
/**
 * 获取视图 高度
 *
 *  @return 高度
 */
- (CGFloat)wy_Height {
    return self.frame.size.height;
}
/**
 * 获取视图 最右边距屏幕左边的距离
 *
 *  @return 距离
 */
- (CGFloat)wy_MaxX {
    return CGRectGetMaxX(self.frame);
}
/**
 * 获取视图 最下边距屏幕左边的距离
 *
 *  @return 距离
 */
- (CGFloat)wy_MaxY {
    return CGRectGetMaxY(self.frame);
}
/**
 *  获取视图 中心点 X
 *
 *  @return center.x
 */
- (CGFloat)wy_MidX {
    return self.center.x;
}
/**
 *  获取视图 中心点 Y
 *
 *  @return center.y
 */
- (CGFloat)wy_MidY {
    return self.center.y;
}

#pragma mark -
#pragma mark - 关于设置圆角

/**
 *  切圆
 */
- (void)wy_fillCorner {
    self.layer.cornerRadius = self.frame.size.width / 2.0;
    self.layer.masksToBounds = YES;
}

/**
 *  切指定圆角
 *
 *  @param radius 圆角半径
 */
- (void)wy_cornerWithRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

/**
 *  设置边框
 *
 *  @param radius      半径
 *  @param borderWidth 边框宽度
 *  @param colorString 边框颜色 6位16进制字符串
 */
- (void)wy_borderWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(NSString *)colorString {
    self.layer.borderColor = [UIColor wy_colorWithHexString:colorString].CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

/**
 设置阴影

 @param colorString colorString description
 @param opacity opacity description
 @param radius radius description
 @param offset offset description
 */
- (void)wy_shadowColorString:(NSString *)colorString opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset {
    self.layer.shadowColor = [UIColor wy_colorWithHexString:colorString].CGColor; /// 阴影颜色
    self.layer.shadowOpacity = opacity; /// 阴影透明度
    self.layer.shadowRadius = radius; /// 阴影半径 默认 3
    self.layer.shadowOffset = offset; /// 向右 向下 偏移
}

#pragma mark -
#pragma mark - 关于画线

/**
 *  画线
 *
 *  @param top   居上
 *  @param left  居左
 *  @param right 居右
 */
- (void)wy_lineFromTop:(float)top left:(float)left toRight:(float)right {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor wy_colorWithHexString:@"e5e5e5"].CGColor;
    layer.frame = CGRectMake(left, top, [self wy_Width] - left - right, 0.5);
    [self.layer addSublayer:layer];
}
/**
 *  上部横线
 */
- (void)wy_topLine {
    [self wy_lineFromTop:0 left:0 toRight:0];
}
/**
 *  下部横线
 */
- (void)wy_bottomLine {
    [self wy_lineFromTop:[self wy_Height] - 0.5  left:0 toRight:0];
}

#pragma mark
#pragma mark -- XIB

- (void)setWy_radius:(CGFloat)wy_radius {
    self.layer.cornerRadius = wy_radius;
    self.layer.masksToBounds = YES;
}
- (CGFloat)wy_radius {
    return self.layer.cornerRadius;
}
- (void)setWy_borderWidth:(CGFloat)wy_borderWidth {
    self.layer.borderWidth = wy_borderWidth;
}
- (CGFloat)wy_borderWidth {
    return self.layer.borderWidth;
}
- (void)setWy_borderColor:(UIColor *)wy_borderColor {
    self.layer.borderColor = wy_borderColor.CGColor;
    self.layer.masksToBounds = YES;
}
- (UIColor *)wy_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setWy_shadowRadius:(CGFloat)wy_shadowRadius {
    self.layer.shadowRadius = wy_shadowRadius;
}
- (CGFloat)wy_shadowRadius {
    return self.layer.shadowRadius;
}
- (void)setWy_shadowColor:(UIColor *)wy_shadowColor {
    self.layer.shadowColor = wy_shadowColor.CGColor;
}
- (UIColor *)wy_shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}
- (void)setWy_shadowOffset:(CGSize)wy_shadowOffset {
    self.layer.shadowOffset = wy_shadowOffset;
}
- (CGSize)wy_shadowOffset {
    return self.layer.shadowOffset;
}
- (void)setWy_shadowOpacity:(CGFloat)wy_shadowOpacity {
    self.layer.shadowOpacity = wy_shadowOpacity;
}
- (CGFloat)wy_shadowOpacity {
    return self.layer.shadowOpacity;
}

+ (instancetype)wy_loadXib {
    return [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:nil options:nil].firstObject;
}

@end
