//
//  HouseCardViewD.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardViewD.h"

@implementation HouseCardViewD

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)refreshUI {
    [super refreshUI];
    
    self.buildImageView.frame = CGRectMake(0, self.height - 375*self.sizeScale, self.width, 375*self.sizeScale);
    
    self.shareTitleLab.frame = CGRectMake(30*self.sizeScale, 40 * self.sizeScale, self.width - 60*self.sizeScale, 69*self.sizeScale);
    self.shareTitleLab.textColor = [UIColor colorWithRed:255.0f/255.0f green:128.0f/255.0f blue:26.0f/255.0f alpha:1.0f];
    self.shareTitleLab.font = fontB(60*self.sizeScale);
    self.shareTitleLab.textAlignment = NSTextAlignmentCenter;
    
    self.buildNameLab.frame = CGRectMake(30*self.sizeScale, self.shareTitleLab.bottom + 20*self.sizeScale, self.width - 60*self.sizeScale, 49*self.sizeScale);
    self.buildNameLab.textColor = [UIColor colorWithRed:90.0f/255.0f green:26.0f/255.0f blue:18.0f/255.0f alpha:1.0f];
    self.buildNameLab.textAlignment = NSTextAlignmentCenter;
    self.buildNameLab.font = font(35*self.sizeScale);
    
    self.buildPriceLab.frame = CGRectMake(30*self.sizeScale, self.buildNameLab.bottom, self.width - 60*self.sizeScale, 36*self.sizeScale);
    self.buildPriceLab.textColor = [UIColor colorWithRed:90.0f/255.0f green:26.0f/255.0f blue:18.0f/255.0f alpha:1.0f];
    self.buildPriceLab.textAlignment = NSTextAlignmentCenter;
    self.buildPriceLab.font = font(25*self.sizeScale);
    
    CGRect buildTypeRect = [self.buildTypeLab.text boundingRectWithSize:CGSizeMake(0, 22*self.sizeScale) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.buildTypeLab.font} context:nil];
    CGFloat buildTypeWidth = buildTypeRect.size.width + 20*self.sizeScale;
    self.buildTypeLab.frame = CGRectMake((self.width - buildTypeWidth)/2.0, self.buildPriceLab.bottom + 10*self.sizeScale, buildTypeWidth, 22*self.sizeScale);
    self.buildTypeLab.textAlignment = NSTextAlignmentCenter;
    self.buildTypeLab.textColor = [UIColor whiteColor];
    self.buildTypeLab.layer.cornerRadius = self.buildTypeLab.height/2.0;
    self.buildTypeLab.clipsToBounds = YES;
    self.buildTypeLab.backgroundColor = [UIColor colorWithRed:245.0f/255.0f green:165.0f/255.0f blue:35.0f/255.0f alpha:1.0f];

    if (!Is_StringNull(self.shareContentLab.text)) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.maximumLineHeight = 24*self.sizeScale;
        style.minimumLineHeight = 24*self.sizeScale;
        NSMutableAttributedString *contentAtt = [[NSMutableAttributedString alloc] initWithString:self.shareContentLab.text];
        [contentAtt addAttributes:@{NSParagraphStyleAttributeName:style, NSFontAttributeName:self.shareContentLab.font, NSForegroundColorAttributeName:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f]} range:NSMakeRange(0, contentAtt.string.length)];
        CGRect shareContentRect = [self.shareContentLab.text boundingRectWithSize:CGSizeMake(325*self.sizeScale, 0) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.shareContentLab.font, NSParagraphStyleAttributeName:style} context:nil];
        self.shareContentLab.attributedText = contentAtt;
        self.shareContentLab.frame = CGRectMake(25*self.sizeScale, self.buildTypeLab.bottom + 19*self.sizeScale, 325*self.sizeScale, shareContentRect.size.height);
    }
    
    self.coreImageView.frame = CGRectMake(self.width - 30*self.sizeScale - self.coreImageView.width, self.height - 20*self.sizeScale - self.coreImageView.height, self.coreImageView.width, self.coreImageView.height);
    
    self.brokerLab.frame = CGRectMake(30*self.sizeScale, self.height - 62*self.sizeScale, self.width - 60*self.sizeScale, 22*self.sizeScale);
}

@end
