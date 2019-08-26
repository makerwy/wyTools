//
//  wyTranslateTools.h
//  ArabTools
//
//  Created by wangyang on 2019/8/13.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WYT_ZH_CN = 0,//汉语
    WYT_ZH_HK,//粤语
    WYT_EN_US,//英语
    WYT_RU_RU,//俄语
    WYT_JP_JP,//日语
    WYT_TH_TH,//泰语
    WYT_DE_DE,//德语
    WYT_KO_KO,//韩语
    WYT_FR_FR,//法语
    WYT_GR_GR,//希腊语
    WYT_IT_IT,//意大利语
    WYT_ES_ES,//西班牙语
    WYT_AR_AR,//阿拉伯语
    WYT_PT_PT,//葡萄牙语
} WYTranslate_LanguageType;

@interface wyTranslateTools : NSObject

+ (void)translateZHToARA:(NSString *)ZHStr callback:(void (^)(BOOL success, NSString *result))callback;

+ (void)translateLanguage:(NSInteger)language
                      str:(NSString *)str
                 callback:(void (^)(BOOL success, NSString *result))callback;
@end

