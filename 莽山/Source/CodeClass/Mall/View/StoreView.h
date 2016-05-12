//
//  StoreView.h
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreView : UIView
@property(nonatomic,strong)UILabel *storeNameLabel; //店铺名

@property(nonatomic,strong)UILabel *addressLabel; //店铺简介

@property(nonatomic,strong)UIButton *phoneButton; //店铺电话

@property(nonatomic,strong)UIImageView *timeImage;

@property(nonatomic,strong)UILabel *timeTitleLabel;

@property(nonatomic,strong)UILabel *timeLabel; //店铺营业时间

@property(nonatomic,strong)UIImageView *locationImage;

@property(nonatomic,strong)UILabel *locationTitleLabel;

@property(nonatomic,strong)UILabel *locationLabel; //店铺位置

@property(nonatomic,strong)UIButton *locationButton; //进入导航
@end
