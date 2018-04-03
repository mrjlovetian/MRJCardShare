//
//  FillFormBase.m
//  MRJInputView
//
//  Created by 余洪江 on 14/12/21.
//  Copyright (c) 2018年 MRJ. All rights reserved.
//

#import "FillFormBase.h"
#import "UIColor+MRJAdditions.h"
#import "Macro.h"
#import "UIView+MRJFrame.h"
#import "NSString+MRJAttributedMarkup.h"

@implementation FillFormBase

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BtnClick:)] ];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.labelTitle];
    [self addSubview:self.textField];
    [self addSubview:self.necessaryImg];
    [self addSubview:self.moreIconImg];
    [self addSubview:self.labelPlaceholder];
    [self addSubview:self.lineView];
}

- (void)BtnClick:(id)sss {
    if (_isClicked && self.onClicked) {
        self.onClicked(self);
    }
}

- (void)titleText {
    NSDictionary *style = @{@"remark":@[[UIColor colorWithHexString:@"b8b8b8"]]};
    NSString *text = [NSString stringWithFormat:@"%@ <remark>%@</remark>",_title?_title:@"",_remark?_remark:@""];
    _labelTitle.attributedText = [text attributedStringWithStyleBook:style];
}

#pragma mark -set get

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    _labelPlaceholder.text = _placeholder;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self titleText];
    if (_title.length) {
        _labelPlaceholder.hidden = YES;
    } else {
        _labelPlaceholder.hidden = NO;
    }
}

- (void)setIsClicked:(BOOL)isClicked {
    _isClicked = isClicked;
    self.userInteractionEnabled = _isClicked;
}

- (void)setIsMoreIcon:(BOOL)isMoreIcon {
    _isMoreIcon = isMoreIcon;
    _moreIconImg.hidden = !_isMoreIcon;
}

- (void)setIsNecessary:(BOOL)isNecessary {
    _isNecessary = isNecessary;
    _necessaryImg.hidden = !_isNecessary;
    
    CGFloat orX = 0;
    if (_isNecessary == YES) {
        orX = 27;
    } else {
        orX = 15;
    }
    
    CGRect titleRect = _labelTitle.frame;
    CGRect plaRect = _labelPlaceholder.frame;
    
    titleRect.origin.x = orX;
    plaRect.origin.x = orX;
    
    _labelTitle.frame = titleRect;
    _labelPlaceholder.frame = plaRect;
}

- (void)setRemark:(NSString *)remark {
    _remark = remark;
    [self titleText];
}

- (void)setRightText:(NSString *)rightText {
    _rightText = rightText;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.textColor = [UIColor colorWithHexString:@"333333"];
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont systemFontOfSize:16];
    label.text = _rightText;
    label.width = [label sizeThatFits:label.size].width + 4;
    _textField.rightView = label;
    _textField.rightViewMode = UITextFieldViewModeAlways;
}

- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(27, (self.frame.size.height-20)/2.0, SCREEN_WIDTH-50, 20)];
        _labelTitle.backgroundColor = [UIColor clearColor];
        _labelTitle.textAlignment = NSTextAlignmentLeft;
        _labelTitle.font = [UIFont systemFontOfSize:16];
        _labelTitle.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _labelTitle;
}


- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.frame = CGRectMake(27, 1, SCREEN_WIDTH - 50, self.frame.size.height - 2);
        _textField.textColor = [UIColor colorWithHexString:@"333333"];
        [_textField setValue:[UIColor colorWithHexString:@"666666"] forKeyPath:@"_placeholderLabel.textColor"];
        [_textField setValue:[UIFont systemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
        _textField.font = [UIFont systemFontOfSize:16];
    }
    return _textField;
}

- (UIImageView *)necessaryImg {
    if (!_necessaryImg) {
        _necessaryImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, (self.frame.size.height-5)/2.0, 5, 5)];
        NSURL *boundleUrl = [[NSBundle bundleForClass:[FillFormBase class]] URLForResource:@"MRJInputView" withExtension:@"bundle"];
        NSBundle *citysBundle = [NSBundle bundleWithURL:boundleUrl];
        UIImage *image = [UIImage imageNamed:[citysBundle pathForResource:@"zs_ico_btico@2x" ofType:@"png"]];
        _necessaryImg.image = image;
    }
    return _necessaryImg;
}

- (UIImageView *)moreIconImg {
    if (!_moreIconImg) {
        NSURL *boundleUrl = [[NSBundle bundleForClass:[FillFormBase class]] URLForResource:@"MRJInputView" withExtension:@"bundle"];
        NSBundle *citysBundle = [NSBundle bundleWithURL:boundleUrl];
        UIImage *image = [UIImage imageNamed:[citysBundle pathForResource:@"arrow@2x" ofType:@"png"]];
        _moreIconImg = [[UIImageView alloc] initWithImage:image];
        _moreIconImg.top = (self.height - _moreIconImg.height)/2;
        _moreIconImg.right = SCREEN_WIDTH - Edge;
    }
    return _moreIconImg;
}

- (UILabel *)labelPlaceholder {
    if (!_labelPlaceholder) {
        _labelPlaceholder = [[UILabel alloc]initWithFrame:CGRectMake(27, (self.frame.size.height-20)/2.0, SCREEN_WIDTH - 50, 20)];
        _labelPlaceholder.textColor = [UIColor colorWithHexString:@"b3b3b3"];
        _labelPlaceholder.font = [UIFont systemFontOfSize:16];
        _labelPlaceholder.textAlignment = NSTextAlignmentLeft;
    }
    return _labelPlaceholder;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 0.5, SCREEN_WIDTH, 0.5)];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"e5e5e5"];
    }
    return _lineView;
}

@end
