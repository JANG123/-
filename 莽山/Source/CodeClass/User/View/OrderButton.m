//
//  OrderButton.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "OrderButton.h"

@implementation OrderButton

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
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(50/PxWidth, 15/PxHeight, 36/PxWidth, 30/PxWidth)];
    _logoView.image = [UIImage imageNamed:@"待付款"];
    [self addSubview:_logoView];
    
    _textLabel = [UILabel setFrame:CGRectMake(0, CGRectGetMaxY(_logoView.frame) + 10/PxHeight, kScreenWidth/4, 20/PxHeight) title:@"代付款" tintColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_textLabel];
    
}

-(void)logoViewFrame:(CGRect)frame{
    _logoView.frame =frame;
    _textLabel.frame = CGRectMake(0, CGRectGetMaxY(_logoView.frame) + 10/PxHeight + 2/PxWidth, kScreenWidth/4, 20/PxHeight);
}

@end
