//
//  MRJInputFormView
//  MRJInputView
//
//  Created by 余洪江 on 14/12/21.
//  Copyright (c) 2018年 MRJ. All rights reserved.
//

#import "MRJInputFormView.h"
#import "Macro.h"
#import "UIView+MRJFrame.h"
#import "UIColor+MRJAdditions.h"
#import "DWTagList.h"

@interface MRJInputFormView()
{
    UIView *_tipsView;
    UIImageView *_tipsIconView;
    BOOL isCloseButtonState;
}

@property (nonatomic, strong) UILabel *lbtips;//提示语
@property (nonatomic, strong) DWTagList *tagListView;
@property (nonatomic, copy) void (^onButtonCloseClicked)(UIButton *btnClose, BOOL isClose);

@end


@implementation MRJInputFormView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.isMoreIcon = NO;
        CGRect textRect = self.textField.frame;
        textRect.size.width = SCREEN_WIDTH - 150;
        textRect.origin.x  = SCREEN_WIDTH - 15 - (SCREEN_WIDTH - 150);
        self.textField.frame = textRect;
        self.textField.placeholder = @"请输入";
        self.textField.textAlignment = NSTextAlignmentRight;
    }
    return self;
}

- (void)setArrowViewWithTitle:(NSString *)title placeholder:(NSString *)placeholder onClicked:(void (^)(FillFormBase *))onclick {
    self.title = title;
    self.isMoreIcon = YES;
    self.isNecessary = NO;
    self.textField.placeholder = placeholder;
    self.textField.userInteractionEnabled = NO;
    self.isClicked = YES;
    self.onClicked = onclick;
    self.textField.right = SCREEN_WIDTH - 30;
    self.lineView.left = Edge;
}

/// 一行点击输入初始化，有tips
- (void)setArrowViewWithTitle:(NSString *)title placeholder:(NSString *)placeholder
                    tipsText:(NSString *)tips
                   onClicked:(void (^)(FillFormBase *))onclick {
    [self setArrowViewWithTitle:title placeholder:placeholder onClicked:onclick];
    
    [self initTipsView];
    if ([tips isKindOfClass:[NSAttributedString class]]) {
        self.lbtips.attributedText = (NSAttributedString*)tips;
    } else {
        self.lbtips.text = tips;
    }

    self.textField.top = -5;
    [self.lbtips sizeToFit];
    
    if (_tipsView.height < self.lbtips.height) {
        _tipsView.height = self.lbtips.height;
    }
    self.lbtips.left = _tipsIconView.right + 5;
    _lbtips.centerY = _tipsView.centerY;
    _tipsView.width = self.lbtips.right;
    
    _tipsView.right = self.textField.right;
    _tipsView.top = self.height/2+2;
}

/// 输入内容，分2行
- (void)setText1:(NSString *)upTxt text2:(NSString *)downTxt {
    self.textField.text = upTxt;
    [self.lbtips removeFromSuperview];
    if (downTxt == nil || downTxt.length == 0 || [downTxt isEqualToString:@"(null)"]) {
        self.textField.top = 1;
        return;
    }
    
    [self addSubview:self.lbtips];
    self.textField.top = -10;
    _lbtips.text = downTxt;
    [_lbtips sizeToFit];
    _lbtips.right = self.textField.right;
    _lbtips.top = self.height/2 + 5;
}

- (void)setUnitViewWithTitle:(NSString *)title placeholder:(NSString *)placeholder unit:(NSString *)unit {
    self.isMoreIcon = NO;
    self.isNecessary = NO;
    self.title = title;
    self.textField.placeholder = placeholder;
    self.rightText = unit;
    self.lineView.left = Edge;
    self.clickColor = self.bgdColor;
}

- (void)setFieldTextWithTitle:(NSString *)title placeholder:(NSString *)placeHolder {
    [self setUnitViewWithTitle:title placeholder:placeHolder unit:@""];
}


