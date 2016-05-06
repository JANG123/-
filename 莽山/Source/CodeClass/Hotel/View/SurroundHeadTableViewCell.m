//
//  SurroundHeadTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SurroundHeadTableViewCell.h"

@implementation SurroundHeadTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _type1View = [[MallTypeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/4, 128/PxHeight)];
    _type1View.typeLable.text = @"土特产";
    [_type1View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-2"] forState:UIControlStateNormal];
    [self addSubview:_type1View];
    
    _type2View = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_type1View.frame), 0, kScreenWidth/4, CGRectGetHeight(_type1View.frame))];
    _type2View.typeLable.text = @"体验";
    [_type2View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-3"] forState:UIControlStateNormal];
    [self addSubview:_type2View];
    
    _type3View = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_type2View.frame), 0, kScreenWidth/4, CGRectGetHeight(_type1View.frame))];
    _type3View.typeLable.text = @"休闲";
    [_type3View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-3"] forState:UIControlStateNormal];
    [self addSubview:_type3View];
    
    _type4View = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_type3View.frame), 0, kScreenWidth/4, CGRectGetHeight(_type1View.frame))];
    _type4View.typeLable.text = @"自助";
    [_type4View.typeButton setImage:[UIImage imageNamed:@"特产-拷贝-4"] forState:UIControlStateNormal];
    [self addSubview:_type4View];
    self.backgroundColor = Color_back;
}

@end
