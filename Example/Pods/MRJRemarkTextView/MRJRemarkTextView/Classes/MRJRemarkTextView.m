//
//  RemarkTextView.m
//  MRJRemarkTextView
//
//  Created by 余洪江.
//  Copyright (c) 2018年 kakao. All rights reserved.
//

#import "MRJRemarkTextView.h"
#import "UIColor+MRJAdditions.h"
#import "UIView+MRJFrame.h"

@implementation MRJRemarkTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    _textLimitNum = 0;
    self.delegate = self;
    self.font = [UIFont systemFontOfSize:16];
    self.textColor = [UIColor colorWithHexString:@"666666"];
    if (self.rowMaxCount <= 1){
        self.returnKeyType = UIReturnKeyDone;
    } else {
        self.returnKeyType = UIReturnKeyDefault;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.textContainerInset = UIEdgeInsetsMake(8.0f, 10, 22, 5);
    UILabel *placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, self.width - 30, 16)];
    placeHolderLabel.textAlignment = NSTextAlignmentLeft;
    placeHolderLabel.textColor = [UIColor colorWithHexString:@"999999"];
    placeHolderLabel.font = [UIFont systemFontOfSize:16];
    placeHolderLabel.enabled = NO;
    placeHolderLabel.tag = 102;
    [self addSubview:placeHolderLabel];
}

- (void) hidenBordy{
    [self resignFirstResponder];
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(beginEditTextMemo)]) {
            [self.delegate beginEditTextMemo];
        }
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(endEditTextMemo)]) {
            [self.delegate endEditTextMemo];
        }
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //第一个不能为空格
    if ([textView.text isEqualToString:@" "]) {
        textView.text = @"";
        return;
    }
    UILabel *label = (UILabel *)[self viewWithTag:102];
    if (textView.text.length == 0) {
        label.text = self.placeholder;
        label.hidden = NO;
    } else {
        label.text = @"";
        label.hidden = YES;
    }
    
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    // 有高亮选择的字符串，则暂不对文字进行统计和限制
    if (position) {
        return;
    }
    
    if(self.textLimitNum == 0){
        if (self.delegate && [self.delegate respondsToSelector:@selector(didRemarkTextViewChange:RemarkTextView:)]) {
            [self.delegate didRemarkTextViewChange:textView.text RemarkTextView:self];
        }
        return;
    }
    
    [self textViewLimit:textView.text];
    
    [self reloadTextLimit];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didRemarkTextViewChange:RemarkTextView:)]) {
        [self.delegate didRemarkTextViewChange:textView.text RemarkTextView:self];
    }
    
}

- (void)textViewLimit:(NSString *)text {
    NSInteger textlen = text.length;
    if(textlen > self.textLimitNum) {
        [self setText:[text substringToIndex:self.textLimitNum]];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    //删除键
    if ([text isEqualToString:@""]) {
        return YES;
    }
    if ([text isEqualToString:@"\n"]) {
        if (self.rowMaxCount <= 1) {
            [self endEditing:NO];
            return NO;
        }

         NSArray *array = [self.text componentsSeparatedByString:@"\n"];
        if (array.count >= self.rowMaxCount){
            return NO;
        }
        
        return YES;
    }
    if (self.textLimitNum == 0) {
        return YES;
    }
    NSString *new = [self.text stringByReplacingCharactersInRange:range withString:text];
    if ([self textLength:new] >= self.textLimitNum) {
        [self textViewLimit:new];
        [self reloadTextLimit];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didRemarkTextViewChange:RemarkTextView:)]) {
            [self.delegate didRemarkTextViewChange:textView.text RemarkTextView:self];
        }
        return NO;
    }
    NSInteger res = self.textLimitNum - [self textLength:new];
    if(res >= 0){
        return YES;
    } else {
        NSString *str = [NSString stringWithFormat:@"%@%@",self.text , text];
        [self textViewLimit:str];
        [self reloadTextLimit];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didRemarkTextViewChange:RemarkTextView:)]) {
            [self.delegate didRemarkTextViewChange:textView.text RemarkTextView:self];
        }
        return NO;
    }
}

- (void)reloadTextLimit {
    UIView *viewBottomLine = (UIView *)[self viewWithTag:108];
    viewBottomLine.top = self.height - 0.5;
    UILabel *numberLabel = (UILabel *)[self viewWithTag:103];
    
    CGFloat height = self.height;
    if (height < self.contentSize.height) {
        height = self.contentSize.height;
    }
    
    numberLabel.top = height - 22;
    [self scrollRectToVisible:numberLabel.frame animated:NO];
    if(numberLabel){
        if (self.text.length == 0) {
            numberLabel.hidden = YES;
        } else {
            numberLabel.attributedText = [self getTextLimitString:self.textLimitNum];
            numberLabel.hidden = NO;
        }
    }
}


- (void)setText:(NSString *)text {
    [super setText:text];
    
    UILabel *label = (UILabel *)[self viewWithTag:102];
    if (self.text.length == 0) {
        label.hidden = NO;
    } else {
        label.hidden = YES;
    }
    [self reloadTextLimit];
}

- (void)setPlaceholder:(NSString *)textViewPlaceholder {
    _placeholder = textViewPlaceholder;
    UILabel *label = (UILabel *)[self viewWithTag:102];
    label.text = _placeholder;
}

- (void)setTextLimitNum:(NSUInteger)textLimit {
    _textLimitNum = textLimit;
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - 24, self.width - 10, 22)];
    numberLabel.textAlignment = NSTextAlignmentRight;
    numberLabel.font = [UIFont systemFontOfSize:15];
    numberLabel.attributedText = [self getTextLimitString:textLimit];
    numberLabel.tag = 103;
    numberLabel.enabled = NO;
    [self insertSubview:numberLabel atIndex:2];
}

- (NSInteger)textLength:(NSString *)str {
    return str.length;
}

- (NSMutableAttributedString*)getTextLimitString:(NSUInteger)textLimit {
    NSString *textnumstr = [NSString stringWithFormat:@"%lu/",(unsigned long)[self textLength:self.text]];
    NSString *numstr = [NSString stringWithFormat:@"%lu",(unsigned long)textLimit];
    NSString *all = [NSString stringWithFormat:@"%@%@",textnumstr,numstr];
    NSMutableAttributedString *mstr = [[NSMutableAttributedString alloc]initWithString:all];
    [mstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"0091e8"] range:NSMakeRange(0, [textnumstr length])];
    [mstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"666666"] range:NSMakeRange([textnumstr length], [numstr length])];
    return mstr;
}

@end
