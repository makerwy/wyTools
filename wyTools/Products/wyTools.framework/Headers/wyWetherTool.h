//
//  wyWetherTool.h
//  KoreanTools
//
//  Created by wangyang on 2019/9/3.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface wyWetherTool : NSObject

/**
 请求天气

 @param location location description
 @param callback callback description
 */
+ (void)wy_requestWetherWithLocation:(NSString *)location callback:(void(^)(NSDictionary * result))callback;

@end

NS_ASSUME_NONNULL_END
