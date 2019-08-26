//
//  wyFileManager.h
//  ArabTools
//
//  Created by wangyang on 2019/8/19.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface wyFileManager : NSObject

+ (instancetype)fileManager;

- (NSString *)getFilePath:(NSString *)filePath;

- (BOOL)writeToFile:(NSString *)file content:(id)content;

@end

NS_ASSUME_NONNULL_END
