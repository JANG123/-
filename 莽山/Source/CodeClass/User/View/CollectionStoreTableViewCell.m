//
//  CollectionStoreTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "CollectionStoreTableViewCell.h"

@implementation CollectionStoreTableViewCell

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
    
    _storeNameLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(logoImageView.frame) + 5, CGRectGetMinY(logoImageView.frame), 150/PxWidth, CGRectGetHeight(logoImageView.frame)) title:@"莽山原生态茶庄" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_storeNameLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_storeNameLabel.frame) + 9/PxHeight, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self.contentView addSubview:lineLabel];
    
    _storeImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(logoImageView.frame), CGRectGetMaxY(lineLabel.frame) + 13/PxHeight, 165/PxWidth, 115/PxHeight)];
    _storeImage.image = [UIImage imageNamed:@"收藏店铺.png"];
    [self.contentView addSubview:_storeImage];
    
    _storeTitleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_storeImage.frame) + 12/PxWidth, CGRectGetMinY(_storeImage.frame) + 10/PxHeight, kScreenWidth - CGRectGetMaxX(_storeImage.frame) - 12/PxWidth - 25/PxWidth, [UILabel heightForString:@"莽山原生态茶庄，不只是售茶，我们更讲究品茶" font:[UIFont systemFontOfSize:15.0] Width:kScreenWidth - CGRectGetMaxX(_storeImage.frame) - 12/PxWidth - 25/PxWidth]) title:@"莽山原生态茶庄，不只是售茶，我们更讲究品茶" tintColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    _storeTitleLabel.numberOfLines = 0;
    [self.contentView addSubview:_storeTitleLabel];
    
    _indexLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_storeTitleLabel.frame), CGRectGetMaxY(_storeImage.frame) - 35/PxHeight, 100/PxWidth, 22/PxHeight) title:@"推荐指数:" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self.contentView addSubview:_indexLabel];
    
    _indexImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexLabel.frame), CGRectGetMinY(_indexLabel.frame), 22/PxHeight, 22/PxHeight)];
    _indexImageView1.image = [UIImage imageNamed:@"星星选中"];
    [self.contentView addSubview:_indexImageView1];
    
    _indexImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView1.frame) + 5, CGRectGetMinY(_indexImageView1.frame), 22/PxHeight, 22/PxHeight)];
    _indexImageView2.image = [UIImage imageNamed:@"星星选中"];
    [self.contentView addSubview:_indexImageView2];
    
    _indexImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView2.frame)+ 5, CGRectGetMinY(_indexImageView2.frame), 22/PxHeight, 22/PxHeight)];
    _indexImageView3.image = [UIImage imageNamed:@"星星选中"];
    [self.contentView addSubview:_indexImageView3];
    
    _indexImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView3.frame)+ 5, CGRectGetMinY(_indexImageView3.frame), 22/PxHeight, 22/PxHeight)];
    _indexImageView4.image = [UIImage imageNamed:@"星星选中"];
    [self.contentView addSubview:_indexImageView4];
    
    _indexImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView4.frame)+ 5, CGRectGetMinY(_indexImageView4.frame), 22/PxHeight, 22/PxHeight)];
    _indexImageView5.image = [UIImage imageNamed:@"星星未选中"];
    [self.contentView addSubview:_indexImageView5];
}


@end
