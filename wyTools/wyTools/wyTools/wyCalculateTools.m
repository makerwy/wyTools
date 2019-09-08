//
//  wyCalculateTools.m
//  Demo
//
//  Created by wangyang on 2019/9/4.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wyCalculateTools.h"

@implementation wyCalculateModel

@end

@implementation wyCalculateTools

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
                              type:(wyCalculateType)type {
    CGFloat rate = 0.049;
    CGFloat monthRate = rate / 12;
    CGFloat months = years * 12;
    rate = rate * (1 + floating);
    monthRate = rate / 12;
    
    CGFloat extraMoney = money;
    NSMutableArray *results = @[].mutableCopy;
    switch (type) {
        case wyCalculate_DEBJ_SY:
        {
            for (int i = 0; i < months; i++) {
                //每月还款总额
                CGFloat repay =  (money / months) + extraMoney * monthRate;
                //每月利息
                CGFloat interest = extraMoney * monthRate;
                //每月还款本金
                CGFloat capital = repay - interest;
                //剩余贷款本金
                extraMoney -= capital;
                
                wyCalculateModel *model = [wyCalculateModel new];
                model.capital = capital;
                model.interest = interest;
                model.repay = repay;
                model.remainCapital = extraMoney;
                model.totalMoney = money;
                [results addObject:model];
            }
            
        }
            break;
        case wyCalculate_DEBX_SY:
        {
            //每月还款总额
            CGFloat repay =  (money * monthRate * pow(1 + monthRate, months)) / (pow(1 + monthRate, months) - 1);
            
            for (int i = 0; i < months; i++) {
                //每月利息
                CGFloat interest = extraMoney * monthRate;
                CGFloat capital = repay - interest;
                extraMoney -= capital;
                
                wyCalculateModel *model = [wyCalculateModel new];
                model.capital = capital;
                model.interest = interest;
                model.repay = repay;
                model.remainCapital = extraMoney;
                model.totalMoney = money;
                [results addObject:model];
            }
        }
            break;
        case wyCalculate_DEBJ_GJJ:
        {
            rate = 0.0325 * (1 + floating);
            monthRate = rate / 12;
            for (int i = 0; i < months; i++) {
                //每月还款总额
                CGFloat repay =  (money / months) + extraMoney * monthRate;
                //每月利息
                CGFloat interest = extraMoney * monthRate;
                //每月还款本金
                CGFloat capital = repay - interest;
                //剩余贷款本金
                extraMoney -= capital;
                
                wyCalculateModel *model = [wyCalculateModel new];
                model.capital = capital;
                model.interest = interest;
                model.repay = repay;
                model.remainCapital = extraMoney;
                model.totalMoney = money;
                [results addObject:model];
            }
        }
            break;
        case wyCalculate_DEBX_GJJ:
        {
            rate = 0.0325 * (1 + floating);
            monthRate = rate / 12;
            //每月还款总额
            CGFloat repay =  (money * monthRate * pow(1 + monthRate, months)) / (pow(1 + monthRate, months) - 1);
            
            for (int i = 0; i < months; i++) {
                //每月利息
                CGFloat interest = extraMoney * monthRate;
                CGFloat capital = repay - interest;
                extraMoney -= capital;
                
                wyCalculateModel *model = [wyCalculateModel new];
                model.capital = capital;
                model.interest = interest;
                model.repay = repay;
                model.remainCapital = extraMoney;
                model.totalMoney = money;
                [results addObject:model];
            }
        }
            break;
            
        default:
            break;
    }
    
    return [results copy];
}


@end
