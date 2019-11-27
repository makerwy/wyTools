//
//  wyConstHeader.h
//  wyTools
//
//  Created by wangyang on 2019/9/9.
//  Copyright © 2019 wangyang. All rights reserved.
//

#ifndef wyConstHeader_h
#define wyConstHeader_h

#define kWYScreenSize [UIScreen mainScreen].bounds.size
#define kWYScreenW    [UIScreen mainScreen].bounds.size.width
#define kWYScreenH    [UIScreen mainScreen].bounds.size.height

#define kWYIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kWYIs_iPhoneX kWYScreenW >=375.0f && kWYScreenH >=812.0f&& kWYIs_iphone

/*状态栏高度*/
#define kWYStatusBarH (CGFloat)(kWYIs_iPhoneX?(44.0):(20.0))
/*导航栏高度*/
#define kWYNavBarH (44)
/*状态栏和导航栏总高度*/
#define kWYNavH (CGFloat)(kWYIs_iPhoneX?(88.0):(64.0))
/*TabBar高度*/
#define kWYTabBarH (CGFloat)(kWYIs_iPhoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define kWYTopSafeH (CGFloat)(kWYIs_iPhoneX?(44.0):(0))
/*底部安全区域远离高度*/
#define kWYBottomSafeH (CGFloat)(kWYIs_iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kWYTopBarDifH (CGFloat)(kWYIs_iPhoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define kWYNavAndTabH (kWYNavH + kWYTabBarH)


#endif /* wyConstHeader_h */
