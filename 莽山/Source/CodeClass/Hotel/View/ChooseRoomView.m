//
//  ChooseRoomView.m
//  莽山
//
//  Created by jang on 16/4/25.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "ChooseRoomView.h"
#import "RoomTypeButton.h"
@implementation ChooseRoomView

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
    _typeButton1 = [RoomTypeButton buttonWithType:UIButtonTypeCustom];
    _typeButton1.frame = CGRectMake(0, 0, kScreenWidth, 128/PxHeight);
    [self addSubview:_typeButton1];
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_typeButton1.frame), kScreenWidth, 1)];
    lineLabel1.backgroundColor = Color_back;
    [self addSubview:lineLabel1];

    _typeButton2 = [RoomTypeButton buttonWithType:UIButtonTypeCustom];
    _typeButton2.frame = CGRectMake(0, CGRectGetMaxY(_typeButton1.frame), kScreenWidth, CGRectGetHeight(_typeButton1.frame));
    [self addSubview:_typeButton2];
}

@end
