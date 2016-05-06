//
//  OrderSelectionView.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "OrderSelectionView.h"
#import "OrderSelectionButton.h"
@implementation OrderSelectionView

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
    self.backgroundColor = [UIColor whiteColor];
    _orderSelectionButton1 = [[OrderSelectionButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 67/PxHeight)];
    _orderSelectionButton1.typeLabel.text = @"土特产";
    [self addSubview:_orderSelectionButton1];
    
    _orderSelectionButton2 = [[OrderSelectionButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_orderSelectionButton1.frame), CGRectGetWidth(_orderSelectionButton1.frame), CGRectGetHeight(_orderSelectionButton1.frame))];
    _orderSelectionButton2.typeLabel.text = @"体验";
    [self addSubview:_orderSelectionButton2];
    
    _orderSelectionButton3 = [[OrderSelectionButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_orderSelectionButton2.frame), CGRectGetWidth(_orderSelectionButton2.frame), CGRectGetHeight(_orderSelectionButton2.frame))];
    _orderSelectionButton3.typeLabel.text = @"休闲";
    [self addSubview:_orderSelectionButton3];
    
    _orderSelectionButton4 = [[OrderSelectionButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_orderSelectionButton3.frame), CGRectGetWidth(_orderSelectionButton3.frame), CGRectGetHeight(_orderSelectionButton3.frame))];
    _orderSelectionButton4.typeLabel.text = @"自助";
    [self addSubview:_orderSelectionButton4];
    
    _orderSelectionButton5 = [[OrderSelectionButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_orderSelectionButton4.frame), CGRectGetWidth(_orderSelectionButton4.frame), CGRectGetHeight(_orderSelectionButton4.frame))];
    _orderSelectionButton5.typeLabel.text = @"农家乐";
    [self addSubview:_orderSelectionButton5];
    
    _orderSelectionButton6 = [[OrderSelectionButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_orderSelectionButton5.frame), CGRectGetWidth(_orderSelectionButton5.frame), CGRectGetHeight(_orderSelectionButton5.frame))];
    _orderSelectionButton6.typeLabel.text = @"酒店";
    [self addSubview:_orderSelectionButton6];
}

@end
