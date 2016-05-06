//
//  OrderTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
            [self p_setup];
        }
        return self;
    }
    
-(void)p_setup
{
    _foodImage = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, 20/PxHeight, 170/PxWidth, 130/PxHeight)];
    _foodImage.image = [UIImage imageNamed:@"图层-1"];
    [self addSubview:_foodImage];
    
    _foodLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_foodImage.frame) +15/PxWidth, CGRectGetMinY(_foodImage.frame), 200/PxWidth, 30/PxHeight) title:@"客家盐焗鸡" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_foodLabel];
    
    _indexLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_foodLabel.frame), CGRectGetMaxY(_foodLabel.frame) + 10/PxHeight, 100/PxWidth, 25/PxHeight) title:@"推荐指数:" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_indexLabel];
    
    _indexImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexLabel.frame), CGRectGetMinY(_indexLabel.frame), 25/PxHeight, 25/PxHeight)];
    _indexImageView1.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView1];
    
    _indexImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView1.frame) + 5, CGRectGetMinY(_indexImageView1.frame), 25/PxHeight, 25/PxHeight)];
    _indexImageView2.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView2];
    
    _indexImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView2.frame)+ 5, CGRectGetMinY(_indexImageView2.frame), 25/PxHeight, 25/PxHeight)];
    _indexImageView3.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView3];
    
    _indexImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView3.frame)+ 5, CGRectGetMinY(_indexImageView3.frame), 25/PxHeight, 25/PxHeight)];
    _indexImageView4.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView4];
    
    _indexImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView4.frame)+ 5, CGRectGetMinY(_indexImageView4.frame), 25/PxHeight, 25/PxHeight)];
    _indexImageView5.image = [UIImage imageNamed:@"星星未选中"];
    [self addSubview:_indexImageView5];
    
    _pirceLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_foodLabel.frame), CGRectGetMaxY(_foodImage.frame) - 30/PxHeight, 200/PxWidth, 30/PxHeight) title:@"¥42/份" tintColor:Color_indigo textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:20.0]];
    [self addSubview:_pirceLabel];

    _reductionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _reductionButton.frame = CGRectMake(CGRectGetMaxX(_foodImage.frame) +190/PxWidth, 115/PxHeight, 40/PxWidth, 40/PxWidth);
    [_reductionButton setImage:[UIImage imageNamed:@"减"] forState:UIControlStateNormal];
    [self addSubview:_reductionButton];
    
    _numLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_reductionButton.frame), CGRectGetMinY(_reductionButton.frame), 44/PxWidth, 40/PxWidth)title:@"1" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:25.0]];
    [self addSubview:_numLabel];
    
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addButton.frame = CGRectMake(CGRectGetMaxX(_numLabel.frame), CGRectGetMinY(_reductionButton.frame), 40/PxWidth, 40/PxWidth);
    [_addButton setImage:[UIImage imageNamed:@"加"] forState:UIControlStateNormal];
    [self addSubview:_addButton];
}
@end
