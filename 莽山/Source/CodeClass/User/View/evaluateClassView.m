//
//  evaluateClassView.m
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "evaluateClassView.h"

@implementation evaluateClassView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

-(void)p_setupView
{
    _evaluateTitleView = [UILabel setFrame:CGRectMake(25/PxWidth, 0, kScreenWidth/2 - 25/PxWidth, 52/PxHeight) title:@"商品描述相符" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_evaluateTitleView];
    
    _indexImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth -  150/PxHeight, CGRectGetMinY(_evaluateTitleView.frame) + 16/PxHeight, 20/PxHeight, 20/PxHeight)];
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
    
}
@end
