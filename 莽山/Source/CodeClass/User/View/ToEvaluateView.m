//
//  ToEvaluateView.m
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "ToEvaluateView.h"
#import "evaluateClassView.h"
@implementation ToEvaluateView

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
    self.backgroundColor = Color_back;
    
    UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 230/PxHeight)];
    backView1.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView1];
    
    _titleLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 10/PxHeight, kScreenWidth/2 - 25/PxWidth, 52/PxHeight) title:@"服务评价" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [backView1 addSubview:_titleLabel];

    _titleTextLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame), CGRectGetMinY(_titleLabel.frame), CGRectGetWidth(_titleLabel.frame), CGRectGetHeight(_titleLabel.frame)) title:@"满意请给5星哦" tintColor:[UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [backView1 addSubview:_titleTextLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self addSubview:lineLabel];
    
    _evaClassView1 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame) + 10/PxHeight, kScreenWidth, 35/PxHeight)];
    [backView1 addSubview:_evaClassView1];
    
    _evaClassView2 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_evaClassView1.frame), kScreenWidth, CGRectGetHeight(_evaClassView1.frame))];
    [backView1 addSubview:_evaClassView2];
    
    _evaClassView3 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_evaClassView2.frame), kScreenWidth, CGRectGetHeight(_evaClassView2.frame))];
    [backView1 addSubview:_evaClassView3];
    
    _evaClassView4 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_evaClassView3.frame), kScreenWidth, CGRectGetHeight(_evaClassView3.frame))];
    [backView1 addSubview:_evaClassView4];
    
    UIView *backView2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(backView1.frame) + 20/PxHeight, kScreenWidth, 190/PxHeight)];
    backView2.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView2];
    
    _evaluateTextView = [[UITextView alloc]initWithFrame:CGRectMake(25/PxWidth, 0, kScreenWidth - 50/PxWidth, 150/PxHeight)];
    _evaluateTextView.backgroundColor = [UIColor whiteColor];
    [backView2 addSubview:_evaluateTextView];
    
    
    _textLabel = [UILabel setFrame:CGRectMake(kScreenWidth/2, CGRectGetMaxY(_evaluateTextView.frame), kScreenWidth/2 - 25/PxWidth, 30/PxHeight) title:@"150" tintColor:[UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [backView2 addSubview:_textLabel];
    
    _backView4 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(backView2.frame), kScreenWidth, 40/PxHeight)];
    _backView4.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView4];
    
    _addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addImageButton.frame = CGRectMake((kScreenWidth - 150/PxWidth)/2,0, 150/PxWidth , 40/PxHeight);
    [_addImageButton setImage:[UIImage imageNamed:@"添加图片"] forState:UIControlStateNormal];
    [_backView4 addSubview:_addImageButton];
    
    
    _nimingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nimingButton.frame = CGRectMake(25/PxWidth, CGRectGetMaxY(_backView4.frame) + 15/PxHeight, 30/PxHeight , 30/PxHeight);
    [_nimingButton setImage:[UIImage imageNamed:@"加"] forState:UIControlStateNormal];
    [self addSubview:_nimingButton];
    
    _nimingLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_nimingButton.frame) + 10/PxWidth, CGRectGetMinY(_nimingButton.frame), kScreenWidth/2, CGRectGetHeight(_nimingButton.frame)) title:@"匿名评论" tintColor:[UIColor colorWithRed:78/255.0 green:78/255.0 blue:78/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [self addSubview:_nimingLabel];
    
    _backView5 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(backView2.frame) + 15/PxHeight, kScreenWidth, 165/PxHeight)];
    _backView5.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView5];
    _backView5.hidden = YES;
    
    
    _backView3 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_nimingLabel.frame) + 15/PxHeight, kScreenWidth, 230/PxHeight)];
    _backView3.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView3];
    
    _goodLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 10/PxHeight, kScreenWidth/2 - 25/PxWidth, 52/PxHeight) title:@"商品评价" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [_backView3 addSubview:_goodLabel];
    
    _goodTextLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_goodLabel.frame), CGRectGetMinY(_goodLabel.frame), CGRectGetWidth(_goodLabel.frame), CGRectGetHeight(_goodLabel.frame)) title:@"满意请给5星哦" tintColor:[UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0] textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:14.0]];
    [_backView3 addSubview:_goodTextLabel];
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), kScreenWidth, 1)];
    lineLabel1.backgroundColor = Color_back;
    [_backView3 addSubview:lineLabel1];
    
    _evaClassView5 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_goodTextLabel.frame) + 10/PxHeight, kScreenWidth, 35/PxHeight)];
    [_backView3 addSubview:_evaClassView5];
    
    _evaClassView6 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_evaClassView5.frame), kScreenWidth, CGRectGetHeight(_evaClassView5.frame))];
    [_backView3 addSubview:_evaClassView6];
    
    _evaClassView7 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_evaClassView6.frame), kScreenWidth, CGRectGetHeight(_evaClassView6.frame))];
    [_backView3 addSubview:_evaClassView7];
    
    _evaClassView8 = [[evaluateClassView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_evaClassView7.frame), kScreenWidth, CGRectGetHeight(_evaClassView7.frame))];
    [_backView3 addSubview:_evaClassView8];
    _backView3.hidden = YES;


}

@end
