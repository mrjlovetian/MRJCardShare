//
//  EditHouseShareViewController.h
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EditBlock)(NSString *sharTitle, NSString *shareContent);

@interface EditHouseShareViewController : UIViewController

@property (nonatomic, copy) EditBlock editBlock;

@end
