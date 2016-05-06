//
//  SurroundTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SurroundTableViewCell.h"

@implementation SurroundTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    
    _mapView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth - 100/PxWidth,17/PxHeight, 75/PxWidth, 33/PxHeight)];
    _mapView.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
    _mapView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.6];
    
    UIImageView *mapImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 3/PxHeight, 27/PxHeight, 27/PxHeight)];
    mapImageView.image = [UIImage imageNamed:@"定位2"];
    [_mapView addSubview:mapImageView];
    
    _mapLabel = [UILabel setFrame:CGRectMake(27/PxHeight, 3/PxHeight, [UILabel widthForString:@"316m" font:[UIFont systemFontOfSize:14.0]], 27/PxHeight) title:@"316m" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [_mapView addSubview:_mapLabel];
    _mapView.frame = CGRectMake(kScreenWidth - (27/PxHeight + CGRectGetWidth(_mapLabel.frame) + 30/PxWidth),17/PxHeight, 27/PxHeight + CGRectGetWidth(_mapLabel.frame) + 5/PxWidth, 33/PxHeight);
    [self addSubview:_mapView];
    
    _nameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 160/PxHeight, 200/PxWidth, 25/PxHeight) title:@"天天农家乐" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_nameLabel];
    
    _titleLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_nameLabel.frame) + 5/PxHeight, 200/PxWidth, 25/PxHeight) title:@"天天农家乐" tintColor:Color_back textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_titleLabel];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 100/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth)];
    _logoView.image = [UIImage imageNamed:@"钱"];
    [self addSubview:_logoView];
    
    _priceLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoView.frame), CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"￥88/人" font:[UIFont systemFontOfSize:14.0]], CGRectGetHeight(_logoView.frame)) title:@"￥88/人" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_priceLabel];
    
    _logoView.frame = CGRectMake(kScreenWidth - CGRectGetWidth(_priceLabel.frame) - CGRectGetWidth(_logoView.frame) - 15/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth);
    _priceLabel.frame =  CGRectMake(CGRectGetMaxX(_logoView.frame), CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"￥88/人" font:[UIFont systemFontOfSize:14.0]] + 5/PxWidth, CGRectGetHeight(_logoView.frame));
}

-(void)setTextName:(NSString *)name title:(NSString *)title price:(NSString *)price map:(NSString *)map logoBool:(BOOL)logo{
    _nameLabel.text = name;
    _titleLabel.text = title;
    _priceLabel.text = price;
    _mapLabel.text = map;
    _logoView.hidden = logo;
    
    _mapLabel.frame = CGRectMake(27/PxHeight, 3/PxHeight, [UILabel widthForString:map font:[UIFont systemFontOfSize:14.0]], 27/PxHeight);
    _mapView.frame = CGRectMake(kScreenWidth - (27/PxHeight + CGRectGetWidth(_mapLabel.frame) + 30/PxWidth),17/PxHeight, 27/PxHeight + CGRectGetWidth(_mapLabel.frame) + 5/PxWidth, 33/PxHeight);
    
    _priceLabel.frame = CGRectMake(CGRectGetMaxX(_logoView.frame), CGRectGetMinY(_logoView.frame), [UILabel widthForString:price font:[UIFont systemFontOfSize:14.0]], CGRectGetHeight(_logoView.frame));
    
    _logoView.frame = CGRectMake(kScreenWidth - CGRectGetWidth(_priceLabel.frame) - CGRectGetWidth(_logoView.frame) - 15/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth);
    _priceLabel.frame =  CGRectMake(CGRectGetMaxX(_logoView.frame), CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"￥88/人" font:[UIFont systemFontOfSize:14.0]] + 5/PxWidth, CGRectGetHeight(_logoView.frame));
    
}

@end
