//
//  EvaluationHeadTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationHeadTableViewCell.h"

@implementation EvaluationHeadTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _txtLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 17/PxHeight, 100/PxWidth, 20/PxHeight) title:@"总体评价:" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_txtLabel];
    
    _indexImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_txtLabel.frame) + 5/PxWidth, CGRectGetMinY(_txtLabel.frame), 20/PxHeight, 20/PxHeight)];
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
    
    
    _scoreLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_indexImageView5.frame) + 10/PxWidth, CGRectGetMinY(_indexImageView5.frame), 80/PxWidth, CGRectGetHeight(_indexImageView5.frame)) title:@"4.5分" tintColor:Color_indigo textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_scoreLabel];
    
    _highLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_txtLabel.frame), CGRectGetMaxY(_indexImageView5.frame) +15/PxHeight , [UILabel widthForString:@"性价比高 4" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"性价比高 4" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [_highLabel1.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 56/255.0, 219/255.0, 202/255.0, 1 });
    [_highLabel1.layer setBorderColor:colorref];//边框颜色
    [self addSubview:_highLabel1];

    _highLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_highLabel1.frame) + 10/PxWidth, CGRectGetMinY(_highLabel1.frame) , [UILabel widthForString:@"服务态度好 6" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"服务态度好 6" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [_highLabel2.layer setBorderWidth:1.0]; //边框宽度
    [_highLabel2.layer setBorderColor:colorref];//边框颜色
    [self addSubview:_highLabel2];
    
    _highLabel3 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_highLabel2.frame) + 10/PxWidth, CGRectGetMinY(_highLabel2.frame) , [UILabel widthForString:@"性价比高 4" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"性价比高 4" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [_highLabel3.layer setBorderWidth:1.0]; //边框宽度
    [_highLabel3.layer setBorderColor:colorref];//边框颜色
    [self addSubview:_highLabel3];
    
    _highLabel4 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_highLabel3.frame) + 10/PxWidth, CGRectGetMinY(_highLabel3.frame) , [UILabel widthForString:@"服务态度好 6" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"服务态度好 6" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [_highLabel4.layer setBorderWidth:1.0]; //边框宽度
    [_highLabel4.layer setBorderColor:colorref];//边框颜色
    [self addSubview:_highLabel4];
    
    _lowLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_highLabel1.frame), CGRectGetMaxY(_highLabel1.frame) +15/PxHeight , [UILabel widthForString:@"服务态度好 6" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"服务态度好 6" tintColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [_lowLabel1.layer setBorderWidth:1.0]; //边框宽度
    CGColorRef colorref1 = CGColorCreate(colorSpace,(CGFloat[]){ 158/255.0, 158/255.0, 158/255.0, 1 });
    [_lowLabel1.layer setBorderColor:colorref1];//边框颜色
    [self addSubview:_lowLabel1];
    
    _lowLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_lowLabel1.frame) + 10/PxWidth, CGRectGetMinY(_lowLabel1.frame) , [UILabel widthForString:@"性价比高 4" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"性价比高 4" tintColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [_lowLabel2.layer setBorderWidth:1.0]; //边框宽度
    [_lowLabel2.layer setBorderColor:colorref1];//边框颜色
    [self addSubview:_lowLabel2];
    
}

@end
