//
//  HouseCardSuperView.h
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+MRJFrame.h"

#define font(f)  [UIFont systemFontOfSize:f]
#define fontB(f) [UIFont fontWithName:@"Helvetica-Bold" size:f]
#define fontI(f) [UIFont fontWithName:@"Helvetica-Light" size:f]
#define Is_StringNull(string) ((string == nil || string.length == 0 || [string isEqualToString:@"(null)"]) ? YES : NO)

@interface CoreImageView: UIView

@property (nonatomic, strong) UIImageView *coreImageView;
@property (nonatomic, strong) UILabel *titleLab;

@end

@interface HouseCardSuperView : UIView

- (void)refreshUI;

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIImageView *buildImageView;
@property (nonatomic, strong) CoreImageView *coreImageView;
@property (nonatomic, strong) UILabel *brokerLab;
@property (nonatomic, strong) UILabel *buildNameLab;
@property (nonatomic, strong) UILabel *buildPriceLab;
@property (nonatomic, strong) UILabel *buildTypeLab;
@property (nonatomic, strong) UILabel *shareTitleLab;
@property (nonatomic, strong) UILabel *shareContentLab;

@property (nonatomic, copy) NSDictionary *dataSource;
@property (nonatomic, assign, readonly) CGFloat sizeScale;

@end


