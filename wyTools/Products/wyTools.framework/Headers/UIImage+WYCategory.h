//
//  UIImage+WYCategory.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WYCategory)

/**
 压缩图片
 
 @param maxLength maxLength description
 @return return value description
 */
- (NSData *)wy_compressWithMaxLength:(NSUInteger)maxLength;

/**
 修复图片方向
 
 @return return value description
 */
- (UIImage *)wy_fixOrientation;

- (nullable UIImage *)wy_imageByTintColor:(UIColor *)color;

- (nullable UIImage *)wy_imageByGrayscale;

- (nullable UIImage *)wy_imageByBlurSoft;

- (nullable UIImage *)wy_imageByBlurLight;

- (nullable UIImage *)wy_imageByBlurExtraLight;

- (nullable UIImage *)wy_imageByBlurDark;

- (nullable UIImage *)wy_imageByBlurWithTint:(UIColor *)tintColor;

- (nullable UIImage *)wy_imageByBlurRadius:(CGFloat)blurRadius
                                 tintColor:(nullable UIColor *)tintColor
                                  tintMode:(CGBlendMode)tintBlendMode
                                saturation:(CGFloat)saturation
                                 maskImage:(nullable UIImage *)maskImage;

/**
 根据rect生成纯色图片

 @param color color description
 @param rect rect description
 @return return value description
 */
+ (nullable UIImage *)wy_imageWithColor:(UIColor *_Nullable)color rect:(CGRect)rect;

@end
