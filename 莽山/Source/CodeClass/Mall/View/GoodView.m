//
//  GoodView.m
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "GoodView.h"

@implementation GoodView

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
    
    _specificLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 20/PxHeight, kScreenWidth/2, 20/PxHeight) title:@"规格" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_specificLabel];
    
    
    _specificButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _specificButton1.frame = CGRectMake(CGRectGetMinX(_specificLabel.frame), CGRectGetMaxY(_specificLabel.frame)+15/PxHeight, 100/PxWidth, 38/PxHeight);
    [_specificButton1 setTitle:@"200克" forState:UIControlStateNormal];
    _specificButton1.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_specificButton1 setTitleColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_specificButton1.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 56/255.0, 219/255.0, 202/255.0, 1 });
    [_specificButton1.layer setBorderColor:colorref];//边框颜色
    [self addSubview:_specificButton1];
    
    
    _specificButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _specificButton2.frame = CGRectMake(CGRectGetMaxX(_specificButton1.frame) + 28/PxWidth, CGRectGetMaxY(_specificLabel.frame)+15/PxHeight, 100/PxWidth, 38/PxHeight);
    [_specificButton2 setTitle:@"500克" forState:UIControlStateNormal];
    _specificButton2.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_specificButton2 setTitleColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_specificButton2.layer setBorderWidth:1.0]; //边框宽度
    CGColorRef colorref1 = CGColorCreate(colorSpace,(CGFloat[]){ 234/255.0, 234/255.0, 234/255.0, 1 });
    [_specificButton2.layer setBorderColor:colorref1];//边框颜色
    [self addSubview:_specificButton2];
    
    _numLabel= [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_specificButton1.frame) + 25/PxHeight, kScreenWidth/2, 20/PxHeight) title:@"数量" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_numLabel];
    
    _numButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _numButton1.frame = CGRectMake(CGRectGetMinX(_numLabel.frame), CGRectGetMaxY(_numLabel.frame)+15/PxHeight, 45/PxWidth, 40/PxHeight);
    [_numButton1 setTitle:@"-" forState:UIControlStateNormal];
    _numButton1.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_numButton1 setTitleColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_numButton1.layer setBorderWidth:1.0]; //边框宽度
    [_numButton1.layer setBorderColor:colorref1];//边框颜色
    [self addSubview:_numButton1];
    
    _numButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _numButton2.frame = CGRectMake(CGRectGetMaxX(_numButton1.frame) - 1, CGRectGetMaxY(_numLabel.frame)+15/PxHeight, 61/PxWidth, 40/PxHeight);
    [_numButton2 setTitle:@"1" forState:UIControlStateNormal];
    _numButton2.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_numButton2 setTitleColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_numButton2.layer setBorderWidth:1.0]; //边框宽度
    [_numButton2.layer setBorderColor:colorref1];//边框颜色
    [self addSubview:_numButton2];
    
    _numButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _numButton3.frame = CGRectMake(CGRectGetMaxX(_numButton2.frame)-1, CGRectGetMaxY(_numLabel.frame)+15/PxHeight, 45/PxWidth, 40/PxHeight);
    [_numButton3 setTitle:@"+" forState:UIControlStateNormal];
    _numButton3.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_numButton3 setTitleColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_numButton3.layer setBorderWidth:1.0]; //边框宽度
    [_numButton3.layer setBorderColor:colorref1];//边框颜色
    [self addSubview:_numButton3];

    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_numButton3.frame) + 37/PxHeight, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self addSubview:lineLabel];
    
    _detailsLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_numLabel.frame), CGRectGetMaxY(lineLabel.frame) + 18/PxHeight, kScreenWidth - CGRectGetMinX(_numLabel.frame)*2, 60/PxHeight) title:@"天然农家产品，天然农家产品，天然农家产品，天然农家产品，天然农家产品，天然农家产品，天然农家产品，" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    _detailsLabel.numberOfLines = 0;
    [self addSubview:_detailsLabel];
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_detailsLabel.frame) + 18/PxHeight, kScreenWidth, 1)];
    lineLabel1.backgroundColor = Color_back;
    [self addSubview:lineLabel1];
    
    _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_detailsLabel.frame), CGRectGetMaxY(lineLabel1.frame) + 12/PxHeight, 58/PxWidth, 58/PxWidth)];
    _logoImageView.image = [UIImage imageNamed:@"logo-1"];
    [self addSubview:_logoImageView];
    
    _nameLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_logoImageView.frame) + 10/PxWidth, CGRectGetMinY(_logoImageView.frame), kScreenWidth/3, CGRectGetHeight(_logoImageView.frame)) title:@"农家休息店" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_nameLabel];
    
    _storeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _storeButton.frame = CGRectMake(kScreenWidth - 155/PxWidth, CGRectGetMaxY(lineLabel1.frame) + 25/PxHeight, 132/PxWidth, 30/PxHeight);
    [self addSubview:_storeButton];
    _buttonLabel = [UILabel setFrame:CGRectMake(0, 0, 97/PxWidth, 30/PxHeight) title:@"进入店铺" tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [_storeButton addSubview:_buttonLabel];
    
    _buttonImage = [[UIImageView alloc]initWithFrame:CGRectMake(107/PxWidth, 0, 30/PxWidth, 30/PxWidth)];
    _buttonImage.image = [UIImage imageNamed:@"下一页"];
    [_storeButton addSubview:_buttonImage];
    
    UILabel *lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_logoImageView.frame) + 12/PxHeight, kScreenWidth, 1)];
    lineLabel2.backgroundColor = Color_back;
    [self addSubview:lineLabel2];
    
}

@end
