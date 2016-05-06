//
//  RoomTypeButton.m
//  莽山
//
//  Created by jang on 16/4/25.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "RoomTypeButton.h"

@implementation RoomTypeButton

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
    _typeLabel = [UILabel setFrame:CGRectMake(15/PxWidth, 0, kScreenWidth/2 - 15/PxWidth, 40/PxHeight) title:@"标准房间" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_typeLabel];
    
    _priceLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_typeLabel.frame), 18/PxHeight, kScreenWidth/2 - 25/PxWidth, 25/PxHeight) title:@"￥480/晚" tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_priceLabel];
    
    _classLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_typeLabel.frame), CGRectGetMaxY(_typeLabel.frame) +10/PxHeight, 50/PxWidth, 25/PxHeight) title:@"标间" tintColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    _classLabel.backgroundColor = [UIColor colorWithRed:31/255.0 green:218/255.0 blue:136/255.0 alpha:1.0];
    [self addSubview:_classLabel];
    
    _bedLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_classLabel.frame) + 14/PxWidth, CGRectGetMinY(_classLabel.frame), 80/PxWidth, CGRectGetHeight(_classLabel.frame)) title:@"大床1.8m" tintColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    _bedLabel.backgroundColor = Color_indigo;
    [self addSubview:_bedLabel];
    
    _payLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_bedLabel.frame) + 14/PxWidth, CGRectGetMinY(_bedLabel.frame), 100/PxWidth, CGRectGetHeight(_bedLabel.frame)) title:@"信用卡支付" tintColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    _payLabel.backgroundColor = [UIColor colorWithRed:239/255.0 green:111/255.0 blue:92/255.0 alpha:1.0];
    [self addSubview:_payLabel];
    
    _detailsLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_typeLabel.frame), CGRectGetMaxY(_classLabel.frame) + 25/PxHeight, kScreenWidth - 30/PxWidth, 20/PxHeight) title:@"标间标间标间标间标间标间标间标间标间标间" tintColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_detailsLabel];
}

-(void)setTitleWithType:(NSString *)type Price:(NSString *)price Class:(NSString *)class Bed:(NSString *)bed Pay:(NSString *)pay Details:(NSString *)details{
    _typeLabel.text = type;
    _priceLabel.text = price;
    _classLabel.text = class;
    _bedLabel.text = bed;
    _payLabel.text = pay;
    _detailsLabel.text = details;
}

@end
