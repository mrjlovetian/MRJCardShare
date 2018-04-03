//
//  HouseCardViewA.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardViewA.h"

@interface HouseCardViewA()

@property (nonatomic, strong) CALayer *backLayer;

@end

@implementation HouseCardViewA

#pragma mark method

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)refreshUI {
    [super refreshUI];
    
    self.buildImageView.frame = CGRectMake(0, self.height - 350*self.sizeScale, self.width, 350*self.sizeScale);
    
    CGRect shareTitleRect = [self.shareTitleLab.text boundingRectWithSize:CGSizeMake(0, 88*self.sizeScale) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:fontB(65*self.sizeScale)} context:nil];
    CGFloat shareTitleDidth = shareTitleRect.size.width + 28*self.sizeScale;
    self.shareTitleLab.frame = CGRectMake((self.width - shareTitleDidth)/2.0, 40 * self.sizeScale, shareTitleDidth, 88*self.sizeScale);
    self.shareTitleLab.layer.borderWidth = 2;
    self.shareTitleLab.font = fontB(65*self.sizeScale);
    self.shareTitleLab.textColor = [UIColor whiteColor];
    self.shareTitleLab.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.buildNameLab.frame = CGRectMake(40 * self.sizeScale, self.shareTitleLab.bottom + 25*self.sizeScale, self.width - 80*self.sizeScale, 56*self.sizeScale);
    self.buildNameLab.textColor = [UIColor colorWithRed:255.0f/255.0f green:242.0f/255.0f blue:77.0f/255.0f alpha:1.0f];
    
    CGRect buildPriceRect = [self.buildPriceLab.text boundingRectWithSize:CGSizeMake(0, 36*self.sizeScale) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.buildPriceLab.font} context:nil];
    self.buildPriceLab.frame = CGRectMake(self.buildNameLab.left, self.buildNameLab.bottom, buildPriceRect.size.width, 36*self.sizeScale);
    self.buildPriceLab.textColor = [UIColor colorWithRed:255.0f/255.0f green:242.0f/255.0f blue:77.0f/255.0f alpha:1.0f];
    
    CGRect buildTypeRect = [self.buildTypeLab.text boundingRectWithSize:CGSizeMake(0, 20*self.sizeScale) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.buildTypeLab.font} context:nil];
    CGFloat buildTypeWidth = buildTypeRect.size.width + 10*self.sizeScale;
    self.buildTypeLab.frame = CGRectMake(self.buildPriceLab.right + 24*self.sizeScale, self.buildPriceLab.top + 9*self.sizeScale, buildTypeWidth, 20*self.sizeScale);
    self.buildTypeLab.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:242.0f/255.0f blue:77.0f/255.0f alpha:1.0f];
    self.buildTypeLab.layer.cornerRadius = 2*self.sizeScale;
    self.buildTypeLab.textAlignment = NSTextAlignmentCenter;
    self.buildTypeLab.clipsToBounds = YES;
    self.buildTypeLab.textColor = [UIColor colorWithRed:255.0f/255.0f green:128.0f/255.0f blue:26.0f/255.0f alpha:1.0f];
    
    self.coreImageView.frame = CGRectMake(self.buildNameLab.left, self.buildPriceLab.bottom + 45*self.sizeScale, self.coreImageView.width, self.coreImageView.height);
    
    CGRect brokerRect = [self.brokerLab.text boundingRectWithSize:CGSizeMake(0, 22*self.sizeScale) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.brokerLab.font} context:nil];
    self.brokerLab.frame = CGRectMake(self.width - 36*self.sizeScale - brokerRect.size.width, self.buildTypeLab.bottom + 54*self.sizeScale, brokerRect.size.width, 22*self.sizeScale);
    
    if (!Is_StringNull(self.shareContentLab.text)) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.maximumLineHeight = 24*self.sizeScale;
        style.minimumLineHeight = 24*self.sizeScale;
        style.headIndent = 15*self.sizeScale;
        style.tailIndent = -15*self.sizeScale;
        style.firstLineHeadIndent = 15*self.sizeScale;
        NSMutableAttributedString *contentAtt = [[NSMutableAttributedString alloc] initWithString:self.shareContentLab.text];
        [contentAtt addAttributes:@{NSParagraphStyleAttributeName:style, NSFontAttributeName:self.shareContentLab.font, NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(0, contentAtt.string.length)];
        CGRect shareContentRect = [self.shareContentLab.text boundingRectWithSize:CGSizeMake(295*self.sizeScale, 0) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.shareContentLab.font, NSParagraphStyleAttributeName:style} context:nil];
        self.shareContentLab.attributedText = contentAtt;
        self.shareContentLab.frame = CGRectMake(25*self.sizeScale, self.brokerLab.bottom + 155*self.sizeScale, 295*self.sizeScale, shareContentRect.size.height);
        self.shareContentLab.layer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        self.shareContentLab.layer.frame = CGRectMake(self.shareContentLab.left, self.shareContentLab.top - 10*self.sizeScale, self.shareContentLab.width + 30*self.sizeScale, self.shareContentLab.height + 20*self.sizeScale);
        self.shareContentLab.layer.cornerRadius = 3*self.sizeScale;
    }
}

#pragma mark UI

- (CALayer *)backLayer {
    if (!_backLayer) {
        _backLayer = [CALayer layer];
    }
    return _backLayer;
}

@end
