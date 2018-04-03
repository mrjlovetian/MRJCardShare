//
//  HouseCardSuperView.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardSuperView.h"
#import "UIImageView+WebCache.h"
#import "MRJ_QRCode.h"


@implementation CoreImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.coreImageView];
    [self addSubview:self.titleLab];
}

#pragma mark UI

- (UIImageView *)coreImageView {
    if (!_coreImageView) {
        _coreImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _coreImageView.height = self.width;
    }
    return _coreImageView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, _coreImageView.bottom, _coreImageView.width, 17)];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"了解详情";
    }
    return _titleLab;
}

@end

@implementation HouseCardSuperView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    [self addSubview:self.buildImageView];
    [self addSubview:self.backImageView];
    [self addSubview:self.coreImageView];
    [self addSubview:self.brokerLab];
    [self addSubview:self.buildNameLab];
    [self addSubview:self.buildPriceLab];
    [self addSubview:self.buildTypeLab];
    [self addSubview:self.shareTitleLab];
    [self addSubview:self.shareContentLab];
    
    self.coreImageView.coreImageView.height = self.coreImageView.height - 17*self.sizeScale;
    self.coreImageView.titleLab.height = 17*self.sizeScale;
    self.coreImageView.titleLab.font = font(12 * self.sizeScale);
}

- (void)refreshUI {
    
}

#pragma mark UI

- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _backImageView;
}

- (CoreImageView *)coreImageView {
    if (!_coreImageView) {
        _coreImageView = [[CoreImageView alloc] initWithFrame:CGRectMake(0, 0, 60*self.sizeScale, 77*self.sizeScale)];
    }
    return _coreImageView;
}

- (UILabel *)brokerLab {
    if (!_brokerLab) {
        _brokerLab = [[UILabel alloc] init];
        _brokerLab.font = font(16*self.sizeScale);
        _brokerLab.textColor = [UIColor whiteColor];
    }
    return _brokerLab;
}

- (UILabel *)buildNameLab {
    if (!_buildNameLab) {
        _buildNameLab = [[UILabel alloc] init];
        _buildNameLab.font = font(40*self.sizeScale);
        _buildNameLab.textColor = [UIColor whiteColor];
    }
    return _buildNameLab;
}

- (UILabel *)buildPriceLab {
    if (!_buildPriceLab) {
        _buildPriceLab = [[UILabel alloc] init];
        _buildPriceLab.font = font(25*self.sizeScale);
    }
    return _buildPriceLab;
}

- (UILabel *)buildTypeLab {
    if (!_buildTypeLab) {
        _buildTypeLab = [[UILabel alloc] init];
        _buildTypeLab.font = font(12*self.sizeScale);
    }
    return _buildTypeLab;
}

- (UILabel *)shareTitleLab {
    if (!_shareTitleLab) {
        _shareTitleLab = [[UILabel alloc] init];
        _shareTitleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _shareTitleLab;
}

- (UILabel *)shareContentLab {
    if (!_shareContentLab) {
        _shareContentLab = [[UILabel alloc] init];
        _shareContentLab.font = font(15*self.sizeScale);
        _shareContentLab.numberOfLines = 0;
        _shareContentLab.text = @"";
    }
    return _shareContentLab;
}

- (UIImageView *)buildImageView {
    if (!_buildImageView) {
        _buildImageView = [[UIImageView alloc] init];
    }
    return _buildImageView;
}

#pragma mark Set

- (void)setDataSource:(NSDictionary *)dataSource {
    _dataSource = [dataSource copy];
    self.buildNameLab.text = dataSource[@"buildName"];
    self.buildTypeLab.text = dataSource[@"buildType"];
    self.buildPriceLab.text = dataSource[@"buildPrice"];
    self.brokerLab.text = dataSource[@"broker"];
    self.shareTitleLab.text = dataSource[@"shareTitle"];
    self.shareContentLab.text = dataSource[@"shareContent"];
    [self.buildImageView sd_setImageWithURL:[NSURL URLWithString:dataSource[@"buildImage"]]];
    [self refreshUI];
    
//    self.coreImageView.coreImageView.image = [TopsQRCodeTool TopsgenerateWithDefaultQRCodeData:@{@"name":@"yhj"} imageViewWidth:self.coreImageView.width encryptType:(EncryptTypeNone) errorHandle:^(NSString *err) {
//
//    }];
}

#pragma mark Get

- (CGFloat)sizeScale {
    return self.width/375.0;
}

@end
