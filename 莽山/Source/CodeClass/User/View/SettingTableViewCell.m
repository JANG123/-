//
//  SettingTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, 20/PxHeight, 30/PxHeight, 30/PxHeight)];
    _logoImageView.image = [UIImage imageNamed:@"我的订单"];
    [self addSubview:_logoImageView];
    
    _nameLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoImageView.frame) + 10/PxWidth, CGRectGetMinY(_logoImageView.frame) , [UILabel widthForString:@"我的订单的" font:[UIFont systemFontOfSize:15.0]], CGRectGetHeight(_logoImageView.frame)) title:@"我的订单的" tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_nameLabel];
    
    _cellButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cellButton.frame = CGRectMake(kScreenWidth - 100/PxWidth, CGRectGetMinY(_logoImageView.frame), 75/PxWidth, CGRectGetHeight(_logoImageView.frame));
    
    _cellLabel = [UILabel setFrame:CGRectMake(0, 0, 50/PxWidth, CGRectGetHeight(_logoImageView.frame)) title:@"添加" tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:15.0]];
    [_cellButton addSubview:_cellLabel];
    _imagejiantouView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_cellLabel.frame) + 5/PxWidth, 10/PxHeight, CGRectGetWidth(_cellButton.frame) - CGRectGetWidth(_cellLabel.frame), 20/PxHeight)];
    _imagejiantouView.image = [UIImage imageNamed:@"个人中心_下一页"];
    [_cellButton addSubview:_imagejiantouView];
    [self addSubview:_cellButton];
    
    _userLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame) + 10/PxWidth, CGRectGetMinY(_logoImageView.frame) , CGRectGetMinX(_cellButton.frame) - CGRectGetMaxX(_nameLabel.frame) - 10/PxWidth, CGRectGetHeight(_logoImageView.frame)) title:@"" tintColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_userLabel];
}

-(void)setCellString:(NSString *)cellString{
    CGFloat width = [UILabel widthForString:cellString font:[UIFont systemFontOfSize:15.0]] - 50/PxWidth;
    _cellButton.frame = CGRectMake(kScreenWidth - 100/PxWidth - width, CGRectGetMinY(_logoImageView.frame), 75/PxWidth + width, CGRectGetHeight(_logoImageView.frame));
    
    _cellLabel.frame = CGRectMake(0, 0, 50/PxWidth + width, CGRectGetHeight(_logoImageView.frame));
    _cellLabel.text = cellString;
    
     _imagejiantouView.frame = CGRectMake(CGRectGetMaxX(_cellLabel.frame) + 5/PxWidth, 10/PxHeight, CGRectGetWidth(_cellButton.frame) - CGRectGetWidth(_cellLabel.frame), 20/PxHeight);
}

@end
