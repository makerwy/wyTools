//
//  wyTranslateTools.m
//  ArabTools
//
//  Created by wangyang on 2019/8/13.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wyTranslateTools.h"
#import <CommonCrypto/CommonCrypto.h>

static NSString *TRANSLATE_APPID = @"20190813000326256";//appid
static NSString *TRANSLATE_KEY = @"2WCvkVsFGAZu8gT0NMSN";//秘钥
static NSString *TRANSLATE_URLString = @"https://fanyi-api.baidu.com/api/trans/vip/translate";

@implementation wyTranslateTools

+ (void)translateZHToARA:(NSString *)ZHStr callback:(void (^)(BOOL, NSString *result))callback{
    [self translateLanguage:WYT_AR_AR str:ZHStr callback:callback];
}

+ (void)translateLanguage:(NSInteger)language
                      str:(NSString *)str
                 callback:(void (^)(BOOL success, NSString *result))callback {
    NSString *ara = @"";
    if (str.length == 0) {
        if (callback) {
            callback(NO,ara);
        }
    }
    NSString *sign = [NSString stringWithFormat:@"%@%@%@%@",TRANSLATE_APPID,str,@"1435660288",TRANSLATE_KEY];
    NSString *md5Sign = [self getMd5_32Bit_String:sign isUppercase:NO];
    NSString *to = [self languageCode:language];
//    NSDictionary *params = @{@"q":str,
//                             @"from":@"auto",
//                             @"to":to,
//                             @"appid":TRANSLATE_APPID,
//                             @"salt":@"1435660288",
//                             @"sign":md5Sign};
    NSString *urlStr = [[NSString stringWithFormat:@"%@?q=%@&from=auto&to=%@&appid=%@&salt=1435660288&sign=%@",TRANSLATE_URLString,str,to,TRANSLATE_APPID,md5Sign] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.timeoutInterval = 10;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (callback) {
                    callback(NO,@"");
                }
            }else {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSDictionary *dic = [json[@"trans_result"] firstObject];
                if (callback) {
                    callback(YES,dic[@"dst"]);
                }
            }
        });
    }];
    [task resume];
}

+ (NSString *)getMd5_32Bit_String:(NSString *)srcString isUppercase:(BOOL)isUppercase{
    // 参数 srcString 传进来的字符串
    // 参数 isUppercase 是否需要大小写
    const char *cStr = [srcString UTF8String];// 先转为UTF_8编码的字符串
    unsigned char digest[CC_MD5_DIGEST_LENGTH];//设置一个接受字符数组
    CC_MD5( cStr, (int)strlen(cStr), digest );// 把str字符串转换成为32位的16进制数列，存到了result这个空间中
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [result appendFormat:@"%02x", digest[i]];//将16字节的16进制转成32字节的16进制字符串
    }
    //    x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
    if (isUppercase) {
        return   [result uppercaseString];
    }else{
        return result;
    }
}
/*
 zh    中文
 en    英语
 yue    粤语
 wyw    文言文
 jp    日语
 kor    韩语
 fra    法语
 spa    西班牙语
 th    泰语
 ara    阿拉伯语
 ru    俄语
 pt    葡萄牙语
 de    德语
 it    意大利语
 el    希腊语
 nl    荷兰语
 pl    波兰语
 bul    保加利亚语
 est    爱沙尼亚语
 dan    丹麦语
 fin    芬兰语
 cs    捷克语
 rom    罗马尼亚语
 slo    斯洛文尼亚语
 swe    瑞典语
 hu    匈牙利语
 cht    繁体中文
 vie    越南语
 */
+ (NSString *)languageCode:(WYTranslate_LanguageType)languageType {
    NSString *languageCode = @"";
    switch (languageType) {
        case WYT_ZH_CN:
            languageCode = @"zh";
            break;
        case WYT_ZH_HK:
            languageCode = @"yue";
            break;
        case WYT_EN_US:
            languageCode = @"en";
            break;
        case WYT_RU_RU:
            languageCode = @"ru";
            break;
        case WYT_JP_JP:
            languageCode = @"jp";
            break;
        case WYT_TH_TH:
            languageCode = @"th";
            break;
        case WYT_DE_DE:
            languageCode = @"de";
            break;
        case WYT_KO_KO:
            languageCode = @"kor";
            break;
        case WYT_FR_FR:
            languageCode = @"fra";
            break;
        case WYT_GR_GR:
            languageCode = @"el";
            break;
        case WYT_IT_IT:
            languageCode = @"it";
            break;
        case WYT_ES_ES:
            languageCode = @"spa";
            break;
        case WYT_AR_AR:
            languageCode = @"ara";
            break;
        case WYT_PT_PT:
            languageCode = @"pt";
            break;
            
        default:
            break;
    }
    return languageCode;
}

@end
