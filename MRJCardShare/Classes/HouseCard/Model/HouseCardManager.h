//
//  HouseCardManager.h
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SourceTypeA,
    SourceTypeB,
    SourceTypeC,
    SourceTypeD
} SourceType;

@interface HouseCardManager : NSObject

- (UIView *)getViewWithSourceType:(SourceType)sourceType size:(CGSize)size dataSource:(NSDictionary *)dataSource;

@property (nonatomic, strong) NSDictionary *dataSource;

@end
