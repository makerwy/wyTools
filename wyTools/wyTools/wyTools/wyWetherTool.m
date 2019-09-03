//
//  wyWetherTool.m
//  KoreanTools
//
//  Created by wangyang on 2019/9/3.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wyWetherTool.h"

static const NSString *wy_wetherURL = @"https://api.seniverse.com/v3/weather/now.json?key=SfG-5J1vkd_b6N2Yf";

@interface wyWetherTool ()
@property (nonatomic, strong) NSURLSessionDataTask *task;
@end

@implementation wyWetherTool

+ (instancetype)shareTool {
    static wyWetherTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[wyWetherTool alloc] init];
    });
    return tool;
}

/**
 请求天气
 
 @param location location description
 @param callback callback description
 */
+ (void)wy_requestWetherWithLocation:(NSString *)location callback:(void(^)(NSDictionary *result))callback {
    if (location.length == 0) {
        return;
    }
    NSString *googleURL =[NSString stringWithFormat:@"%@&location=%@&language=zh-Hans&unit=c",wy_wetherURL,location];
    NSURL *url = [NSURL URLWithString:googleURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 10;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSDictionary *dic = [[json[@"results"] firstObject] objectForKey:@"now"];
                if (dic && callback) {
                    callback(dic);
                }
            }else {
                NSLog(@"error == %@",error.userInfo);
            }
        });
    }];
    [wyWetherTool shareTool].task = task;
    [task resume];
}


@end
