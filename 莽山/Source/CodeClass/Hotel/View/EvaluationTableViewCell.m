//
//  EvaluationTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationTableViewCell.h"

@implementation EvaluationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _nameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 20/PxHeight, 250/PxWidth, 20/PxHeight) title:@"155****5555" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_nameLabel];
    
    _starRatingView = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame) + 5/PxHeight, 120/PxHeight, 20/PxHeight)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 0;
    _starRatingView.allowsHalfStars = NO;
    _starRatingView.spacing = 5/PxWidth;
    _starRatingView.tintColor = Color_indigo;
    _starRatingView.touchBool = NO;
    [self addSubview:_starRatingView];
    
    _dateLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_starRatingView.frame) + 10/PxWidth, CGRectGetMinY(_starRatingView.frame), 200/PxWidth, 20/PxHeight) title:@"2016-04-25" tintColor:Color_back textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_dateLabel];
    
    _detailsLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_dateLabel.frame) + 12/PxHeight, kScreenWidth - 50/PxWidth, 20/PxHeight) title:@"好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    _detailsLabel.numberOfLines = 0;
    CGFloat height = [UILabel heightForString:_detailsLabel.text font:_detailsLabel.font Width:_detailsLabel.frame.size.width];
    _detailsLabel.frame = CGRectMake(25/PxWidth, CGRectGetMaxY(_dateLabel.frame) + 12/PxHeight, kScreenWidth - 50/PxWidth, height);
    [self addSubview:_detailsLabel];
}

-(CGFloat)hightForCell{
    return CGRectGetMaxY(_detailsLabel.frame) + 17/PxHeight;
}

@end
