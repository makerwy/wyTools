//
//  UITextView+WYPlaceholder.h
//  KoreanTools
//
//  Created by wangyang on 2019/9/2.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (WYPlaceholder)

/** placeholdLabel */
@property(nonatomic,readonly)  UILabel * _Nonnull wy_placeholdLabel;
/** placeholder */
@property(nonatomic,copy) NSString *wy_placeholder;
/** placeholder颜色 */
@property(nonatomic,copy) UIColor *wy_placeholderColor;
/** 富文本 */
@property(nonnull,strong) NSAttributedString *wy_attributePlaceholder;
/** 位置 */
@property(nonatomic,assign) CGPoint wy_location;
/** 默认颜色 */
+ (UIColor *_Nullable)defaultColor;

@end

NS_ASSUME_NONNULL_END
