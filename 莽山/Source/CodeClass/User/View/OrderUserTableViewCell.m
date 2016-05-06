//
//  OrderTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "OrderUserTableViewCell.h"

@implementation OrderUserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 15/PxHeight)];
    view.backgroundColor = Color_back;
    [self.contentView addSubview:view];
    
    UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, 25/PxHeight, 25/PxWidth, 25/PxWidth)];
    logoImageView.image = [UIImage imageNamed:@"生态商城_土特产"];
    [self.contentView addSubview:logoImageView];
    
    _orderLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(logoImageView.frame) + 5, CGRectGetMinY(logoImageView.frame), 150/PxWidth, CGRectGetHeight(logoImageView.frame)) title:@"莽山土特产" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_orderLabel];
    
    _typeLabel = [UILabel setFrame:CGRectMake(kScreenWidth - 125/PxWidth, CGRectGetMinY(logoImageView.frame), 100/PxWidth, CGRectGetHeight(_orderLabel.frame)) title:@"待付款" tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_typeLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_typeLabel.frame) + 9/PxHeight, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self.contentView addSubview:lineLabel];
    
    _orderImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(logoImageView.frame), CGRectGetMaxY(lineLabel.frame) + 13/PxHeight, 165/PxWidth, 115/PxHeight)];
    _orderImage.image = [UIImage imageNamed:@"订单"];
    [self.contentView addSubview:_orderImage];
    
    _orderTitleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_orderImage.frame) + 12/PxWidth, CGRectGetMinY(_orderImage.frame) + 10/PxHeight, 250/PxWidth, 30/PxHeight) title:@"莽山特产，限量抢购" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_orderTitleLabel];
    
    _orderNmuLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_orderTitleLabel.frame), CGRectGetMaxY(_orderTitleLabel.frame), 250/PxWidth, 30/PxHeight) title:@"数量:1" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_orderNmuLabel];
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_orderImage.frame) + 12/PxHeight, kScreenWidth, 1)];
    lineLabel1.backgroundColor = Color_back;
    [self.contentView addSubview:lineLabel1];
    
    _orderSumLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_orderImage.frame), CGRectGetMaxY(lineLabel1.frame) + 10/PxHeight, 250/PxWidth, 30/PxHeight) title:@"总价:¥360" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_orderSumLabel];
}

-(void)addButton:(NSString *)type{
    if ([type isEqualToString:@"已完成"]) {
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyButton.frame = CGRectMake(kScreenWidth - 25/PxWidth - 100/PxWidth, CGRectGetMinY(_orderSumLabel.frame), 100/PxWidth, CGRectGetHeight(_orderSumLabel.frame));
        [_buyButton setTitle:@"再次购买" forState:UIControlStateNormal];
        [_buyButton setTitleColor:Color_indigo forState:UIControlStateNormal];
        _buyButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_buyButton.layer setBorderWidth:1.0]; //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 56/255.0, 219/255.0, 202/255.0, 1 });
        [_buyButton.layer setBorderColor:colorref];//边框颜色
        [self.contentView addSubview:_buyButton];
        
        
        _zuijiaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _zuijiaButton.frame = CGRectMake(CGRectGetMinX(_buyButton.frame) - 120/PxWidth, CGRectGetMinY(_orderSumLabel.frame), 100/PxWidth, CGRectGetHeight(_orderSumLabel.frame));
        [_zuijiaButton setTitle:@"追加评价" forState:UIControlStateNormal];
        [_zuijiaButton setTitleColor:[UIColor colorWithRed:235/255.0 green:79/255.0 blue:56/255.0 alpha:1.0] forState:UIControlStateNormal];
        _zuijiaButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_zuijiaButton.layer setBorderWidth:1.0]; //边框宽度
        CGColorRef colorref1 = CGColorCreate(colorSpace,(CGFloat[]){ 235/255.0, 79/255.0, 56/255.0, 1 });
        [_zuijiaButton.layer setBorderColor:colorref1];//边框颜色
        [self.contentView addSubview:_zuijiaButton];
    }
    if ([type isEqualToString:@"待收货"]) {
        _querenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _querenButton.frame = CGRectMake(kScreenWidth - 25/PxWidth - 100/PxWidth, CGRectGetMinY(_orderSumLabel.frame), 100/PxWidth, CGRectGetHeight(_orderSumLabel.frame));
        [_querenButton setTitle:@"确认收货" forState:UIControlStateNormal];
        [_querenButton setTitleColor:Color_indigo forState:UIControlStateNormal];
        _querenButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_querenButton.layer setBorderWidth:1.0]; //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 56/255.0, 219/255.0, 202/255.0, 1 });
        [_querenButton.layer setBorderColor:colorref];//边框颜色
        [self.contentView addSubview:_querenButton];
    }
    if ([type isEqualToString:@"待评价"]) {
        _pingjiaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pingjiaButton.frame = CGRectMake(kScreenWidth - 25/PxWidth - 80/PxWidth, CGRectGetMinY(_orderSumLabel.frame), 80/PxWidth, CGRectGetHeight(_orderSumLabel.frame));
        [_pingjiaButton setTitle:@"评价" forState:UIControlStateNormal];
        [_pingjiaButton setTitleColor:[UIColor colorWithRed:235/255.0 green:79/255.0 blue:56/255.0 alpha:1.0] forState:UIControlStateNormal];
        _pingjiaButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_pingjiaButton.layer setBorderWidth:1.0]; //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 235/255.0, 79/255.0, 56/255.0, 1 });
        [_pingjiaButton.layer setBorderColor:colorref];//边框颜色
        [self.contentView addSubview:_pingjiaButton];
    }
}

@end
