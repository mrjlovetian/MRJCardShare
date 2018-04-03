//
//  HouseCardViewController.m
//  MRJCardShare
//
//  Created by mrj on 2018/3/30.
//  Copyright © 2018年 余洪江 All rights reserved.
//

#import "HouseCardViewController.h"
#import "HouseCardManager.h"
#import "HouseCardItemView.h"
#import "EditHouseShareViewController.h"
#import "UIButton+MRJBlock.h"
#import "Macro.h"
#import "UIView+MRJFrame.h"
#import "UIColor+MRJAdditions.h"
//#import "UIView+ZXQuartz.h"
//#import "ShareSDKMethod.h"

@interface HouseCardViewController (){
    NSMutableDictionary *_dataSource;
}

@property (nonatomic, strong) HouseCardManager *houseCardManager;
@property (nonatomic, strong) HouseCardItemView *houseCardItemView;
@property (nonatomic, strong) UIButton *shareBtn;

@end

@implementation HouseCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [NSMutableDictionary dictionaryWithCapacity:1];

    [_dataSource setObject:@"卡考一号" forKey:@"buildName"];
    [_dataSource setObject:@"酒店式公寓" forKey:@"buildType"];
    [_dataSource setObject:@"均价6666元/㎡" forKey:@"buildPrice"];
    [_dataSource setObject:@"张三 1888888888" forKey:@"broker"];
    [_dataSource setObject:@"盛大开盘" forKey:@"shareTitle"];
    [_dataSource setObject:@"http://imgapi.apitops.com/TEST/broker-article/20180328/a6cf70f8cb9f4003a539db886a626359.png" forKey:@"buildImage"];
    [_dataSource setObject:@"框架和覅灰色覅都是复活石地回复哦诶麸一hi怕hiUS福收到货发货速度if还是丢回复is电话费司电话覅USD话锋使皮肤水电费十多个我以乙方违约覅呀" forKey:@"shareContent"];
    [self initUI];
}

- (void)initUI {
    self.title = @"选择模板";
//    [self setDoActionTintTitle:@"编辑" highlightTitle:@"编辑"];
    self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    
    CGFloat height = SCREEN_HEIGHT - NavBAR_HEIGHT - 23*2*V_ScaleRate_New_W - SCREEN_Bottom_height - 45 - 10 - 20 - 80*V_ScaleRate_New_W;
    CGFloat width = 226.0 * height / 402.0;
    
    CGSize size = CGSizeMake(width, height);
    __block UIView *houseResultView = [self.houseCardManager getViewWithSourceType:1 size:size dataSource:@{}];
    houseResultView.top = NavBAR_HEIGHT + 23*V_ScaleRate_New_W;
    houseResultView.centerX = self.view.centerX;
    [self.view addSubview:houseResultView];
    [self.view addSubview:self.houseCardItemView];
    [self.view addSubview:self.shareBtn];
    
    __weak typeof(self) weakSelf = self;
    self.houseCardItemView.selectBlock = ^(NSInteger index) {
        [houseResultView removeFromSuperview];
        houseResultView = [weakSelf.houseCardManager getViewWithSourceType:index size:size dataSource:_dataSource];
        houseResultView.top = NavBAR_HEIGHT + 23*V_ScaleRate_New_W;
        houseResultView.centerX = weakSelf.view.centerX;
        [weakSelf.view addSubview:houseResultView];
    };
    
//    [self.shareBtn addActionHandler:^(NSInteger tag) {
//        UIImage *image = [houseResultView makeImageWithView:houseResultView withSize:houseResultView.size];
//        NSData *data = nil;
//        if (iPhone5||iPhone4) {
//            data = UIImageJPEGRepresentation(image, 1.0);
//        } else {
//            data =UIImageJPEGRepresentation(image, 0.8);
//        }
//        UIImage *newImage = [UIImage imageWithData:data];
//
//        [ShareSDKMethod shareActionHouseInView:weakSelf.view title:@"楼盘分享" content:@"" houseInfo:nil image:newImage imageUrl:@"" deepUrl:@"" showClub:YES showKber:YES showBroker:YES shareScoureType:ShareScoureType_web success:nil fail:nil];
//    }];
}

- (void)doAction {
    EditHouseShareViewController *vc = [EditHouseShareViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    __weak typeof(self) weakSelf = self;
    vc.editBlock = ^(NSString *sharTitle, NSString *shareContent) {
        [_dataSource setObject:sharTitle forKey:@"shareTitle"];
        [_dataSource setObject:shareContent forKey:@"shareContent"];
        weakSelf.houseCardManager.dataSource = _dataSource;
    };
}

#pragma mark mark UI

- (HouseCardManager *)houseCardManager {
    if (!_houseCardManager) {
        _houseCardManager = [[HouseCardManager alloc] init];
    }
    return _houseCardManager;
}

- (HouseCardItemView *)houseCardItemView {
    if (!_houseCardItemView) {
        _houseCardItemView = [[HouseCardItemView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 10 - 45 - 20 - 80*V_ScaleRate_New_W - SCREEN_Bottom_height, SCREEN_WIDTH,  80*V_ScaleRate_New_W)];
        [_houseCardItemView setDataSources:@[@"style01", @"style02", @"style03", @"style04"] cloum:4];
    }
    return _houseCardItemView;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.frame = CGRectMake(Edge, SCREEN_HEIGHT - 55 - SCREEN_Bottom_height, SCREEN_WIDTH - 2*Edge, 45);
        [_shareBtn setTitle:@"去分享" forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _shareBtn.layer.cornerRadius = 3.0;
        _shareBtn.clipsToBounds = YES;
        _shareBtn.backgroundColor = [UIColor colorWithHexString:@"0091e8"];
        [_shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _shareBtn;
}

@end
