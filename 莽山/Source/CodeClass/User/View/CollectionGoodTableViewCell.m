//
//  CollectionGoodTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "CollectionGoodTableViewCell.h"

@implementation CollectionGoodTableViewCell

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
    
    _goodNameLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(logoImageView.frame) + 5, CGRectGetMinY(logoImageView.frame), 150/PxWidth, CGRectGetHeight(logoImageView.frame)) title:@"莽山土特产" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_goodNameLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_goodNameLabel.frame) + 9/PxHeight, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self.contentView addSubview:lineLabel];
    
    _goodImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(logoImageView.frame), CGRectGetMaxY(lineLabel.frame) + 13/PxHeight, 165/PxWidth, 115/PxHeight)];
    _goodImage.image = [UIImage imageNamed:@"收藏商品.png"];
    [self.contentView addSubview:_goodImage];
    
    _goodTitleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_goodImage.frame) + 12/PxWidth, CGRectGetMinY(_goodImage.frame) + 10/PxHeight, [UILabel widthForString:@"莽山特制茶叶，天然纯正" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"莽山特制茶叶，天然纯正" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_goodTitleLabel];
    
    _goodPriceLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_goodTitleLabel.frame), CGRectGetMaxY(_goodTitleLabel.frame), 250/PxWidth, 30/PxHeight) title:@"价格:￥360" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_goodPriceLabel];
    
    _goodNoteLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_goodPriceLabel.frame), CGRectGetMaxY(_goodPriceLabel.frame), 250/PxWidth, 30/PxHeight) title:@"该商品已售完" tintColor:[UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_goodNoteLabel];
}

@end
