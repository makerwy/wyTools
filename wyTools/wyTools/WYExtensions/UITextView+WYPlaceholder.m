//
//  UITextView+WYPlaceholder.m
//  KoreanTools
//
//  Created by wangyang on 2019/9/2.
//  Copyright © 2019 wangyang. All rights reserved.
//

#import "UITextView+WYPlaceholder.h"
#import <objc/runtime.h>

static char *labelKey = "wy_placeholderKey";
static char *needAdjust = "wy_needAdjust";
static char *changeLocation = "wy_location";

@implementation UITextView (wyPlaceholder)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self.class,NSSelectorFromString(@"dealloc") ),class_getInstanceMethod(self.class, NSSelectorFromString(@"swizzledDealloc")));
}

- (void)swizzledDealloc {
    
    NSLog(@"swizzledDealloc");
    // 移除观察
    if (objc_getAssociatedObject(self, @selector(wy_placeholdLabel))) [self removeObserver:self forKeyPath:@"font"];
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self swizzledDealloc];
}

#pragma mark -   设置placeholderLabel
- (UILabel *)wy_placeholdLabel{
    
    UILabel *label = objc_getAssociatedObject(self, labelKey);
    if (!label) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        label.textColor = [self.class defaultColor];
        
        objc_setAssociatedObject(self, labelKey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        //添加通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel) name:UITextViewTextDidChangeNotification object:nil];
        //监听font的变化
        [self addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:nil];
    }
    return label;
}

#pragma mark -  设置默认颜色
+ (UIColor *)defaultColor{
    
    static UIColor *color = nil;
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        color = [textField valueForKeyPath:@"_placeholderLabel.textColor"];
    });
    return color;
}

#pragma mark - set get methods


- (void)setWy_placeholder:(NSString *)wy_placeholder {
    
    self.wy_placeholdLabel.text = wy_placeholder;
    [self updateLabel];
}

- (NSString *)wy_placeholder{
    
    return self.wy_placeholdLabel.text;
}

- (void)setWy_placeholderColor:(UIColor *)wy_placeholderColor{
    
    self.wy_placeholdLabel.textColor = wy_placeholderColor;
    [self updateLabel];
}

- (UIColor *)wy_placeholderColor{
    
    return self.wy_placeholdLabel.textColor;
}

- (void)setWy_attributePlaceholder:(NSAttributedString *)wy_attributePlaceholder{
    
    self.wy_placeholdLabel.attributedText = wy_attributePlaceholder;
    [self updateLabel];
}

- (NSAttributedString *)wy_attributePlaceholder{
    
    return self.wy_placeholdLabel.attributedText;
}

- (void)setWy_location:(CGPoint)wy_location{
    
    objc_setAssociatedObject(self, changeLocation,NSStringFromCGPoint(wy_location), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateLabel];
}

- (CGPoint)wy_location{
    
    return CGPointFromString(objc_getAssociatedObject(self, changeLocation));
}

#pragma mark - 是否需要调整字体
- (BOOL)needAdjustFont{
    
    return [objc_getAssociatedObject(self, needAdjust) boolValue];
}

- (void)setNeedAdjustFont:(BOOL)needAdjustFont{
    
    objc_setAssociatedObject(self, needAdjust, @(needAdjustFont), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - observer font KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"font"]){
        
        self.needAdjustFont = YES;
        [self updateLabel];
    }
}

#pragma mark -  更新label信息
- (void)updateLabel{
    
    if (self.text.length) {
        [self.wy_placeholdLabel removeFromSuperview];
        return;
    }
    
    //显示label
    [self insertSubview:self.wy_placeholdLabel atIndex:0];
    
    // 是否需要更新字体（NO 采用默认字体大小）
    if (self.needAdjustFont) {
        self.wy_placeholdLabel.font = self.font;
        self.needAdjustFont = NO;
    }
    
    CGFloat lineFragmentPadding =  self.textContainer.lineFragmentPadding;  //边距
    UIEdgeInsets contentInset = self.textContainerInset;
    
    //设置label frame
    CGFloat labelX = lineFragmentPadding + contentInset.left;
    CGFloat labelY = contentInset.top;
    
    if (self.wy_location.x != 0 || self.wy_location.y != 0) {
        if (self.wy_location.x < 0 || self.wy_location.x > CGRectGetWidth(self.bounds) - lineFragmentPadding - contentInset.right || self.wy_location.y< 0) {
            // 不做处理
        }else{
            labelX += self.wy_location.x;
            labelY += self.wy_location.y;
        }
    }
    
    CGFloat labelW = CGRectGetWidth(self.bounds) - contentInset.right - labelX;
    CGFloat labelH = [self.wy_placeholdLabel sizeThatFits:CGSizeMake(labelW, MAXFLOAT)].height;
    self.wy_placeholdLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
@end
