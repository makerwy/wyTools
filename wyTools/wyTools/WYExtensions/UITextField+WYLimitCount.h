//
//  UITextField+WYLimitCount.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (WYLimitCount)

@property (nonatomic, assign) NSInteger wy_limitCount;

/**
 设置占位符颜色

 @param color color description
 */
- (void)wy_placeholderColor:(UIColor *)color;

@end
