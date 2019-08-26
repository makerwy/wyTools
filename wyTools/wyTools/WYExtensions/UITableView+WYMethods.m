//
//  UITableView+WYMethods.m
//  WYSDKDemo
//
//  Created by yons on 2019/4/24.
//  Copyright © 2019年 yons. All rights reserved.
//

#import "UITableView+WYMethods.h"

@implementation UITableView (WYMethods)

- (void)wy_registerCellNib:(NSString *)classString {
    [self registerNib:[UINib nibWithNibName:classString bundle:nil] forCellReuseIdentifier:classString];
}
- (void)wy_registerCellClass:(NSString *)classString {
    [self registerClass:NSClassFromString(classString) forCellReuseIdentifier:classString];
}
- (void)wy_registerCellHeaderFooterNib:(NSString *)classString {
    [self registerNib:[UINib nibWithNibName:classString bundle:nil] forHeaderFooterViewReuseIdentifier:classString];
}
- (void)wy_registerCellHeaderFooterClass:(NSString *)classString {
    [self registerClass:NSClassFromString(classString) forHeaderFooterViewReuseIdentifier:classString];
}
- (void)wy_estimatedHeight {
    self.estimatedRowHeight = UITableViewAutomaticDimension;
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
}

@end