- (void)setSwitchWithTitle:(NSString *)title switchTarget:(nullable id)target action:(SEL)action {
    self.title = title;
    self.labelTitle.textColor = [UIColor colorWithHexString:@"333333"];
    self.isNecessary = NO;
    self.isMoreIcon = NO;
    self.textField.hidden = YES;

    if (!_switchView) {
        [self addSubview:self.switchView];
    }
    self.switchView.centerY = self.centerY;
    [self.switchView addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    self.clickColor = self.bgdColor;
}

- (void)setSegmentedControlWithTitle:(NSString *)title
                          dataArray:(NSArray *)arrs
                       controlTarget:(nullable id)target action:(SEL)action {
    self.isMoreIcon = NO;
    self.isNecessary = NO;
    self.title = title;
    self.lineView.left = Edge;
    self.textField.hidden = YES;
    [self segmentedControl:arrs];
    [self.segmentedControl addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    self.clickColor = self.bgdColor;
}

- (void)setTitleTips:(NSString *_Nullable)tips {
    self.labelTitle.bottom = self.height - self.labelTitle.height-4;
    [self setTipsText:tips];
    
    _tipsView.top = self.height/2+2;
    _tipsView.left = self.labelTitle.left;
}

- (void)setTitleTipsAttributedText:(NSAttributedString *_Nullable)tips {
    self.labelTitle.bottom = self.height - self.labelTitle.height-4;
    [self setTipsAttributedText:tips];
    
    _tipsView.top = self.height/2+2;
    _tipsView.left = self.labelTitle.left;
}

- (void)setTipsText:(NSString *)tips {
    [self initTipsView];
    self.lbtips.text = tips;
    [_lbtips sizeToFit];
    if (_tipsView.height < self.lbtips.height) {
        _tipsView.height = self.lbtips.height;
    }
    self.lbtips.left = _tipsIconView.right + 5;
    _lbtips.centerY = _tipsView.centerY;
    _tipsView.width = self.lbtips.right;
    
    _tipsView.left = [self.title sizeWithFont:self.labelTitle.font].width + 10 + Edge;
}

- (void)initTipsView {
    if (!_tipsView){
        _tipsView = [[UILabel alloc] initWithFrame:CGRectMake(0, 18, self.width, 20)];
        NSURL *boundleUrl = [[NSBundle bundleForClass:[MRJInputFormView class]] URLForResource:@"MRJInputView" withExtension:@"bundle"];
        NSBundle *citysBundle = [NSBundle bundleWithURL:boundleUrl];
        UIImage *image = [UIImage imageNamed:[citysBundle pathForResource:@"info_ico@2x" ofType:@"png"]];
        _tipsIconView = [[UIImageView alloc] initWithImage:image];
        _tipsIconView.centerY = _tipsView.centerY;
        
        [_tipsView addSubview:_tipsIconView];
        self.lbtips.left = _tipsIconView.right + 5;
        [_tipsView addSubview:self.lbtips];
        
        [self addSubview:_tipsView];
    }
}

- (void)setTipsAttributedText:(NSAttributedString *)tips {
    [self initTipsView];
    
    if (_tipsView.height < self.lbtips.height) {
        _tipsView.height = self.lbtips.height;
    }
    
    self.lbtips.attributedText = tips;
    
    [_lbtips sizeToFit];
    self.lbtips.left = _tipsIconView.right + 5;
    _lbtips.centerY = _tipsView.centerY;
    _tipsView.width = self.lbtips.right;
    
    _tipsView.left = [self.title sizeWithFont:self.labelTitle.font].width + 10 + self.labelTitle.left;
}

- (void)setButtonWithTitle:(NSString *)title  buttonTarget:(nullable id)target action:(SEL _Nullable )action {
    self.title = title;
    self.labelTitle.textColor = [UIColor colorWithHexString:@"333333"];
    self.isNecessary = NO;
    self.isMoreIcon = NO;
    self.textField.hidden = YES;
    self.clickColor = self.bgdColor;

    [self setCloseButtonState];
    [_btnClose addTarget:self action:@selector(target) forControlEvents:UIControlEventTouchUpInside];
}


- (void)setCloseButtonWithTitle:(NSString *)title isClose:(BOOL)isClose onClicked:(void (^)(UIButton *btn, BOOL isClose))onclick {
    isCloseButtonState = isClose;
    [self setButtonWithTitle:title buttonTarget:self action:@selector(click_buttonClose:)];
    self.onButtonCloseClicked = onclick;
}

- (void)setCloseButtonState {
    UIImageView *_srcImView = (UIImageView *)[self.btnClose viewWithTag:5111];
    if (isCloseButtonState){
        //关闭状态
        [_btnClose setTitle:@"展开" forState:UIControlStateNormal];
        
        _srcImView.transform = CGAffineTransformMakeRotation(0);
    } else {
        //展开状态
        [_btnClose setTitle:@"关闭" forState:UIControlStateNormal];
        _srcImView.transform = CGAffineTransformMakeRotation(-M_PI);
    }
}

- (void)setTagList:(NSArray *)tagList {
    if (!tagList || tagList.count == 0) {
        self.textField.text = @"";
        if(self.height > Cell_H){
            self.height = Cell_H;
            self.textField.centerY = self.centerY;
            self.moreIconImg.centerY = self.centerY;
            self.lineView.bottom = self.height;
        }
        return;
    }
    if (!_tagListView){
        [self addSubview:self.tagListView];
    }
    [self.tagListView setTags:tagList];
    self.textField.text = @"  ";
    self.tagListView.height = self.tagListView.contentSize.height;
    CGFloat h = self.tagListView.bottom + 12;
    if (h > Cell_H) {
        self.height = h;
        self.textField.centerY = self.centerY;
        self.moreIconImg.centerY = self.centerY;
    }
    self.lineView.bottom = self.height;
}

- (void)click_buttonClose:(UIButton *)btn {
    isCloseButtonState = !isCloseButtonState;
    [self setCloseButtonState];
    
    if (self.onButtonCloseClicked){
        self.onButtonCloseClicked(self.btnClose, isCloseButtonState);
    }
}

-(UISwitch *)switchView {
    if (!_switchView) {
        _switchView = [[UISwitch alloc]init];
        _switchView.frame = CGRectMake(SCREEN_WIDTH - Edge - 52, (self.height - 30)/2, 52, 30);
        _switchView.onTintColor = [UIColor colorWithHexString:@"0091e8"];
    }
    return _switchView;
}

- (UILabel *)lbtips {
    if (!_lbtips) {
        _lbtips = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width- 20, 20)];
        _lbtips.textColor = [UIColor colorWithHexString:@"333333"];
        _lbtips.font = [UIFont systemFontOfSize:11];
        _lbtips.textAlignment = NSTextAlignmentLeft;
    }
    return _lbtips;
}

