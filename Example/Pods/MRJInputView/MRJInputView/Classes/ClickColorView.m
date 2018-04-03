//
//  ClickColorView.m
//  MRJInputView
//
//  Created by 余洪江 on 14/12/21.
//  Copyright (c) 2018年 MRJ. All rights reserved.
//

#import "ClickColorView.h"
#import "UIColor+MRJAdditions.h"

@implementation ClickColorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _bgdColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setBgdColor:(UIColor *)bgdColor {
    _bgdColor = bgdColor;
    self.backgroundColor = _bgdColor;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.backgroundColor =self.clickColor;
}

- (UIColor *)clickColor {
    if (!_clickColor) {
        _clickColor = [UIColor colorWithHexString:@"eeeeee"];
    }
    return _clickColor;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
     [self RecoveryColor];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self RecoveryColor];
}

- (void)RecoveryColor {
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = _bgdColor;
    }];
}

@end
