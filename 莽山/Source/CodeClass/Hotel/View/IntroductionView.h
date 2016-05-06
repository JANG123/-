//
//  IntroductionView.h
//  莽山
//
//  Created by jang on 16/4/25.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroductionView : UIView

@property(nonatomic,strong)NSString *titleStr;//简介

@property(nonatomic,strong)UILabel *spaceLabel1;
@property(nonatomic,strong)UILabel *spaceLabel2;
@property(nonatomic,strong)UILabel *bedLabel1;
@property(nonatomic,strong)UILabel *bedLabel2;
@property(nonatomic,strong)UILabel *numLabel1;
@property(nonatomic,strong)UILabel *numLabel2;
@property(nonatomic,strong)UILabel *timeLabel1;
@property(nonatomic,strong)UILabel *timeLabel2;
@property(nonatomic,strong)UILabel *dateLabel1;
@property(nonatomic,strong)UIButton *dateButton;
@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *wifiLabel;
@property(nonatomic,strong)UIImageView *wifiImageView;
@property(nonatomic,strong)UILabel *toiletLabel;
@property(nonatomic,strong)UIImageView *toiletImageView;
@property(nonatomic,strong)UILabel *airConditioningLabel;
@property(nonatomic,strong)UIImageView *airConditioningImageView;
@property(nonatomic,strong)UILabel *kitchenLabel;
@property(nonatomic,strong)UIImageView *kitchenImageView;
@property(nonatomic,strong)UILabel *washLabel;
@property(nonatomic,strong)UIImageView *washImageView;
@property(nonatomic,strong)UILabel *TVLabel;
@property(nonatomic,strong)UIImageView *TVImageView;
@property(nonatomic,strong)UILabel *ovenLabel;
@property(nonatomic,strong)UIImageView *ovenImageView;
@end
