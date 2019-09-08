//
//  wyPickerView.m
//  CalculateTools
//
//  Created by wangyang on 2019/9/5.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "wyPickerView.h"
#import "UIColor+WYHex.h"
#import "UIView+WYCategory.h"
#import "UILabel+WYCategory.h"
#import "UIButton+WYCategory.h"

#define kPickerH 250
#define kPickerBarH 50

@interface wyPickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *topBarView;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) void (^completion)(NSInteger index);
@end

@implementation wyPickerView

+ (wyPickerView *)wy_showPickerViewWithTitles:(NSArray *)titles
                                  selectIndex:(NSInteger)selectIndex
                                   completion:(void(^)(NSInteger index))completion {
    wyPickerView *pickerView = [[wyPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    pickerView.backgroundColor = [UIColor wy_colorWithHexString:@"000000" alpha:0.3];
    [[UIApplication sharedApplication].delegate.window addSubview:pickerView];
    
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kPickerBarH, [UIScreen mainScreen].bounds.size.width, kPickerH - kPickerBarH)];
    pickView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    pickView.backgroundColor = [UIColor whiteColor];
    pickView.dataSource = pickerView;
    pickView.delegate = pickerView;
    [pickerView.contentView addSubview:pickView];
    
    pickerView.pickerView = pickView;
    pickerView.dataArray = titles;
    pickerView.selectedIndex = selectIndex;
    pickerView.completion = completion;
    
    [UIView animateWithDuration:0.25 animations:^{
        pickerView.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - kPickerH, [UIScreen mainScreen].bounds.size.width, kPickerH);
    }];
    
    return pickerView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.topBarView.frame = CGRectMake(0, 0, [self wy_Width], kPickerBarH);
}

- (void)tapView:(UITapGestureRecognizer *)tap {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
        self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, kPickerH);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)clickSureButton:(UIButton *)button {
    [self tapView:nil];
    if (self.completion) {
        self.completion(self.selectedIndex);
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    [self.pickerView selectRow:selectedIndex inComponent:0 animated:NO];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.pickerView reloadAllComponents];
}

#pragma mark -
#pragma mark - <UIPickerViewDelegate, UIPickerViewDataSource>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return [UIScreen mainScreen].bounds.size.width;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 42;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSString *str = self.dataArray[row];
    UILabel *label = (UILabel *)view;
    if (!label) {
        label = [UILabel wy_labelWithText:str font:[UIFont systemFontOfSize:17.f] textColor:@"0f0f0f" textAlignment:NSTextAlignmentCenter];
    }
    //隐藏两条线
    ((UIView *)[pickerView.subviews objectAtIndex:1]).backgroundColor = [UIColor wy_colorWithHexString:@"e4e4e4"];
    ((UIView *)[pickerView.subviews objectAtIndex:2]).backgroundColor = [UIColor wy_colorWithHexString:@"e4e4e4"];
    
    UILabel *currentLabel = (UILabel *)[pickerView viewForRow:row forComponent:component];
    currentLabel.font = [UIFont systemFontOfSize:22];
    currentLabel.text = str;
    
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedIndex = row;
}

#pragma mark -
#pragma mark - lazy

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, kPickerH)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
    }
    return _contentView;
}

- (UIView *)topBarView {
    if (!_topBarView) {
        _topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kPickerBarH)];
        _topBarView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_topBarView];
        
        UIButton *cancelButton = [UIButton wy_buttonWithTitle:@"取消" titleColor:@"ff0000" font:[UIFont systemFontOfSize:15]];
        cancelButton.frame = CGRectMake(0, 0, 60, kPickerBarH);
        [cancelButton addTarget:self action:@selector(tapView:) forControlEvents:UIControlEventTouchUpInside];
        [_topBarView addSubview:cancelButton];
        
        UIButton *sureButton = [UIButton wy_buttonWithTitle:@"确定" titleColor:@"ff0000" font:[UIFont systemFontOfSize:15]];
        sureButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 0, 60, kPickerBarH);
        [sureButton addTarget:self action:@selector(clickSureButton:) forControlEvents:UIControlEventTouchUpInside];
        [_topBarView addSubview:sureButton];
        
    }
    return _topBarView;
}

@end

