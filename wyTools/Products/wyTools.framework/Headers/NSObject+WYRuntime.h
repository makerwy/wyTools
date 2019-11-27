//
//  NSObject+WYRuntime.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WYRuntime)

/**
 获取对象所有属性
 
 @return return value description
 */
- (NSArray *)wy_getAllProperties;

/**
 获取对象所有方法
 
 @return return value description
 */
- (NSArray *)wy_getAllMethods;

/**
 获取对象的所有属性和属性内容
 
 @param obj obj description
 @return return value description
 */
+ (NSDictionary *)wy_getAllPropertiesAndVaules:(NSObject *)obj;

@end
