//
//  EvaluationImageTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationImageTableViewCell.h"

@implementation EvaluationImageTableViewCell

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

-(void)setImage1:(NSString *)image1{
    _detailsImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_detailsLabel.frame), CGRectGetMaxY(_detailsLabel.frame) + 10/PxHeight, 61/PxWidth, 61/PxWidth)];
    [_detailsImageView1 sd_setImageWithURL:[NSURL URLWithString:image1]];
    [self addSubview:_detailsImageView1];
}

-(void)setImage2:(NSString *)image2{
    _detailsImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView1.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView1.frame), 61/PxWidth, 61/PxWidth)];
    [_detailsImageView2 sd_setImageWithURL:[NSURL URLWithString:image2]];
    [self addSubview:_detailsImageView2];
}

-(void)setImage3:(NSString *)image3{
    _detailsImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView2.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView2.frame), 61/PxWidth, 61/PxWidth)];
    [_detailsImageView3 sd_setImageWithURL:[NSURL URLWithString:image3]];
    [self addSubview:_detailsImageView3];
}

-(void)setImage4:(NSString *)image4{
    _detailsImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView3.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView3.frame), 61/PxWidth, 61/PxWidth)];
    [_detailsImageView4 sd_setImageWithURL:[NSURL URLWithString:image4]];
    [self addSubview:_detailsImageView4];
}

-(void)setImage5:(NSString *)image5{
    _detailsImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView4.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView4.frame), 61/PxWidth, 61/PxWidth)];
    [_detailsImageView5 sd_setImageWithURL:[NSURL URLWithString:image5]];
    [self addSubview:_detailsImageView5];
}

-(void)setImage6:(NSString *)image6{
    _detailsImageView6 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_detailsImageView5.frame) + 8/PxWidth, CGRectGetMinY(_detailsImageView5.frame), 61/PxWidth, 61/PxWidth)];
    [_detailsImageView6 sd_setImageWithURL:[NSURL URLWithString:image6]];
    [self addSubview:_detailsImageView6];
}

-(CGFloat)hightForCell:(BOOL)isImage{
    if (isImage) {
        return 265/PxHeight;
    }else{
        return 130/PxHeight;
    }
}

@end
