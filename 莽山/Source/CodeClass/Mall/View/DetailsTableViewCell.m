//
//  DetailsTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "DetailsTableViewCell.h"

@implementation DetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    
    self.backgroundColor = [UIColor whiteColor];
    _storeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 190/PxHeight)];
    _storeImageView.image = [UIImage imageNamed:@"1"];
    [self addSubview:_storeImageView];
    
    _storeLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 145/PxHeight, 100, 45/PxHeight) title:@"农果休闲" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [_storeImageView addSubview:_storeLabel];
    //136 156
    _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 78/PxWidth)/2, 136/PxHeight, 78/PxWidth, 78/PxWidth)];
    _logoImageView.image = [UIImage imageNamed:@"logo1"];
    [_storeImageView addSubview:_logoImageView];
    
    _mapImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 90/PxWidth, CGRectGetMinY(_storeLabel.frame) + 10/PxWidth, 25/PxWidth, 25/PxWidth)];
    _mapImageView.image = [UIImage imageNamed:@"定位2"];
    [_storeImageView addSubview:_mapImageView];
    
    _mapLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_mapImageView.frame), CGRectGetMinY(_mapImageView.frame), 70/PxWidth, CGRectGetHeight(_mapImageView.frame)) title:@"122m" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_storeImageView addSubview:_mapLabel];
    
    _storeNameLable = [UILabel setFrame:CGRectMake(0, CGRectGetMaxY(_logoImageView.frame), kScreenWidth, 30/PxHeight) title:@"农家休闲店" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_storeNameLable];
    
    _goodsImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(8/PxWidth, CGRectGetMaxY(_storeImageView.frame) + 60/PxHeight, (kScreenWidth - 32/PxWidth)/3, 150/PxHeight)];
    _goodsImageView1.image = [UIImage imageNamed:@"2"];
    [self addSubview:_goodsImageView1];
    
    _goodsImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_goodsImageView1.frame) + 8/PxWidth, CGRectGetMaxY(_storeImageView.frame) + 60/PxHeight, (kScreenWidth - 32/PxWidth)/3, 150/PxHeight)];
    _goodsImageView2.image = [UIImage imageNamed:@"3"];
    [self addSubview:_goodsImageView2];
    
    _goodsImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_goodsImageView2.frame) + 8/PxWidth, CGRectGetMaxY(_storeImageView.frame) + 60/PxHeight, (kScreenWidth - 32/PxWidth)/3, 150/PxHeight)];
    _goodsImageView3.image = [UIImage imageNamed:@"4"];
    [self addSubview:_goodsImageView3];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 407/PxHeight, kScreenWidth, 10/PxHeight)];
    lineView.backgroundColor = Color_back;
    [self addSubview:lineView];
}

@end
