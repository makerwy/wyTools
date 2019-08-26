//
//  wyFileManager.m
//  ArabTools
//
//  Created by wangyang on 2019/8/19.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wyFileManager.h"

@implementation wyFileManager

+ (instancetype)fileManager {
    static wyFileManager *_fileManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fileManager = [[wyFileManager alloc] init];
    });
    return _fileManager;
}

- (BOOL)createFile:(NSString *)file {
    //在沙盒中获取Documents的完整路径
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //得到path下文件的路径
    NSString *filePath = [path stringByAppendingPathComponent:file];
    //判断文件是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return YES;
    }else{
        NSError *error;
        NSString *dirPath = [filePath stringByDeletingLastPathComponent];
        BOOL isSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        isSuccess = [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
        return isSuccess;
    }
}

- (NSString *)getFilePath:(NSString *)filePath {
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:filePath];
}

- (BOOL)writeToFile:(NSString *)file content:(id)content {
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:file];
    if ([self createFile:file]) {
       return [content writeToFile:filePath atomically:NO];
    }
    return NO;
}


@end
