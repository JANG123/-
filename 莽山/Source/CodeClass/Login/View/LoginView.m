//
//  LoginView.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

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
    
    _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _downButton.frame = CGRectMake(30/PxWidth, 50/PxHeight, 44/PxWidth, 44/PxWidth);
    [_downButton setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
    [_backImageView addSubview:_downButton];
    
    _headImageView =  [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 100/PxWidth)/2, 110/PxHeight, 100/PxWidth, 100/PxWidth)];
    _headImageView.backgroundColor = [UIColor whiteColor];
    [_headImageView.layer setMasksToBounds:YES];
    [_headImageView.layer setCornerRadius:5/PxWidth];
    _headImageView.userInteractionEnabled = YES;
    [_backImageView addSubview:_headImageView];
    
    _textView = [[UIView alloc]initWithFrame:CGRectMake(25/PxHeight, CGRectGetMaxY(_headImageView.frame) + 100/PxHeight, kScreenWidth - 50/PxWidth, 110/PxHeight)];
    _textView.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0  blue:100/255.0  alpha:1.0];
    [_textView.layer setMasksToBounds:YES];
    [_textView.layer setCornerRadius:5/PxWidth];
    _userImageView =  [[UIImageView alloc]initWithFrame:CGRectMake(20/PxWidth, 12/PxHeight, 30/PxWidth, 30/PxWidth)];
    _userImageView.image = [UIImage imageNamed:@"登陆"];
    [_textView addSubview:_userImageView];
    _userTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userImageView.frame), 0, CGRectGetWidth(_textView.frame) - CGRectGetWidth(_userImageView.frame), CGRectGetHeight(_textView.frame)/2 -1)];
    _userTextField.placeholder = @"请输入手机号";
    [_textView addSubview:_userTextField];
    [_backImageView addSubview:_textView];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_userTextField.frame), CGRectGetWidth(_textView.frame), 1)];
    lineLabel.backgroundColor = [UIColor colorWithRed:127/255.0 green:127/255.0  blue:127/255.0  alpha:1.0];
    [_textView addSubview:lineLabel];
    _passWordImageView =  [[UIImageView alloc]initWithFrame:CGRectMake(20/PxWidth, CGRectGetMaxY(lineLabel.frame) + 12/PxHeight, 30/PxWidth, 30/PxWidth)];
    _passWordImageView.image = [UIImage imageNamed:@"密码"];
    [_textView addSubview:_passWordImageView];
    _passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_passWordImageView.frame), CGRectGetMaxY(lineLabel.frame), CGRectGetWidth(_userTextField.frame), CGRectGetHeight(_textView.frame)/2)];
    _passWordTextField.placeholder = @"请输入密码";
    _passWordTextField.secureTextEntry = YES;
    [_textView addSubview:_passWordTextField];
    
    _passWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _passWordButton.frame = CGRectMake(CGRectGetWidth(_textView.frame) - 50/PxWidth, CGRectGetMaxY(lineLabel.frame)+ (CGRectGetHeight(_textView.frame)/2 - 30/PxWidth)/2, 30/PxWidth, 30/PxWidth);
    [_passWordButton setImage:[UIImage imageNamed:@"闭眼"] forState:UIControlStateNormal];
    [_passWordButton addTarget:self action:@selector(passWordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_textView addSubview:_passWordButton];
    
    
    
    _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _forgetButton.frame = CGRectMake(CGRectGetMinX(_textView.frame), CGRectGetMaxY(_textView.frame), 100/PxWidth, 100/PxHeight);
    [_forgetButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [_forgetButton setTitleColor:[UIColor colorWithRed:143/255.0 green:143/255.0  blue:143/255.0  alpha:1.0] forState:UIControlStateNormal];
    _forgetButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_backImageView addSubview:_forgetButton];
    
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(CGRectGetMinX(_textView.frame), CGRectGetMaxY(_textView.frame) + 95/PxHeight, CGRectGetWidth(_textView.frame), 55/PxHeight);
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor colorWithRed:35/255.0 green:180/255.0  blue:117/255.0  alpha:1.0];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setCornerRadius:5/PxWidth];
    [_backImageView addSubview:_loginButton];
    
    _regiestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _regiestButton.frame = CGRectMake((kScreenWidth - 150/PxWidth)/2, kScreenHeight - 90/PxHeight, 150/PxHeight, 50/PxHeight);
    [_regiestButton setImage:[UIImage imageNamed:@"注册"] forState:UIControlStateNormal];
    [_backImageView addSubview:_regiestButton];
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
