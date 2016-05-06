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
    self.backgroundColor = Color_back;
    UIGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    _good1ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 220/PxHeight)];
    _good1ImageView.image = [UIImage imageNamed:@"4s.png"];
    _good1ImageView.userInteractionEnabled = YES;
    [_good1ImageView addGestureRecognizer:singleTap];
    [self addSubview:_good1ImageView];
    
    _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, 10/PxHeight, 25/PxWidth, 25/PxWidth)];
    _logoImageView.image = [UIImage imageNamed:@"生态商城_土特产.png"];
    [_good1ImageView addSubview:_logoImageView];
    
    _titleLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoImageView.frame) +10, CGRectGetMinY(_logoImageView.frame), 100/PxWidth, CGRectGetHeight(_logoImageView.frame)) title:@"土特产" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_good1ImageView addSubview:_titleLabel];
    
    _good2ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_good1ImageView.frame) + 5/PxHeight, (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good2ImageView.image = [UIImage imageNamed:@"5s.png"];
    _good2ImageView.userInteractionEnabled = YES;
    UIGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good2ImageView addGestureRecognizer:singleTap2];
    [self addSubview:_good2ImageView];
    
    _good3ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_good2ImageView.frame) + 5/PxHeight, CGRectGetMinY(_good2ImageView.frame), (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good3ImageView.image = [UIImage imageNamed:@"6s.png"];
    _good3ImageView.userInteractionEnabled = YES;
     UIGestureRecognizer *singleTap3 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good3ImageView addGestureRecognizer:singleTap3];
    [self addSubview:_good3ImageView];
    
    _good4ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_good2ImageView.frame) + 5/PxHeight, (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good4ImageView.image = [UIImage imageNamed:@"7s.png"];
    _good4ImageView.userInteractionEnabled = YES;
     UIGestureRecognizer *singleTap4 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good4ImageView addGestureRecognizer:singleTap4];
    [self addSubview:_good4ImageView];
    
    _good5ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_good4ImageView.frame) + 5/PxHeight, CGRectGetMinY(_good4ImageView.frame), (kScreenWidth - 5/PxHeight)/2, 112/PxHeight)];
    _good5ImageView.image = [UIImage imageNamed:@"更多产品.png"];
    _good5ImageView.userInteractionEnabled = YES;
    UIGestureRecognizer *singleTap5 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareImageAction:)];
    [_good5ImageView addGestureRecognizer:singleTap5];
    [self addSubview:_good5ImageView];
}

-(void)shareImageAction:(id)sender{
    [self.delegate shareImageAction:sender];
}

@end
