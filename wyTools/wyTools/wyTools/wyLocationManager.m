//
//  wyLocationManager.m
//  LocalDiary
//
//  Created by wangyang on 2019/8/28.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wyLocationManager.h"
#import "wyCommonMethods.h"

@interface wyLocationManager ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLGeocoder *geoCoder;

@end

@implementation wyLocationManager

+ (instancetype)locationManager {
    static wyLocationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[wyLocationManager alloc] init];
    });
    return manager;
}

- (void)startLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }else {
        [wyCommonMethods showAlertViewWithTitle:@"提示" message:@"请在设置中打开定位" cancelButtonTitle:@"取消" sureButtonTitle:@"打开定位" cancelBlock:nil sureBlock:^{
            NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication]openURL:settingURL];
        }];
    }
}

- (void)stopLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager stopUpdatingLocation];
    }
}

#pragma mark -
#pragma mark - CLLocationManagerDelegate

//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [wyCommonMethods showAlertViewWithTitle:@"提示" message:@"请在设置中打开定位" cancelButtonTitle:@"取消" sureButtonTitle:@"打开定位" cancelBlock:nil sureBlock:^{
        NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:settingURL];
    }];
}
//定位成功
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    [self stopLocation];
    
    CLLocation *currentLocation = [locations lastObject];
    //当前的经纬度
//    NSLog(@"当前的经纬度 %f,%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    
    if (self.callback) {
        self.callback(currentLocation);
    }
    
    //地理反编码 可以根据坐标(经纬度)确定位置信息(街道 门牌等)
//    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        if (placemarks.count >0) {
//            CLPlacemark *placeMark = placemarks[0];
//            //看需求定义一个全局变量来接收赋值
//            NSLog(@"当前国家 - %@",placeMark.country);//当前国家
//            NSLog(@"当前城市 - %@",placeMark.locality);//当前城市
//            NSLog(@"当前位置 - %@",placeMark.subLocality);//当前位置
//            NSLog(@"当前街道 - %@",placeMark.thoroughfare);//当前街道
//            NSLog(@"具体地址 - %@",placeMark.name);//具体地址
//            NSString *message = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",placeMark.country,placeMark.locality,placeMark.subLocality,placeMark.thoroughfare,placeMark.name];
//        }else if (error == nil && placemarks.count){
//
//            NSLog(@"NO location and error return");
//        }else if (error){
//
//            NSLog(@"loction error:%@",error);
//        }
//    }];
//    //这里的代码是为了判断didUpdateLocations调用了几次 有可能会出现多次调用 为了避免不必要的麻烦 在这里加个if判断 如果大于1.0就return
//    NSTimeInterval locationAge = -[currentLocation.timestamp timeIntervalSinceNow];
//    if (locationAge > 1.0){//如果调用已经一次，不再执行
//        return;
//    }
}

#pragma mark -
#pragma mark - lazy

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestWhenInUseAuthorization];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 5.0;
        _locationManager.pausesLocationUpdatesAutomatically = NO;
    }
    return _locationManager;
}

- (CLGeocoder *)geoCoder {
    if (!_geoCoder) {
        _geoCoder = [[CLGeocoder alloc] init];
    }
    return _geoCoder;
}

@end
