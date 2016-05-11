//
//  FarmHouseTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "FarmHouseTableViewCell.h"

@implementation FarmHouseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _nameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 160/PxHeight, 200/PxWidth, 25/PxHeight) title:@"天天农家乐" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_nameLabel];
    
    _titleLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_nameLabel.frame) + 5/PxHeight, 200/PxWidth, 25/PxHeight) title:@"天天农家乐" tintColor:Color_back textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_titleLabel];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 100/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth)];
    _logoView.image = [UIImage imageNamed:@"钱"];
    [self addSubview:_logoView];
    
    _priceLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoView.frame), CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"88/人" font:[UIFont systemFontOfSize:14.0]], CGRectGetHeight(_logoView.frame)) title:@"88/人" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_priceLabel];
    
    _logoView.frame = CGRectMake(kScreenWidth - CGRectGetWidth(_priceLabel.frame) - CGRectGetWidth(_logoView.frame) - 20/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth);
    _priceLabel.frame =  CGRectMake(CGRectGetMaxX(_logoView.frame) + 5/PxWidth, CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"88/人" font:[UIFont systemFontOfSize:14.0]] + 5/PxWidth, CGRectGetHeight(_logoView.frame));
}

@end
