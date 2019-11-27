//
//  UITableView+WYMethods.h
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (WYMethods)

- (void)wy_registerCellNib:(NSString *)classString;
- (void)wy_registerCellClass:(NSString *)classString;
- (void)wy_registerCellHeaderFooterNib:(NSString *)classString;
- (void)wy_registerCellHeaderFooterClass:(NSString *)classString;
- (void)wy_estimatedHeight;

@end
