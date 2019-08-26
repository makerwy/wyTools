//
//  wySpeakTools.m
//  ArabTools
//
//  Created by wangyang on 2019/8/13.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wySpeakTools.h"
#import <AVFoundation/AVFoundation.h>



@interface wySpeakTools ()
//所需的源语言
@property (nonatomic,assign) WY_LanguageType languageType;
//播放速度
@property (nonatomic,copy) NSString *rate;
@property (nonatomic,strong) AVSpeechSynthesizer *speechSynthesizer;

@end

@implementation wySpeakTools

+ (instancetype)shareInstance {
    
    CGFloat rate = [[[NSUserDefaults standardUserDefaults] valueForKey:@"wyRate"] floatValue];
    CGFloat volume = [[[NSUserDefaults standardUserDefaults] valueForKey:@"wyVolume"] floatValue];

    if (rate == 0) {
        rate = 0.5;
        [[NSUserDefaults standardUserDefaults] setValue:@(rate) forKey:@"wyRate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    if (volume == 0) {
        volume = 0.5;
        [[NSUserDefaults standardUserDefaults] setValue:@(volume) forKey:@"wyVolume"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return [self shareInstanceWithLanguageType:WY_AR_AR rate:rate volume:volume];
}

+ (instancetype)shareInstanceWithLanguageType:(WY_LanguageType)languageType
                                         rate:(CGFloat)rate
                                       volume:(CGFloat)volume {
    static wySpeakTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[wySpeakTools alloc] init];
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error;
        if (![session setCategory:AVAudioSessionCategoryPlayback error:&error]) {
            //NSLog(@"Category Error: %@", [error localizedDescription]);
        }
        if (![session setActive:YES error:&error]) {
            //NSLog(@"Activation Error: %@", [error localizedDescription]);
        }
    });
    tools.languageType = languageType;
    tools.rate = [NSString stringWithFormat:@"%f",rate];
    tools.volume = [NSString stringWithFormat:@"%f",volume];
    return tools;
}

/**
 播放文本
 
 @param playText playText description
 */
- (void)playText:(NSString *)playText {
    if (self.speechSynthesizer.isSpeaking) {
        [self stopSpeaking];
    }
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:playText];
    utterance.rate = [self.rate floatValue];
    utterance.volume = [self.volume floatValue];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:[wySpeakTools languageCode:self.languageType]];
    [self.speechSynthesizer speakUtterance:utterance];
}

//停止播放
- (void)stopSpeaking {
    if (self.speechSynthesizer.isSpeaking) {
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

//暂停播放
- (void)pauseSpeaking {
    [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

//继续播放
- (void)continueSpeaking {
    [self.speechSynthesizer continueSpeaking];
}

+ (NSString *)languageCode:(WY_LanguageType)languageType {
    NSString *languageCode = @"";
    switch (languageType) {
        case WY_ZH_CN:
            languageCode = @"zh-CN";
            break;
        case WY_ZH_HK:
            languageCode = @"zh-HK";
            break;
        case WY_EN_US:
            languageCode = @"en-US";
            break;
        case WY_RU_RU:
            languageCode = @"ru-RU";
            break;
        case WY_JP_JP:
            languageCode = @"ja-JP";
            break;
        case WY_TH_TH:
            languageCode = @"th-TH";
            break;
        case WY_DE_DE:
            languageCode = @"de-DE";
            break;
        case WY_KO_KO:
            languageCode = @"ko-KO";
            break;
        case WY_FR_FR:
            languageCode = @"fr-FR";
            break;
        case WY_GR_GR:
            languageCode = @"gr-GR";
            break;
        case WY_IT_IT:
            languageCode = @"it-IT";
            break;
        case WY_ES_ES:
            languageCode = @"es-ES";
            break;
        case WY_AR_AR:
            languageCode = @"ar-SA";
            break;
        case WY_PT_PT:
            languageCode = @"pt-PT";
            break;
            
        default:
            break;
    }
    return languageCode;
}

#pragma mark -
#pragma mark - lazy

- (AVSpeechSynthesizer *)speechSynthesizer {
    if (_speechSynthesizer == nil) {
        _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return _speechSynthesizer;
}

@end
