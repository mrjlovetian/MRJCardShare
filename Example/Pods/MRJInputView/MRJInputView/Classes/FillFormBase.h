//
//  FillFormBase.h
//  MRJInputView
//
//  Created by 余洪江 on 14/12/21.
//  Copyright (c) 2018年 MRJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClickColorView.h"

@interface FillFormBase : ClickColorView
{
    UIImageView *_necessaryImg;
}

@property (nonatomic,strong) UITextField *textField;
@property (nonatomic, strong) NSString * rightText;
@property (nonatomic, strong) UILabel *labelTitle;

@property (nonatomic, strong) NSString *title; // 标题
@property (nonatomic, strong) NSString *remark; // 标题后的备注
@property (nonatomic, assign) BOOL isNecessary;// 是否必要的
@property (nonatomic, strong) NSString *placeholder; //提示文字
@property (nonatomic, assign) BOOL isClicked; // 是否可点击
@property (nonatomic, assign) BOOL isMoreIcon; // 是否显示右边小图标:“>”
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *labelPlaceholder;
@property (nonatomic, strong) UIImageView *moreIconImg;
@property (nonatomic, copy) void (^onClicked)(FillFormBase *form);
@end
