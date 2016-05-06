//
//  MallTypeView.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "MallTypeView.h"

@implementation MallTypeView
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
    double x = self.frame.size.width;
    _typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _typeButton.frame = CGRectMake((x - 75/PxWidth)/2, 15/PxHeight, 75/PxWidth, 75/PxWidth);
    [_typeButton.layer setMasksToBounds:YES];
    [_typeButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_typeButton];
    CGRect rect = CGRectMake(CGRectGetMinX(_typeButton.frame), CGRectGetMaxY(_typeButton.frame) + 10/PxHeight, CGRectGetWidth(_typeButton.frame), 15/PxHeight);
    _typeLable = [UILabel setFrame:rect title:@"休闲" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_typeLable];
}
@end
