//
//  UserOrderTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UserOrderTableViewCell.h"
#import "OrderButton.h"
@implementation UserOrderTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _paymentButton = [[OrderButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/4, 87/PxHeight)];
    _paymentButton.logoView.image = [UIImage imageNamed:@"待付款"];
    _paymentButton.textLabel.text = @"待付款";
    [self addSubview:_paymentButton];
    
    _goodsButton = [[OrderButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_paymentButton.frame), 0, kScreenWidth/4, 87/PxHeight)];
    _goodsButton.logoView.image = [UIImage imageNamed:@"待收货"];
    _goodsButton.textLabel.text = @"待收货";
    [self addSubview:_goodsButton];
    
    _evaluationButton = [[OrderButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_goodsButton.frame), 0, kScreenWidth/4, 87/PxHeight)];
    _evaluationButton.logoView.image = [UIImage imageNamed:@"待评价"];
    _evaluationButton.textLabel.text = @"待评价";
    [self addSubview:_evaluationButton];
    
    _refundButton = [[OrderButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_evaluationButton.frame), 0, kScreenWidth/4, 87/PxHeight)];
    _refundButton.logoView.image = [UIImage imageNamed:@"退款"];
    _refundButton.textLabel.text = @"退款/售后";
    [self addSubview:_refundButton];
}

@end
