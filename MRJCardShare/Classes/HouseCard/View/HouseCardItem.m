//
//  HouseCardItem.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardItem.h"

@interface HouseCardItem()

@property (nonatomic, strong) UIImageView *selectImageView;

@end

@implementation HouseCardItem

#pragma mark Method

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.selectImageView];
}

- (void)hideSelectImage:(BOOL)hide {
    _selectImageView.hidden = hide;
}

#pragma mark UI

- (UIImageView *)selectImageView {
    if (!_selectImageView){
        _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width - 29, 8, 21, 21)];
        _selectImageView.layer.cornerRadius = _selectImageView.height/2.0;
        _selectImageView.clipsToBounds = YES;
        _selectImageView.hidden = YES;
        _selectImageView.image = [UIImage imageNamed:@"ico_share_selected"];
    }
    return _selectImageView;
}

@end
