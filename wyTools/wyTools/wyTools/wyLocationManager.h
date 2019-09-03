//
//  wyLocationManager.h
//  LocalDiary
//
//  Created by wangyang on 2019/8/28.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface wyLocationManager : NSObject

@property (nonatomic, copy) void (^callback)(CLLocation *location);

+ (instancetype)locationManager;

- (void)startLocation;

- (void)stopLocation;

@end

NS_ASSUME_NONNULL_END
