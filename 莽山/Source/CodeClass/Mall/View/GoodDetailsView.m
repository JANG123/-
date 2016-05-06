//
//  GoodDetailsView.m
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "GoodDetailsView.h"

@implementation GoodDetailsView

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
    
    _goodNameLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, 20/PxHeight, 160/PxWidth, 40/PxHeight) title:@"商品名称" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_goodNameLabel1];

    _goodNameLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_goodNameLabel1.frame), CGRectGetMinY(_goodNameLabel1.frame), CGRectGetWidth(_goodNameLabel1.frame), CGRectGetHeight(_goodNameLabel1.frame)) title:@"商品名称" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_goodNameLabel2];
    
    _compositionLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_goodNameLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"配料成分" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_compositionLabel1];
    
    _compositionLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_compositionLabel1.frame), CGRectGetMinY(_compositionLabel1.frame), CGRectGetWidth(_compositionLabel1.frame), CGRectGetHeight(_compositionLabel1.frame)) title:@"配料成分" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_compositionLabel2];
    
    _dateLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_compositionLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"有效期/保质期" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_dateLabel1];
    
    _dateLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_dateLabel1.frame), CGRectGetMinY(_dateLabel1.frame), CGRectGetWidth(_dateLabel1.frame), CGRectGetHeight(_dateLabel1.frame)) title:@"有效期/保质期" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_dateLabel2];
    
    _storageLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_dateLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"仓储方式" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_storageLabel1];
    
    _storageLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_storageLabel1.frame), CGRectGetMinY(_storageLabel1.frame), CGRectGetWidth(_storageLabel1.frame), CGRectGetHeight(_storageLabel1.frame)) title:@"仓储方式" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_storageLabel2];
    
    _warehousLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_storageLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"包装方式" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_warehousLabel1];
    
    _warehousLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_warehousLabel1.frame), CGRectGetMinY(_warehousLabel1.frame), CGRectGetWidth(_warehousLabel1.frame), CGRectGetHeight(_warehousLabel1.frame)) title:@"包装方式" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_warehousLabel2];
    
    _weightLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_warehousLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"商品重量" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_weightLabel1];
    
    _weightLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_weightLabel1.frame), CGRectGetMinY(_weightLabel1.frame), CGRectGetWidth(_weightLabel1.frame), CGRectGetHeight(_weightLabel1.frame)) title:@"商品重量" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_weightLabel2];
    
    _packagingLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_weightLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"使用方法" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_packagingLabel1];
    
    _packagingLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_packagingLabel1.frame), CGRectGetMinY(_packagingLabel1.frame), CGRectGetWidth(_packagingLabel1.frame), CGRectGetHeight(_packagingLabel1.frame)) title:@"使用方法" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_packagingLabel2];
    
    _timeLabel1 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_packagingLabel1.frame) + 15/PxHeight, 160/PxWidth, 40/PxHeight) title:@"生产日期" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_timeLabel1];
    
    _timeLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_timeLabel1.frame), CGRectGetMinY(_timeLabel1.frame), CGRectGetWidth(_timeLabel1.frame), CGRectGetHeight(_timeLabel1.frame)) title:@"生产日期" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_timeLabel2];
    
    _goodImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20/PxHeight + CGRectGetMaxY(_timeLabel1.frame), kScreenWidth, 250/PxHeight)];
    _goodImageView1.image = [UIImage imageNamed:@"图层-7"];
    [self addSubview:_goodImageView1];
    
    _goodImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5/PxHeight + CGRectGetMaxY(_goodImageView1.frame), kScreenWidth, 250/PxHeight)];
    _goodImageView2.image = [UIImage imageNamed:@"图层-11"];
    [self addSubview:_goodImageView2];
    
    _goodImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5/PxHeight + CGRectGetMaxY(_goodImageView2.frame), kScreenWidth, 250/PxHeight)];
    _goodImageView3.image = [UIImage imageNamed:@"图层-12"];
    [self addSubview:_goodImageView3];
    
}

@end
