//
//  TypeDetailsView.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "TypeDetailsView.h"

@implementation TypeDetailsView

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
    _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, (45/PxHeight - 30/PxWidth)/2, 30/PxWidth, 30/PxWidth)];
    _logoImageView.image = [UIImage imageNamed:@"生态商城_土特产.png"];
    [self addSubview:_logoImageView];
    
    _titleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoImageView.frame) +10, CGRectGetMinY(_logoImageView.frame), kScreenWidth/2, CGRectGetHeight(_logoImageView.frame)) title:@"土特产" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_titleLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 45/PxHeight - 1, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self addSubview:lineLabel];
    
    self.backgroundColor = [UIColor whiteColor];
    _singleTap1 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    _good1ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45/PxHeight, kScreenWidth, 175/PxHeight)];
    _good1ImageView.image = [UIImage imageNamed:@"4s.png"];
    _good1ImageView.userInteractionEnabled = YES;
    [_good1ImageView addGestureRecognizer:_singleTap1];
    [self addSubview:_good1ImageView];
    
    _good2ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_good1ImageView.frame) + 5/PxHeight, (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good2ImageView.image = [UIImage imageNamed:@"5s.png"];
    _good2ImageView.userInteractionEnabled = YES;
    _singleTap2 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good2ImageView addGestureRecognizer:_singleTap2];
    [self addSubview:_good2ImageView];
    
    _good3ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_good2ImageView.frame) + 5/PxHeight, CGRectGetMinY(_good2ImageView.frame), (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good3ImageView.image = [UIImage imageNamed:@"6s.png"];
    _good3ImageView.userInteractionEnabled = YES;
     _singleTap3 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good3ImageView addGestureRecognizer:_singleTap3];
    [self addSubview:_good3ImageView];
    
    _good4ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_good2ImageView.frame) + 5/PxHeight, (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good4ImageView.image = [UIImage imageNamed:@"7s.png"];
    _good4ImageView.userInteractionEnabled = YES;
     _singleTap4 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good4ImageView addGestureRecognizer:_singleTap4];
    [self addSubview:_good4ImageView];
    
    _good5ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_good4ImageView.frame) + 5/PxHeight, CGRectGetMinY(_good4ImageView.frame), (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good5ImageView.image = [UIImage imageNamed:@"更多产品.png"];
    _good5ImageView.userInteractionEnabled = YES;
    _singleTap5 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good5ImageView addGestureRecognizer:_singleTap5];
    [self addSubview:_good5ImageView];
}

-(void)shareImageAction:(id)sender{
    [self.delegate shareImageAction:sender];
}

@end
