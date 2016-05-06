//
//  UserTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, 18/PxHeight, 40/PxHeight, 40/PxHeight)];
    _logoImageView.image = [UIImage imageNamed:@"我的订单"];
    [self addSubview:_logoImageView];
    
    _nameLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoImageView.frame) + 10/PxWidth, CGRectGetMinY(_logoImageView.frame) , kScreenWidth/2, CGRectGetHeight(_logoImageView.frame)) title:@"我的订单" tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_nameLabel];
}

@end
