//
//  RegisetView.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "RegisetView.h"

@implementation RegisetView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView:frame];
    }
    return self;
}

-(void)p_setupView:(CGRect)frame
{
    _backImageView = [[UIImageView alloc]initWithFrame:frame];
    _backImageView.image = [UIImage imageNamed:@"登录背景"];
    _backImageView.userInteractionEnabled = YES;
    [self addSubview:_backImageView];
    
    _liftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _liftButton.frame = CGRectMake(30/PxWidth, 50/PxHeight, 44/PxWidth, 44/PxWidth);
    [_liftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [_backImageView addSubview:_liftButton];
    
    
    _textView = [[UIView alloc]initWithFrame:CGRectMake(25/PxHeight, CGRectGetMaxY(_liftButton.frame) + 50/PxHeight, kScreenWidth - 50/PxWidth, 165/PxHeight)];
    _textView.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0  blue:100/255.0  alpha:1.0];
    [_textView.layer setMasksToBounds:YES];
    [_textView.layer setCornerRadius:5/PxWidth];
    
    
    _userLabel=  [UILabel setFrame:CGRectMake(18/PxWidth, 17/PxHeight, [UILabel widthForString:@"手机号:" font:[UIFont systemFontOfSize:15.0]], 20/PxHeight) title:@"手机号:" tintColor:[UIColor colorWithRed:189/255.0 green:189/255.0  blue:189/255.0  alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_textView addSubview:_userLabel];
    _userTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userLabel.frame), 0, CGRectGetWidth(_textView.frame)/2, CGRectGetHeight(_textView.frame)/3 -1)];
    _userTextField.placeholder = @"请输入手机号";
    [_textView addSubview:_userTextField];
    [_backImageView addSubview:_textView];
    
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_userTextField.frame), CGRectGetWidth(_textView.frame), 1)];
    lineLabel.backgroundColor = [UIColor colorWithRed:127/255.0 green:127/255.0  blue:127/255.0  alpha:1.0];
    [_textView addSubview:lineLabel];
    _codeLabel=  [UILabel setFrame:CGRectMake(18/PxWidth, CGRectGetMaxY(lineLabel.frame) + 17/PxHeight, [UILabel widthForString:@"验证码:" font:[UIFont systemFontOfSize:15.0]], 20/PxHeight) title:@"验证码:" tintColor:[UIColor colorWithRed:189/255.0 green:189/255.0  blue:189/255.0  alpha:1.0]  textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_textView addSubview:_codeLabel];
    _codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_codeLabel.frame), CGRectGetMaxY(lineLabel.frame), CGRectGetWidth(_userTextField.frame), CGRectGetHeight(_textView.frame)/3)];
    _codeTextField.placeholder = @"请输入验证码";
    [_textView addSubview:_codeTextField];
    
    _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _codeButton.frame = CGRectMake(CGRectGetWidth(_textView.frame) - [UILabel widthForString:@"发送验证码" font:[UIFont systemFontOfSize:15.0]], CGRectGetMaxY(lineLabel.frame), [UILabel widthForString:@"发送验证码" font:[UIFont systemFontOfSize:15.0]], CGRectGetHeight(_textView.frame)/3);
    [_codeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    _codeButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_textView addSubview:_codeButton];
    
    UILabel *lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_codeButton.frame) - 5/PxWidth, CGRectGetMaxY(lineLabel.frame) + 5/PxHeight, 1, CGRectGetHeight(_textView.frame)/3 - 10/PxHeight)];
    lineLabel2.backgroundColor = [UIColor colorWithRed:127/255.0 green:127/255.0  blue:127/255.0  alpha:1.0];
    [_textView addSubview:lineLabel2];

    
    
    UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_codeTextField.frame) + 1, CGRectGetWidth(_textView.frame), 1)];
    lineLabel1.backgroundColor = [UIColor colorWithRed:127/255.0 green:127/255.0  blue:127/255.0  alpha:1.0];
    [_textView addSubview:lineLabel1];
    
    _passWordLabel = [UILabel setFrame:CGRectMake(18/PxWidth, CGRectGetMaxY(lineLabel1.frame) + 17/PxHeight, [UILabel widthForString:@"密码:" font:[UIFont systemFontOfSize:15.0]], 20/PxHeight) title:@"密码:" tintColor:[UIColor colorWithRed:189/255.0 green:189/255.0  blue:189/255.0  alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_textView addSubview:_passWordLabel];
    _passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_passWordLabel.frame), CGRectGetMaxY(lineLabel1.frame), CGRectGetWidth(_userTextField.frame), CGRectGetHeight(_textView.frame)/3)];
    _passWordTextField.placeholder = @"请输入密码";
    _passWordTextField.secureTextEntry = YES;
    [_textView addSubview:_passWordTextField];
    
    _passWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _passWordButton.frame = CGRectMake(CGRectGetWidth(_textView.frame) - 50/PxWidth, CGRectGetMaxY(lineLabel1.frame)+ (CGRectGetHeight(_textView.frame)/3 - 30/PxWidth)/2, 30/PxWidth, 30/PxWidth);
    [_passWordButton setImage:[UIImage imageNamed:@"闭眼"] forState:UIControlStateNormal];
    [_passWordButton addTarget:self action:@selector(passWordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_textView addSubview:_passWordButton];

    
    _regisetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _regisetButton.frame = CGRectMake(CGRectGetMinX(_textView.frame), CGRectGetMaxY(_textView.frame) + 40/PxHeight, CGRectGetWidth(_textView.frame), 55/PxHeight);
    [_regisetButton setTitle:@"注册" forState:UIControlStateNormal];
    _regisetButton.backgroundColor = [UIColor colorWithRed:35/255.0 green:180/255.0  blue:117/255.0  alpha:1.0];
    _regisetButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [_regisetButton.layer setMasksToBounds:YES];
    [_regisetButton.layer setCornerRadius:5/PxWidth];
    [_backImageView addSubview:_regisetButton];
}

-(void)passWordButtonAction{
    _passWordTextField.secureTextEntry = !_passWordTextField.secureTextEntry ;
    if (_passWordTextField.secureTextEntry) {
        [_passWordButton setImage:[UIImage imageNamed:@"闭眼"] forState:UIControlStateNormal];
    }else{
        [_passWordButton setImage:[UIImage imageNamed:@"睁眼"] forState:UIControlStateNormal];
    }
}

@end
