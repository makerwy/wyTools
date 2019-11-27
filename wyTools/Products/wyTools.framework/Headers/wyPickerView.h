//
//  wyPickerView.h
//  CalculateTools
//
//  Created by wangyang on 2019/9/5.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface wyPickerView : UIView

+ (wyPickerView *)wy_showPickerViewWithTitles:(NSArray *)titles
                                  selectIndex:(NSInteger)selectIndex
                                   completion:(void(^)(NSInteger index))completion;

@end

NS_ASSUME_NONNULL_END
