//
//  HouseCardManager.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardManager.h"
#import "HouseCardViewA.h"
#import "HouseCardViewB.h"
#import "HouseCardViewC.h"
#import "HouseCardViewD.h"

@interface HouseCardManager() {
    CGRect _rect;
}

@property (nonatomic, strong) HouseCardViewA *houseCardViewA;
@property (nonatomic, strong) HouseCardViewB *houseCardViewB;
@property (nonatomic, strong) HouseCardViewC *houseCardViewC;
@property (nonatomic, strong) HouseCardViewD *houseCardViewD;
@property (nonatomic, strong) HouseCardSuperView *houseCardSuperView;

@end

@implementation HouseCardManager

- (UIView *)getViewWithSourceType:(SourceType)sourceType size:(CGSize)size dataSource:(NSDictionary *)dataSource {
    _dataSource = [dataSource copy];
    _rect = CGRectMake(0, 0, size.width, size.height);
    
    switch (sourceType) {
        case SourceTypeA:{
            _houseCardSuperView = self.houseCardViewA;
            _houseCardSuperView.dataSource = dataSource;
            return _houseCardSuperView;
        }
            break;
        case SourceTypeB:{
            _houseCardSuperView = self.houseCardViewB;
            _houseCardSuperView.dataSource = dataSource;
            return _houseCardSuperView;
        }
            break;
        case SourceTypeC:{
            _houseCardSuperView = self.houseCardViewC;
            _houseCardSuperView.dataSource = dataSource;
            return _houseCardSuperView;
        }
            break;
        case SourceTypeD:{
            _houseCardSuperView = self.houseCardViewD;
            _houseCardSuperView.dataSource = dataSource;
            return _houseCardSuperView;
        }
            break;
    }
    return nil;
}

- (HouseCardViewA *)houseCardViewA {
    if (!_houseCardViewA) {
        _houseCardViewA = [[HouseCardViewA alloc] initWithFrame:_rect];
        _houseCardViewA.backImageView.image = [UIImage imageNamed:@"templet01"];
    }
    return _houseCardViewA;
}

- (HouseCardViewB *)houseCardViewB {
    if (!_houseCardViewB) {
        _houseCardViewB = [[HouseCardViewB alloc] initWithFrame:_rect];
        _houseCardViewB.backImageView.image = [UIImage imageNamed:@"templet02"];
    }
    return _houseCardViewB;
}

- (HouseCardViewC *)houseCardViewC {
    if (!_houseCardViewC) {
        _houseCardViewC = [[HouseCardViewC alloc] initWithFrame:_rect];
        _houseCardViewC.backImageView.image = [UIImage imageNamed:@"templet03"];
    }
    return _houseCardViewC;
}

- (HouseCardViewD *)houseCardViewD {
    if (!_houseCardViewD) {
        _houseCardViewD = [[HouseCardViewD alloc] initWithFrame:_rect];
        _houseCardViewD.backImageView.image = [UIImage imageNamed:@"templet04"];
    }
    return _houseCardViewD;
}

#pragma mark SET

- (void)setDataSource:(NSDictionary *)dataSource {
    _dataSource = [dataSource copy];
    _houseCardSuperView.dataSource = dataSource;
}

@end
