//
//  StoreView.m
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "StoreView.h"

@implementation StoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

-(void)p_setupView
{
    _storeNameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 10/PxHeight, kScreenWidth/2, 35/PxHeight) title:@"农家休闲店" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_storeNameLabel];
    _addressLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_storeNameLabel.frame), CGRectGetMaxY(_storeNameLabel.frame), CGRectGetWidth(_storeNameLabel.frame), CGRectGetHeight(_storeNameLabel.frame)) title:@"湖南莽山森林公园附近500m" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_addressLabel];
    _phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _phoneButton.frame = CGRectMake(kScreenWidth - 65/PxWidth, 15/PxHeight, 40/PxWidth, 40/PxWidth);
    [_phoneButton setImage:[UIImage imageNamed:@"电话"] forState:UIControlStateNormal];
    [self addSubview:_phoneButton];
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_addressLabel.frame), kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self addSubview:lineLabel];
    
    _timeImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_addressLabel.frame), CGRectGetMaxY(_addressLabel.frame) + 18/PxHeight, 25/PxHeight, 25/PxHeight)];
    _timeImage.image = [UIImage imageNamed:@"时间"];
    [self addSubview:_timeImage];
    _timeTitleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_timeImage.frame) + 20/PxWidth, CGRectGetMinY(_timeImage.frame), 100/PxWidth, CGRectGetHeight(_timeImage.frame)) title:@"营业时间:" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_timeTitleLabel];
    
    _timeLabel= [UILabel setFrame:CGRectMake(CGRectGetMaxX(_timeTitleLabel.frame), CGRectGetMinY(_timeTitleLabel.frame), kScreenWidth/3, CGRectGetHeight(_timeTitleLabel.frame)) title:@"10:00-23:00" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_timeLabel];
    
    
    _locationImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_timeImage.frame), CGRectGetMaxY(_timeImage.frame) + 15/PxHeight, 25/PxHeight, 25/PxHeight)];
    _locationImage.image = [UIImage imageNamed:@"地图导航"];
    [self addSubview:_locationImage];
    _locationTitleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_locationImage.frame) + 20/PxWidth, CGRectGetMinY(_locationImage.frame), CGRectGetWidth(_timeTitleLabel.frame), CGRectGetHeight(_locationImage.frame)) title:@"地图导航:" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_locationTitleLabel];
    
    _locationLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_locationTitleLabel.frame), CGRectGetMinY(_locationTitleLabel.frame), kScreenWidth/3, CGRectGetHeight(_locationTitleLabel.frame)) title:@"xxx路xxx号" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_locationLabel];
    
    _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _locationButton.frame = CGRectMake(kScreenWidth - 55/PxWidth, CGRectGetMinY(_locationTitleLabel.frame), 30/PxWidth, 30/PxWidth);
    [_locationButton setImage:[UIImage imageNamed:@"个人中心_下一页"] forState:UIControlStateNormal];
    [self addSubview:_locationButton];
    
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_locationLabel.frame) + 17/PxHeight, kScreenWidth, 1)];
    lineLabel1.backgroundColor = Color_back;
    [self addSubview:lineLabel1];
}

@end
