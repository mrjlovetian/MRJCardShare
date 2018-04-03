//
//  EditHouseShareViewController.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "EditHouseShareViewController.h"
#import "RemarkTextView.h"
#import "InputFormView.h"

@interface EditHouseShareViewController()<RemarkTextViewDelegate>{
    NSString *_shareTitle;
    NSString *_shareContent;
}

@property (nonatomic, strong) RemarkTextView *textView;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIButton *subMitBtn;
@property (nonatomic, strong) InputFormView *inputFormView;

@end

@implementation EditHouseShareViewController

#pragma mark Methond

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.view.backgroundColor = [UIColor KK_BackgroundColor];
}

- (void)initUI {
    self.headerTitle = @"编辑内容";
    [self.view addSubview:self.inputFormView];
    [self.view addSubview:self.contentLab];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.subMitBtn];
}

- (void)submit {
    _shareTitle = self.inputFormView.textField.text;
    
    if (MF_isStringNull(_shareTitle)) {
        [self showTips:@"请输入海报标题"];
    }
    
    if (MF_isStringNull(_shareContent)) {
        [self showTips:@"请输入海报内容"];
    }
    
    if (self.editBlock) {
        self.editBlock(_shareTitle, _shareContent);
    }
    [self goBack];
}

#pragma mark - RemarkTextViewDelegate
- (void)didRemarkTextViewChange:(NSString *)textString RemarkTextView:(RemarkTextView *)view {
    _shareContent = textString;
    if (textString.length  == 0) {
        self.subMitBtn.enabled = NO;
    } else {
        self.subMitBtn.enabled = YES;
    }
}

#pragma mark UI

- (InputFormView *)inputFormView {
    if (!_inputFormView) {
        _inputFormView = [[InputFormView alloc] initWithFrame:CGRectMake(0, NavBAR_HEIGHT + 10, SCREEN_WIDTH, 50)];
        [_inputFormView setFieldTextWithTitle:@"海报主题" placeholder:@"请输入主题"];
        _inputFormView.lineView.hidden = YES;
    }
    return _inputFormView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, _inputFormView.bottom + 10, SCREEN_WIDTH, 43)];
        _contentLab.textColor = [UIColor KK_Gray99];
        _contentLab.font = KKShare.font16;
        _contentLab.text = @"     海报内容";
    }
    return _contentLab;
}

- (RemarkTextView *)textView {
    if (_textView == nil) {
        _textView = [[RemarkTextView  alloc]initWithFrame:CGRectMake(0, _contentLab.bottom, SCREEN_WIDTH, 100)];
        _textView.textLimitNum = 200;
        _textView.rdelegate = self;
    }
    return _textView;
}

- (UIButton *)subMitBtn{
    if (!_subMitBtn) {
        _subMitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _subMitBtn.frame = CGRectMake(Edge, _textView.bottom + 20, SCREEN_WIDTH - 2*Edge, 40);
        _subMitBtn.backgroundColor = KKShare.colorMain;
        _subMitBtn.layer.cornerRadius = 2.0;
        _subMitBtn.clipsToBounds = YES;
        [_subMitBtn setTitle:@"broker_Preservation".local_broker forState:UIControlStateNormal];
        _subMitBtn.titleLabel.font = KKShare.font15;
        [_subMitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subMitBtn;
}

@end
