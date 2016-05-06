//
//  OrderSelectionButton.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "OrderSelectionButton.h"

@implementation OrderSelectionButton

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
    UIImageView *logoView = [[UIImageView alloc]initWithFrame:CGRectMake(25/PxWidth, 20/PxHeight, 30/PxWidth, 30/PxWidth)];
    logoView.image = [UIImage imageNamed:@"生态商城_土特产"];
    [self addSubview:logoView];
    
    _typeLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(logoView.frame) + 10/PxWidth, CGRectGetMinY(logoView.frame), kScreenWidth/4, CGRectGetHeight(logoView.frame)) title:@"土特产" tintColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_typeLabel];
    
    _arrowView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 55/PxWidth, CGRectGetMinY(logoView.frame), 30/PxWidth, 30/PxWidth)];
    _arrowView.image = [UIImage imageNamed:@"个人中心_下一页"];
    [self addSubview:_arrowView];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 1, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self addSubview:lineLabel];
}

@end
