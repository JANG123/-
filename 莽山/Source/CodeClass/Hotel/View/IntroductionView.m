//
//  IntroductionView.m
//  莽山
//
//  Created by jang on 16/4/25.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "IntroductionView.h"

@implementation IntroductionView

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
    _spaceLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, 10/PxHeight, kScreenWidth/2 - 25/PxWidth, 20/PxHeight) title:@"共享空间类型" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_spaceLabel1];
    
    _spaceLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_spaceLabel1.frame), CGRectGetMinY(_spaceLabel1.frame), CGRectGetWidth(_spaceLabel1.frame), CGRectGetHeight(_spaceLabel1.frame)) title:@"独立房间" tintColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_spaceLabel2];
                                                
    _bedLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_spaceLabel1.frame), CGRectGetMaxY(_spaceLabel1.frame) +15/PxHeight, CGRectGetWidth(_spaceLabel1.frame), CGRectGetHeight(_spaceLabel1.frame)) title:@"床型" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_bedLabel1];
    
    _bedLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_bedLabel1.frame), CGRectGetMinY(_bedLabel1.frame), CGRectGetWidth(_bedLabel1.frame), CGRectGetHeight(_bedLabel1.frame)) title:@"标准席梦思" tintColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_bedLabel2];
    
    _numLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_bedLabel1.frame), CGRectGetMaxY(_bedLabel1.frame) +15/PxHeight, CGRectGetWidth(_bedLabel1.frame), CGRectGetHeight(_bedLabel1.frame)) title:@"最多入住人数" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_numLabel1];
    
    _numLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_numLabel1.frame), CGRectGetMinY(_numLabel1.frame), CGRectGetWidth(_numLabel1.frame), CGRectGetHeight(_numLabel1.frame)) title:@"2人" tintColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_numLabel2];
    
    _timeLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_numLabel1.frame), CGRectGetMaxY(_numLabel1.frame) +15/PxHeight, CGRectGetWidth(_numLabel1.frame), CGRectGetHeight(_numLabel1.frame)) title:@"最长可住时间" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_timeLabel1];
    
    _timeLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_timeLabel1.frame), CGRectGetMinY(_timeLabel1.frame), CGRectGetWidth(_timeLabel1.frame), CGRectGetHeight(_timeLabel1.frame)) title:@"可议" tintColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_timeLabel2];
    
    _dateLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_timeLabel1.frame), CGRectGetMaxY(_timeLabel1.frame) +15/PxHeight, CGRectGetWidth(_timeLabel1.frame), CGRectGetHeight(_timeLabel1.frame)) title:@"可租日期" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_dateLabel1];
    
    _dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dateButton.frame = CGRectMake(kScreenWidth - 100/PxWidth, CGRectGetMinY(_dateLabel1.frame), 75/PxWidth, CGRectGetHeight(_dateLabel1.frame));
    [_dateButton setTitleColor:Color_indigo forState:UIControlStateNormal];
    _dateButton.titleLabel.textAlignment = NSTextAlignmentRight;
    _dateButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    UILabel *textLabel = [UILabel setFrame:CGRectMake(0, 0, 75/PxWidth,  CGRectGetHeight(_dateLabel1.frame)) title:@"查看" tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [_dateButton addSubview:textLabel];
    [self addSubview:_dateButton];
    
    _titleLabel = [UILabel setFrame:CGRectMake(120/PxWidth, CGRectGetMaxY(_dateLabel1.frame) +20/PxHeight, kScreenWidth - 240/PxWidth, [self heightForString:@"可租日期可租日期可租日期可租日期\n可租日期可租日期可租日期\n可租日期"]) title:@"可租日期可租日期可租日期可租日期\n可租日期可租日期可租日期\n可租日期" tintColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:14.0]];
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];


    _wifiLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_dateLabel1.frame), CGRectGetMaxY(_titleLabel.frame) +20/PxHeight, CGRectGetWidth(_dateLabel1.frame), CGRectGetHeight(_dateLabel1.frame)) title:@"无线网" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_wifiLabel];
    
    _wifiImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_wifiLabel.frame), CGRectGetMinY(_wifiLabel.frame), 22/PxHeight, CGRectGetHeight(_wifiLabel.frame))];
    _wifiImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_wifiImageView];
    
    _toiletLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_wifiLabel.frame), CGRectGetMaxY(_wifiLabel.frame) +20/PxHeight, CGRectGetWidth(_wifiLabel.frame), CGRectGetHeight(_wifiLabel.frame)) title:@"卫生间" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_toiletLabel];
    
    _toiletImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_toiletLabel.frame), CGRectGetMinY(_toiletLabel.frame), 22/PxHeight, CGRectGetHeight(_toiletLabel.frame))];
    _toiletImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_toiletImageView];
    
    _airConditioningLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_toiletLabel.frame), CGRectGetMaxY(_toiletLabel.frame) +20/PxHeight, CGRectGetWidth(_toiletLabel.frame), CGRectGetHeight(_toiletLabel.frame)) title:@"空调" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_airConditioningLabel];
    
    _airConditioningImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_airConditioningLabel.frame), CGRectGetMinY(_airConditioningLabel.frame), 22/PxHeight, CGRectGetHeight(_airConditioningLabel.frame))];
    _airConditioningImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_airConditioningImageView];
    
    _kitchenLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_airConditioningLabel.frame), CGRectGetMaxY(_airConditioningLabel.frame) +20/PxHeight, CGRectGetWidth(_airConditioningLabel.frame), CGRectGetHeight(_airConditioningLabel.frame)) title:@"厨房" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_kitchenLabel];
    
    _kitchenImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_kitchenLabel.frame), CGRectGetMinY(_kitchenLabel.frame), 22/PxHeight, CGRectGetHeight(_kitchenLabel.frame))];
    _kitchenImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_kitchenImageView];
    
    
    _washLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_kitchenLabel.frame), CGRectGetMaxY(_kitchenLabel.frame) +20/PxHeight, CGRectGetWidth(_kitchenLabel.frame), CGRectGetHeight(_kitchenLabel.frame)) title:@"洗衣机" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_washLabel];
    
    _washImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_washLabel.frame), CGRectGetMinY(_washLabel.frame), 22/PxHeight, CGRectGetHeight(_washLabel.frame))];
    _washImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_washImageView];
    
    _TVLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_washLabel.frame), CGRectGetMaxY(_washLabel.frame) +20/PxHeight, CGRectGetWidth(_washLabel.frame), CGRectGetHeight(_kitchenLabel.frame)) title:@"电视" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_TVLabel];
    
    _TVImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_TVLabel.frame), CGRectGetMinY(_TVLabel.frame), 22/PxHeight, CGRectGetHeight(_TVLabel.frame))];
    _TVImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_TVImageView];
    
    _ovenLabel= [UILabel setFrame:CGRectMake(CGRectGetMinX(_TVLabel.frame), CGRectGetMaxY(_TVLabel.frame) +20/PxHeight, CGRectGetWidth(_TVLabel.frame), CGRectGetHeight(_TVLabel.frame)) title:@"微波炉" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_ovenLabel];
    
    _ovenImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25/PxWidth - CGRectGetHeight(_ovenLabel.frame), CGRectGetMinY(_ovenLabel.frame), 22/PxHeight, CGRectGetHeight(_ovenLabel.frame))];
    _ovenImageView.image = [UIImage imageNamed:@"wifi"];
    [self addSubview:_ovenImageView];
}

//把传进来的字符串放在一个假象的矩形中 ，返回矩形高度
-(CGFloat)heightForString:(NSString *)aString
{
    NSDictionary *dict = @{NSFontAttributeName :[UIFont systemFontOfSize:17.0]};
    
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.titleLabel.frame), 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
}
@end
