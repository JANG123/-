//
//  HoteTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "HoteTableViewCell.h"

@implementation HoteTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _nameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 160/PxHeight, 200/PxWidth, 25/PxHeight) title:@"莽山原生态酒店" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_nameLabel];
    
    _tuijianImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 55/PxWidth, 0, 30/PxHeight, 80/PxHeight)];
    _tuijianImageView.image = [UIImage imageNamed:@"特别推荐"];
    [self addSubview:_tuijianImageView];
    
    _titleLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_nameLabel.frame) + 5/PxHeight, kScreenWidth/2, 25/PxHeight) title:@"湖南莽山森林公园附近" tintColor:Color_back textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_titleLabel];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 100/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth)];
    _logoView.image = [UIImage imageNamed:@"钱"];
    [self addSubview:_logoView];
    
    _priceLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoView.frame) + 5/PxWidth, CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"480" font:[UIFont systemFontOfSize:14.0]], CGRectGetHeight(_logoView.frame)) title:@"480" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_priceLabel];
    
    _logoView.frame = CGRectMake(kScreenWidth - CGRectGetWidth(_priceLabel.frame) - CGRectGetWidth(_logoView.frame) - 20/PxWidth, 190/PxHeight, 25/PxWidth, 25/PxWidth);
    _priceLabel.frame =  CGRectMake(CGRectGetMaxX(_logoView.frame) + 5/PxWidth, CGRectGetMinY(_logoView.frame), [UILabel widthForString:@"480" font:[UIFont systemFontOfSize:14.0]] + 5/PxWidth, CGRectGetHeight(_logoView.frame));
}



@end
