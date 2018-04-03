//
//  HouseCardViewC.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardViewC.h"

@implementation HouseCardViewC

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)refreshUI {
    [super refreshUI];
    
    self.buildImageView.frame = CGRectMake(0, 0, self.width, 290*self.sizeScale);
    
    self.shareTitleLab.frame = CGRectMake(15*self.sizeScale, 40 * self.sizeScale, self.width - 30*self.sizeScale, 74*self.sizeScale);
    self.shareTitleLab.textColor = [UIColor whiteColor];
    self.shareTitleLab.font = fontB(65*self.sizeScale);
    
    self.buildTypeLab.frame = CGRectMake((self.width - 80*self.sizeScale)/2.0, self.shareTitleLab.bottom + 166*self.sizeScale, 80*self.sizeScale, 20*self.sizeScale);
    self.buildTypeLab.font = font(12*self.sizeScale);
    self.buildTypeLab.textAlignment = NSTextAlignmentCenter;
    self.buildTypeLab.textColor = [UIColor colorWithRed:46.0f/255.0f green:82.0f/255.0f blue:4.0f/255.0f alpha:1.0f];

    self.buildNameLab.frame = CGRectMake(15*self.sizeScale, self.buildTypeLab.bottom + 20*self.sizeScale, self.width - 30*self.sizeScale, 49*self.sizeScale);
    self.buildNameLab.textColor = [UIColor colorWithRed:227.0f/255.0f green:217.0f/255.0f blue:154.0f/255.0f alpha:1.0f];
    self.buildNameLab.textAlignment = NSTextAlignmentCenter;
    self.buildNameLab.font = font(35*self.sizeScale);
    
    self.buildPriceLab.frame = CGRectMake(15*self.sizeScale, self.buildNameLab.bottom, self.width - 30*self.sizeScale, 36*self.sizeScale);
    self.buildPriceLab.textColor = [UIColor colorWithRed:227.0f/255.0f green:217.0f/255.0f blue:154.0f/255.0f alpha:1.0f];
    self.buildPriceLab.textAlignment = NSTextAlignmentCenter;
    self.buildPriceLab.font = font(25*self.sizeScale);
    
    if (!MF_isStringNull(self.shareContentLab.text)) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.maximumLineHeight = 24*self.sizeScale;
        style.minimumLineHeight = 24*self.sizeScale;
        NSMutableAttributedString *contentAtt = [[NSMutableAttributedString alloc] initWithString:self.shareContentLab.text];
        [contentAtt addAttributes:@{NSParagraphStyleAttributeName:style, NSFontAttributeName:self.shareContentLab.font, NSForegroundColorAttributeName:[UIColor colorWithRed:227.0f/255.0f green:217.0f/255.0f blue:154.0f/255.0f alpha:1.0f]} range:NSMakeRange(0, contentAtt.string.length)];
        CGRect shareContentRect = [self.shareContentLab.text boundingRectWithSize:CGSizeMake(325*self.sizeScale, 0) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.shareContentLab.font, NSParagraphStyleAttributeName:style} context:nil];
        self.shareContentLab.attributedText = contentAtt;
        self.shareContentLab.frame = CGRectMake(25*self.sizeScale, self.buildPriceLab.bottom + 5*self.sizeScale, 325*self.sizeScale, shareContentRect.size.height);
    }
    
    self.coreImageView.frame = CGRectMake(self.width - 30*self.sizeScale - self.coreImageView.width, self.height - 20*self.sizeScale - self.coreImageView.height, self.coreImageView.width, self.coreImageView.height);
    
    self.brokerLab.frame = CGRectMake(15*self.sizeScale, self.height - 62*self.sizeScale, self.width - 30*self.sizeScale, 22*self.sizeScale);
}

@end
