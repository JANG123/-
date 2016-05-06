//
//  EvaluationImageTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationImageTableViewCell.h"

@implementation EvaluationImageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _nameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 20/PxHeight, 150/PxWidth, 20/PxHeight) title:@"155****5555" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_nameLabel];
    
    _indexImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame) + 5/PxHeight, 20/PxHeight, 20/PxHeight)];
    _indexImageView1.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView1];
    
    _indexImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView1.frame) + 5, CGRectGetMinY(_indexImageView1.frame), 20/PxHeight, 20/PxHeight)];
    _indexImageView2.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView2];
    
    _indexImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView2.frame)+ 5, CGRectGetMinY(_indexImageView2.frame), 20/PxHeight, 20/PxHeight)];
    _indexImageView3.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView3];
    
    _indexImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView3.frame)+ 5, CGRectGetMinY(_indexImageView3.frame), 20/PxHeight, 20/PxHeight)];
    _indexImageView4.image = [UIImage imageNamed:@"星星选中"];
    [self addSubview:_indexImageView4];
    
    _indexImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_indexImageView4.frame)+ 5, CGRectGetMinY(_indexImageView4.frame), 20/PxHeight, 20/PxHeight)];
    _indexImageView5.image = [UIImage imageNamed:@"星星未选中"];
    [self addSubview:_indexImageView5];
    
    _dateLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_indexImageView5.frame) + 10/PxWidth, CGRectGetMinY(_indexImageView5.frame), 200/PxWidth, 20/PxHeight) title:@"2016-04-25" tintColor:Color_back textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_dateLabel];
    
    _detailsLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_dateLabel.frame) + 12/PxHeight, kScreenWidth - 50/PxWidth, 20/PxHeight) title:@"好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    _detailsLabel.numberOfLines = 0;
    CGFloat height = [UILabel heightForString:_detailsLabel.text font:_detailsLabel.font Width:_detailsLabel.frame.size.width];
    _detailsLabel.frame = CGRectMake(25/PxWidth, CGRectGetMaxY(_dateLabel.frame) + 12/PxHeight, kScreenWidth - 50/PxWidth, height);
    [self addSubview:_detailsLabel];
    
    _detailsImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_detailsLabel.frame), CGRectGetMaxY(_detailsLabel.frame) + 10/PxHeight, 61/PxWidth, 61/PxWidth)];
    _detailsImageView1.backgroundColor = [UIColor redColor];
    [self addSubview:_detailsImageView1];
    
    _detailsImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView1.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView1.frame), 61/PxWidth, 61/PxWidth)];
    _detailsImageView2.backgroundColor = [UIColor redColor];
    [self addSubview:_detailsImageView2];
    
    _detailsImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView2.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView2.frame), 61/PxWidth, 61/PxWidth)];
    _detailsImageView3.backgroundColor = [UIColor redColor];
    [self addSubview:_detailsImageView3];
}

-(CGFloat)hightForCell{
    return CGRectGetMaxY(_detailsImageView3.frame) + 17/PxHeight;
}

@end
