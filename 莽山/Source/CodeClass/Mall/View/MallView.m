//
//  MallView.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "MallView.h"
#import "MallTypeView.h"
#import "TypeDetailsView.h"
@implementation MallView
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
    _typeView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth, 128/PxHeight)];
    _typeView.backgroundColor = Color_back;
    [self addSubview:_typeView];
    
    _type1View = [[MallTypeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/4, CGRectGetHeight(_typeView.frame))];
    _type1View.typeLable.text = @"土特产";
    [_type1View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-2"] forState:UIControlStateNormal];
    [_typeView addSubview:_type1View];
    
    _type2View = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_type1View.frame), 0, kScreenWidth/4, CGRectGetHeight(_typeView.frame))];
    _type2View.typeLable.text = @"体验";
    [_type2View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-3"] forState:UIControlStateNormal];
    [_typeView addSubview:_type2View];
    
    _type3View = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_type2View.frame), 0, kScreenWidth/4, CGRectGetHeight(_typeView.frame))];
    _type3View.typeLable.text = @"休闲";
    [_type3View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-3"] forState:UIControlStateNormal];
    [_typeView addSubview:_type3View];
    
    _type4View = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_type3View.frame), 0, kScreenWidth/4, CGRectGetHeight(_typeView.frame))];
    _type4View.typeLable.text = @"自助";
    [_type4View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-4"] forState:UIControlStateNormal];
    [_typeView addSubview:_type4View];
    
    _goodsView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_typeView.frame), kScreenWidth, 150/PxHeight)];
    _goodsView.backgroundColor = [UIColor whiteColor];
    _goodsView.contentSize = CGSizeMake(610/PxWidth, 0);
    _goodsView.scrollEnabled = YES;
    [self addSubview:_goodsView];
    
    _goodImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200/PxWidth, 150/PxHeight)];
    _goodImageView1.image = [UIImage imageNamed:@"1s.png"];
    [_goodsView addSubview:_goodImageView1];
    
    _goodImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_goodImageView1.frame) + 5/PxWidth, 0, 200/PxWidth, 150/PxHeight)];
    _goodImageView2.image = [UIImage imageNamed:@"2s.png"];
    [_goodsView addSubview:_goodImageView2];
    
    _goodImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_goodImageView2.frame) + 5/PxWidth, 0, 200/PxWidth, 150/PxHeight)];
    _goodImageView3.image = [UIImage imageNamed:@"3s.png"];
    [_goodsView addSubview:_goodImageView3];
}
@end
