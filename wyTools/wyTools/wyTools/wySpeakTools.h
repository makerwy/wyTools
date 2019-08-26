//
//  wySpeakTools.h
//  ArabTools
//
//  Created by wangyang on 2019/8/13.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 汉语:          zh-CN      (普通话)
 粤语:          zh-HK
 英语:          en-US
 俄语:          ru-RU
 日语:          ja-JP
 泰语:          th-TH
 德语:          de-DE
 韩语:          ko-KO
 法语:          fr-FR
 希腊语:         gr-GR
 意大利语:       it-IT
 西班牙语:       es-ES
 阿拉伯语:       ar-Ar
 葡萄牙语:       pt-PT
 */
typedef enum : NSUInteger {
    WY_ZH_CN = 0,//汉语
    WY_ZH_HK,//粤语
    WY_EN_US,//英语
    WY_RU_RU,//俄语
    WY_JP_JP,//日语
    WY_TH_TH,//泰语
    WY_DE_DE,//德语
    WY_KO_KO,//韩语
    WY_FR_FR,//法语
    WY_GR_GR,//希腊语
    WY_IT_IT,//意大利语
    WY_ES_ES,//西班牙语
    WY_AR_AR,//阿拉伯语
    WY_PT_PT,//葡萄牙语
} WY_LanguageType;

@interface wySpeakTools : NSObject

//声音大小
@property(nonatomic,copy) NSString *volume;           // [0-1] Default = 1

+ (instancetype)shareInstance;

+ (instancetype)shareInstanceWithLanguageType:(WY_LanguageType)languageType
                                         rate:(CGFloat)rate
                                       volume:(CGFloat)volume;

/**
 播放文本

 @param playText playText description
 */
- (void)playText:(NSString *)playText;

//停止播放
- (void)stopSpeaking;

//暂停播放
- (void)pauseSpeaking;

//继续播放
- (void)continueSpeaking;

@end

