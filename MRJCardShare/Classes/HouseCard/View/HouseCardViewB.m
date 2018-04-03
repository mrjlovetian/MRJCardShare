//
//  HouseCardViewB.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardViewB.h"

@implementation HouseCardViewB

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

- (void)refreshUI {
    [super refreshUI];
    
    self.buildImageView.frame = CGRectMake(15*self.sizeScale, 128*self.sizeScale, self.width - 30*self.sizeScale, 200*self.sizeScale);
    
    self.buildNameLab.frame = CGRectMake(15*self.sizeScale, 40*self.sizeScale, self.width - 30*self.sizeScale, 56*self.sizeScale);
    self.buildNameLab.textAlignment = NSTextAlignmentCenter;
    self.buildNameLab.textColor = [UIColor colorWithRed:235.0f/255.0f green:204.0f/255.0f blue:136.0f/255.0f alpha:1.0f];
    self.buildNameLab.font = font(40*self.sizeScale);
    
    self.buildTypeLab.frame = CGRectMake(15*self.sizeScale, self.buildNameLab.bottom + 5*self.sizeScale, self.buildNameLab.width, 17*self.sizeScale);
    self.buildTypeLab.textColor = [UIColor whiteColor];
    self.buildTypeLab.font = font(12*self.sizeScale);
    self.buildTypeLab.textAlignment = NSTextAlignmentCenter;
    
    self.buildPriceLab.frame = CGRectMake(15*self.sizeScale, self.buildTypeLab.bottom + 225*self.sizeScale, self.buildNameLab.width, 36*self.sizeScale);
    self.buildPriceLab.textColor = [UIColor colorWithRed:235.0f/255.0f green:204.0f/255.0f blue:136.0f/255.0f alpha:1.0f];
    self.buildPriceLab.font = font(25*self.sizeScale);
    self.buildPriceLab.textAlignment = NSTextAlignmentCenter;
    
    self.shareTitleLab.frame = CGRectMake(15*self.sizeScale, self.buildPriceLab.bottom + 32*self.sizeScale, self.buildNameLab.width, 28*self.sizeScale);
    self.shareTitleLab.font = font(24*self.sizeScale);
    self.shareTitleLab.textColor = [UIColor colorWithRed:235.0f/255.0f green:204.0f/255.0f blue:136.0f/255.0f alpha:1.0f];
    
    if (!Is_StringNull(self.shareContentLab.text)) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.maximumLineHeight = 24*self.sizeScale;
        style.minimumLineHeight = 24*self.sizeScale;
        NSMutableAttributedString *contentAtt = [[NSMutableAttributedString alloc] initWithString:self.shareContentLab.text];
        [contentAtt addAttributes:@{NSParagraphStyleAttributeName:style, NSFontAttributeName:self.shareContentLab.font, NSForegroundColorAttributeName:[UIColor colorWithRed:235.0f/255.0f green:204.0f/255.0f blue:136.0f/255.0f alpha:1.0f]} range:NSMakeRange(0, contentAtt.string.length)];
        CGRect shareContentRect = [self.shareContentLab.text boundingRectWithSize:CGSizeMake(325*self.sizeScale, 0) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.shareContentLab.font, NSParagraphStyleAttributeName:style} context:nil];
        self.shareContentLab.attributedText = contentAtt;
        self.shareContentLab.frame = CGRectMake(25*self.sizeScale, self.shareTitleLab.bottom + 5*self.sizeScale, 325*self.sizeScale, shareContentRect.size.height);
    }
    
    self.coreImageView.frame = CGRectMake(self.width - 30*self.sizeScale - self.coreImageView.width, self.height - 20*self.sizeScale - self.coreImageView.height, self.coreImageView.width, self.coreImageView.height);
    
    self.brokerLab.frame = CGRectMake(30*self.sizeScale, self.height - 62*self.sizeScale, self.width - 60*self.sizeScale, 22*self.sizeScale);
}

@end
