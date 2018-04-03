//
//  MRJInputFormView
//  MRJInputView
//
//  Created by 余洪江 on 14/12/21.
//  Copyright (c) 2018年 MRJ. All rights reserved.
//

#import "FillFormBase.h"


@interface MRJInputFormView : FillFormBase

@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIButton *btnClose;//展开收起


/// 一行点击输入初始化
- (void)setArrowViewWithTitle:(NSString *)title placeholder:(NSString *)placeholder onClicked:(void (^)(FillFormBase *))onclick;

/// 一行点击输入初始化，有tips
- (void)setArrowViewWithTitle:(NSString *)title placeholder:(NSString *)placeholder
                    tipsText:(NSString *)tips
                   onClicked:(void (^)(FillFormBase *))onclick;
/// 输入内容，分2行
- (void)setText1:(NSString *)upTxt text2:(NSString *)downTxt;

/// 有单位的输入初始化
- (void)setUnitViewWithTitle:(NSString *)title placeholder:(NSString *)placeholder unit:(NSString*)str;

/// 没有单位的输入初始化
- (void)setFieldTextWithTitle:(NSString *)title placeholder:(NSString *)placeHolder;

/// 右边是Switch
- (void)setSwitchWithTitle:(NSString *)title switchTarget:(nullable id)target action:(SEL _Nullable)action;

/// 右边是SegmentedControl
-(void)setSegmentedControlWithTitle:(NSString *_Nullable)title  dataArray:(NSArray *_Nullable)arrs controlTarget:(nullable id)target action:(SEL _Nullable )action;

/// 右边是收起，展开
-(void)setCloseButtonWithTitle:(NSString *_Nullable)title isClose:(BOOL)isClose onClicked:(void (^_Nullable)(UIButton * _Nullable btn, BOOL isClose))onclick;

/// title下面加tips
- (void)setTitleTips:(NSString *_Nullable)tips;
- (void)setTitleTipsAttributedText:(NSAttributedString *_Nullable)tips;
/// 设置tips
- (void)setTipsText:(NSString *_Nullable)tips;
- (void)setTipsAttributedText:(NSAttributedString *_Nullable)tips;

- (void)setTagList:(NSArray *_Nullable)tagList;

@end
