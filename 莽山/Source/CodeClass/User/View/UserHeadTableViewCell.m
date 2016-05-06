//
//  UserHeadTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UserHeadTableViewCell.h"

@implementation UserHeadTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 230/PxHeight)];
    goodImageView.image = [UIImage imageNamed:@"登陆-拷贝-2"];
    goodImageView.userInteractionEnabled = YES;
    [self setBackgroundView:goodImageView];
    
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 82/PxWidth)/2, 45/PxHeight, 82/PxWidth, 82/PxWidth)];
    _headImageView.backgroundColor = [UIColor whiteColor];
    [_headImageView.layer setMasksToBounds:YES];
    [_headImageView.layer setCornerRadius:41/PxWidth];
    _headImageView.userInteractionEnabled = YES;
    [self addSubview:_headImageView];

    _userNameLabel = [UILabel setFrame:CGRectMake(0, CGRectGetMaxY(_headImageView.frame) + 10/PxHeight, kScreenWidth, 25/PxHeight) title:@"请登录" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_userNameLabel];
}

@end
