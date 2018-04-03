//
//  RemarkTextView.h
//  MRJRemarkTextView
//
//  Created by 余洪江.
//  Copyright (c) 2018年 kakao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRJRemarkTextView;
@protocol RemarkTextViewDelegate <NSObject>

@optional

- (void)didRemarkTextViewChange:(NSString *)textString RemarkTextView:(MRJRemarkTextView *)view;
- (void)beginEditTextMemo;
- (void)endEditTextMemo;

@end


@interface MRJRemarkTextView : UITextView <UITextViewDelegate>

@property (nonatomic, weak) id <RemarkTextViewDelegate>delegate;
@property (nonatomic, strong) NSString * placeholder;
@property (nonatomic, assign) NSUInteger textLimitNum;
@property (nonatomic, assign) NSUInteger rowMaxCount;

- (void)setText:(NSString *)text;

@end
