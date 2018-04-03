//
//  HouseCardItemView.h
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HouseCardItemViewBlock)(NSInteger index);

@interface HouseCardItemView : UIView

@property (nonatomic, copy) HouseCardItemViewBlock selectBlock;

- (void)setDataSources:(NSArray *)dataSource cloum:(NSInteger)cloum;

@end
