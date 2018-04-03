//
//  HouseCardItemView.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardItemView.h"
#import "HouseCardItem.h"

@interface HouseCardItemView()

@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation HouseCardItemView

#pragma mark Method

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
}

- (void)tapItem:(UIGestureRecognizer *)tap {
    for (int i = 0; i < _dataSource.count; i ++) {
        HouseCardItem *item = (HouseCardItem *)[self viewWithTag:100 + i];
        [item hideSelectImage:YES];
    }
    
    HouseCardItem *item = (HouseCardItem *)tap.view;
    [item hideSelectImage:NO];
    
    if (self.selectBlock) {
        self.selectBlock(tap.view.tag - 100);
    }
}

#pragma mark UI

#pragma mark SET

- (void)setDataSources:(NSArray *)dataSource cloum:(NSInteger)cloum {
    _dataSource = [dataSource copy];
    CGFloat rowHeight = (self.width - (cloum - 1)*10 - 13*2)/cloum;
    for (int i = 0; i < dataSource.count; i++) {
        [[self viewWithTag:100 + i] removeFromSuperview];

        HouseCardItem *item = [[HouseCardItem alloc] initWithFrame:CGRectMake(13 + (10 + rowHeight) * (i), 0, rowHeight, rowHeight)];
        item.image = [UIImage imageNamed:dataSource[i]];
        item.tag = 100 + i;
        [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItem:)]];
        [self addSubview:item];
    }
}

@end
