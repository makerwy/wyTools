//
//  wyCalculateTools.h
//  Demo
//
//  Created by wangyang on 2019/9/4.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface wyCalculateModel : NSObject

@property (nonatomic, assign) CGFloat capital;//每月还款本金
@property (nonatomic, assign) CGFloat interest;//每月还款利息
@property (nonatomic, assign) CGFloat repay;//每月还款总额
@property (nonatomic, assign) CGFloat remainCapital;//剩余本金
@property (nonatomic, assign) CGFloat totalMoney;
@end

typedef enum : NSUInteger {
    wyCalculate_DEBJ_SY,//商业贷款等额本金
    wyCalculate_DEBX_SY,//商业贷款等额本息
    wyCalculate_DEBJ_GJJ,//公积金等额本金
    wyCalculate_DEBX_GJJ,//公积金等额本息
} wyCalculateType;

@interface wyCalculateTools : NSObject


/**
 计算

 @param money 总额
 @param floating 利率上浮
 @param years 多少年
 @return return value description
 */
+ (NSArray *)wy_calculateWithMoney:(CGFloat)money
                          floating:(CGFloat)floating
                             years:(NSInteger)years
                              type:(wyCalculateType)type;

@end

NS_ASSUME_NONNULL_END
