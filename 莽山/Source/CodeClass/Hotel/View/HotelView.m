//
//  HotelView.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "HotelView.h"

@implementation HotelView

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
    _storeNameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 10/PxHeight, kScreenWidth/2, 35/PxHeight) title:@"莽山原生态酒店" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_storeNameLabel];
    _addressLabel = [UILabel setFrame:CGRectMake(CGRectGetMinX(_storeNameLabel.frame), CGRectGetMaxY(_storeNameLabel.frame), CGRectGetWidth(_storeNameLabel.frame), CGRectGetHeight(_storeNameLabel.frame)) title:@"湖南莽山森林公园附近500m" tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_addressLabel];
    _phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _phoneButton.frame = CGRectMake(kScreenWidth - 65/PxWidth, 15/PxHeight, 40/PxWidth, 40/PxWidth);
    [_phoneButton addTarget:self action:@selector(phoneAction:) forControlEvents:UIControlEventTouchUpInside];
    [_phoneButton setImage:[UIImage imageNamed:@"电话"] forState:UIControlStateNormal];
    [self addSubview:_phoneButton];
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_addressLabel.frame), kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self addSubview:lineLabel];
    
    
    _inButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _inButton.frame = CGRectMake(0, CGRectGetMaxY(_addressLabel.frame), kScreenWidth/2, 88/PxHeight);
    [_inButton addTarget:self action:@selector(dataButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_inButton];

    UILabel *inTextLabel = [UILabel setFrame:CGRectMake(0, 5/PxHeight, CGRectGetWidth(_inButton.frame), CGRectGetHeight(_inButton.frame)/2 - 5/PxHeight) title:@"入住" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [_inButton addSubview:inTextLabel];
    
    _inLabel = [UILabel setFrame:CGRectMake(0, CGRectGetMaxY(inTextLabel.frame) + 5/PxHeight, CGRectGetWidth(inTextLabel.frame), CGRectGetHeight(inTextLabel.frame)/2) title:@"2016.04.15" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [_inButton addSubview:_inLabel];
    
    
    _outButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _outButton.frame = CGRectMake(CGRectGetMaxX(_inButton.frame), CGRectGetMaxY(_addressLabel.frame), kScreenWidth/2, 88/PxHeight);
    [_outButton addTarget:self action:@selector(dataButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_outButton];
    
    UILabel *outTextLabel = [UILabel setFrame:CGRectMake(0, 5/PxHeight, CGRectGetWidth(_outButton.frame), CGRectGetHeight(_outButton.frame)/2 - 5/PxHeight) title:@"离店" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [_outButton addSubview:outTextLabel];
    
    _outLabel = [UILabel setFrame:CGRectMake(0, CGRectGetMaxY(outTextLabel.frame) + 5/PxHeight, CGRectGetWidth(outTextLabel.frame), CGRectGetHeight(outTextLabel.frame)/2) title:@"2016.04.16" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [_outButton addSubview:_outLabel];
    
    
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_inButton.frame), kScreenWidth, 1)];
    lineLabel1.backgroundColor = Color_back;
    [self addSubview:lineLabel1];
    
    _typeView1 = [[MallTypeView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_inButton.frame), kScreenWidth/3, 128/PxHeight)];
    _typeView1.typeLable.text = @"标准房间";
    [_typeView1.typeButton addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [_typeView1.typeButton setImage:[UIImage imageNamed:@"房间"] forState:UIControlStateNormal];
    [self addSubview:_typeView1];
    
    _typeView2 = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_typeView1.frame), CGRectGetMaxY(_inButton.frame), kScreenWidth/3, CGRectGetHeight(_typeView1.frame))];
    _typeView2.typeLable.text = @"地图导航";
    [_typeView2.typeButton addTarget:self action:@selector(mapAction:) forControlEvents:UIControlEventTouchUpInside];
    [_typeView2.typeButton setImage:[UIImage imageNamed:@"导航-1"] forState:UIControlStateNormal];
    [self addSubview:_typeView2];
    
    _typeView3 = [[MallTypeView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_typeView2.frame), CGRectGetMaxY(_inButton.frame), kScreenWidth/3, CGRectGetHeight(_typeView2.frame))];
    _typeView3.typeLable.text = @"周边环境";
    [_typeView3.typeButton addTarget:self action:@selector(surroundAction:) forControlEvents:UIControlEventTouchUpInside];
    [_typeView3.typeButton setImage:[UIImage imageNamed:@"周边"] forState:UIControlStateNormal];
    [self addSubview:_typeView3];
    
    UILabel *lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_typeView3.frame)-1, kScreenWidth, 1)];
    lineLabel2.backgroundColor = Color_back;
    [self addSubview:lineLabel2];
    
    _headButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _headButton1.backgroundColor = [UIColor whiteColor];
    _headButton1.frame = CGRectMake(0, CGRectGetMaxY(_typeView1.frame) + 1, kScreenWidth/3, 50/PxHeight);
    [_headButton1 setTitle:@"简介" forState:UIControlStateNormal];
    _headButton1.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton1 addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_headButton1];
    
    _greenLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(25/PxWidth, CGRectGetHeight(_headButton1.frame) - 2, kScreenWidth/3 - 50/PxWidth, 2)];
    [_headButton1 addSubview:_greenLabel1];
    [_headButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _greenLabel1.backgroundColor = Color_indigo;
    
    _headButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _headButton2.frame = CGRectMake(CGRectGetMaxX(_headButton1.frame), CGRectGetMinY(_headButton1.frame), CGRectGetWidth(_headButton1.frame), CGRectGetHeight(_headButton1.frame));
    _headButton2.backgroundColor = [UIColor whiteColor];
    [_headButton2 setTitle:@"价格包含" forState:UIControlStateNormal];
    [_headButton2 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _headButton2.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton2 addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_headButton2];
    
    _greenLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(25/PxWidth, CGRectGetHeight(_headButton1.frame) - 2, kScreenWidth/3 - 50/PxWidth, 2)];
    [_headButton2 addSubview:_greenLabel2];
    
    _headButton3 = [UIButton buttonWithType:UIButtonTypeSystem];
    _headButton3.frame = CGRectMake(CGRectGetMaxX(_headButton2.frame), CGRectGetMinY(_headButton1.frame), CGRectGetWidth(_headButton2.frame), CGRectGetHeight(_headButton2.frame));
    _headButton3.backgroundColor = [UIColor whiteColor];
    [_headButton3 setTitle:@"评价" forState:UIControlStateNormal];
    [_headButton3 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _headButton3.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton3 addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_headButton3];
    
    _greenLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(25/PxWidth, CGRectGetHeight(_headButton1.frame) - 2, kScreenWidth/3 - 50/PxWidth, 2)];
    [_headButton3 addSubview:_greenLabel3];
}

-(void)titleButtonAction:(id)sender{
    [self.delegate titleButtonAction:sender];
}

-(void)dataButtonAction:(id)sender{
    [self.delegate dataButtonAction:sender];
}

-(void)chooseAction:(id)sender{
    [self.delegate chooseAction:sender];
}

-(void)mapAction:(id)sender{
    [self.delegate mapAction:sender];
}

-(void)surroundAction:(id)sender{
    [self.delegate surroundAction:sender];
}

-(void)phoneAction:(id)sender{
    [self.delegate phoneAction:sender];
}
@end