- (UISegmentedControl *)segmentedControl:(NSArray *)arrs {
    if (!_segmentedControl){
        [_segmentedControl removeFromSuperview];
        _segmentedControl = nil;
    }
    CGFloat sw = arrs.count * 45;
    _segmentedControl = [[UISegmentedControl alloc] initWithItems: arrs];
    _segmentedControl.tintColor = [UIColor colorWithHexString:@"0091e8"];
    _segmentedControl.frame = CGRectMake(SCREEN_WIDTH - 15 - sw, (Cell_H - 30)/2, sw, 30);
    _segmentedControl.selectedSegmentIndex = 0;
    [self addSubview:_segmentedControl];
    return _segmentedControl;
}

- (UIButton *)btnClose {
    if (!_btnClose){
        CGFloat dw = 48;
        _btnClose = [[UIButton alloc] initWithFrame: CGRectMake(SCREEN_WIDTH - Edge - dw, (self.height - dw)/2, dw, dw)];
        _btnClose.titleLabel.font = [UIFont systemFontOfSize:11];
        [_btnClose setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        
        UIImageView *_srcImView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        NSURL *boundleUrl = [[NSBundle bundleForClass:[MRJInputFormView class]] URLForResource:@"MRJInputView" withExtension:@"bundle"];
        NSBundle *citysBundle = [NSBundle bundleWithURL:boundleUrl];
        UIImage *image = [UIImage imageNamed:[citysBundle pathForResource:@"arrow_gray_up@2x" ofType:@"png"]];
        _srcImView.image =image;
        _srcImView.contentMode = UIViewContentModeCenter;
        _srcImView.right = _btnClose.width;
        _srcImView.centerY = _btnClose.centerY;
        _srcImView.tag = 5111;
        [_btnClose addSubview:_srcImView];
        [self addSubview:_btnClose];
    }
    return _btnClose;
}

- (DWTagList *)tagListView {
    if (!_tagListView) {
        _tagListView = [[DWTagList alloc] initWithFrame:CGRectMake(110, Edge, SCREEN_WIDTH - 110 - 30, 16)];
        _tagListView.font = [UIFont systemFontOfSize:11];
        [_tagListView setScrollEnabled:NO];
        _tagListView.borderWidth = 0;
        _tagListView.cornerRadius = 2;
        _tagListView.textColor = [UIColor colorWithHexString:@"ff801a"];
        _tagListView.verticalPadding=1.0;
        _tagListView.horizontalPadding = 4.0;
        _tagListView.highlightedBackgroundColor = [[UIColor colorWithHexString:@"ff801a"] colorWithAlphaComponent:0.3];
        [_tagListView setTagBackgroundColor:[UIColor colorWithHexString:@"fff1e5"]];
    }
    return _tagListView;
}

@end
