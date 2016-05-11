//
//  SetPhoneView.m
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SetPhoneView.h"

@implementation SetPhoneView

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
}

-(void)setOldString:(NSString *)oldString{
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 20/PxHeight + 64, kScreenWidth, 201/PxHeight)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView];
    
    _oldtitleLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 0 , [UILabel widthForString:oldString font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:oldString tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_backView addSubview:_oldtitleLabel];
    _oldString = oldString;
}

-(void)setOldtextString:(NSString *)oldtextString{
    _oldtextLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_oldtitleLabel.frame) + 10/PxWidth, 0 , [UILabel widthForString:oldtextString font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:oldtextString tintColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_backView addSubview:_oldtextLabel];
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_oldtextLabel.frame) - 1, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [_backView addSubview:lineLabel];
    _oldtextString = oldtextString;
}

-(void)setUpdateString2:(NSString *)updateString2{
    _updateLabel2 = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_oldtextLabel.frame), [UILabel widthForString:updateString2 font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:updateString2 tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_backView addSubview:_updateLabel2];
    
    _updateTextField2 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_updateLabel2.frame), CGRectGetMinY(_updateLabel2.frame), kScreenWidth - CGRectGetMaxX(_updateLabel2.frame), CGRectGetHeight(_updateLabel2.frame))];
    [_backView addSubview:_updateTextField2];
    _updateTextField2.placeholder = @"请输入原密码";
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_updateLabel2.frame) - 1, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [_backView addSubview:lineLabel];
    _updateString2 = updateString2;
}

-(void)setUpdateString:(NSString *)updateString{
    if (_oldString.length > 1) {
        if (_updateString2.length >1) {
            
            _backView.frame = CGRectMake(0, 20/PxHeight + 64, kScreenWidth, 268/PxHeight);
            _updateLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_updateLabel2.frame) , [UILabel widthForString:updateString font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:updateString tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
            [_backView addSubview:_updateLabel];
        }else{
            _updateLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_oldtextLabel.frame) , [UILabel widthForString:updateString font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:updateString tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
            [_backView addSubview:_updateLabel];
        }

    }else{
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 20/PxHeight + 64, kScreenWidth, 134/PxHeight)];
        _backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_backView];
        
        _updateLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 0, [UILabel widthForString:updateString font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:updateString tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
        [_backView addSubview:_updateLabel];
    }
    
    _updateTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_updateLabel.frame), CGRectGetMinY(_updateLabel.frame), kScreenWidth - CGRectGetMaxX(_updateLabel.frame), CGRectGetHeight(_updateLabel.frame))];
    [_backView addSubview:_updateTextField];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_updateLabel.frame) - 1, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [_backView addSubview:lineLabel];
    
    _codeLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_updateLabel.frame) , [UILabel widthForString:@"验证码:" font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:@"验证码:" tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_backView addSubview:_codeLabel];
    
    _codeButton =[UIButton buttonWithType:UIButtonTypeCustom];
     _codeButton.frame = CGRectMake(kScreenWidth- 25/PxWidth -[UILabel widthForString:@"获取验证码" font:[UIFont systemFontOfSize:15.0]], CGRectGetMinY(_codeLabel.frame), [UILabel widthForString:@"获取验证码" font:[UIFont systemFontOfSize:15.0]], CGRectGetHeight(_updateLabel.frame));
    _codeButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_codeButton setTitleColor:Color_indigo forState:UIControlStateNormal];
    [_backView addSubview:_codeButton];
    
    _codeTextField =  [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_codeLabel.frame), CGRectGetMinY(_codeLabel.frame), kScreenWidth - CGRectGetWidth(_codeLabel.frame) - CGRectGetWidth(_codeButton.frame), CGRectGetHeight(_codeLabel.frame))];
    _codeTextField.placeholder = @"请输入验证码";
    [_backView addSubview:_codeTextField];
    
    _determineButton  =[UIButton buttonWithType:UIButtonTypeCustom];
    _determineButton.frame = CGRectMake(0, CGRectGetMaxY(_backView.frame) + 20/PxHeight, kScreenWidth , 55/PxHeight);
    _determineButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_determineButton setTitle:@"确定" forState:UIControlStateNormal];
    _determineButton.backgroundColor = Color_indigo;
    [self addSubview:_determineButton];
}


-(void)setUpdateTextString:(NSString *)updateTextString{
    _updateTextField.placeholder = updateTextString;
}

-(void)setCodeString:(NSString *)codeString{
    _backView.frame = CGRectMake(0, 20/PxHeight + 64, kScreenWidth, 134/PxHeight);
    _codeLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_oldtextLabel.frame) , [UILabel widthForString:@"验证码:" font:[UIFont systemFontOfSize:15.0]], 67/PxHeight) title:@"验证码:" tintColor:[UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [_backView addSubview:_codeLabel];
    
    _codeButton =[UIButton buttonWithType:UIButtonTypeCustom];
    _codeButton.frame = CGRectMake(kScreenWidth- 25/PxWidth -[UILabel widthForString:@"获取验证码" font:[UIFont systemFontOfSize:15.0]], CGRectGetMinY(_codeLabel.frame), [UILabel widthForString:@"获取验证码" font:[UIFont systemFontOfSize:15.0]], CGRectGetHeight(_codeLabel.frame));
    _codeButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_codeButton setTitleColor:Color_indigo forState:UIControlStateNormal];
    [_backView addSubview:_codeButton];
    
    _codeTextField =  [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_codeLabel.frame), CGRectGetMinY(_codeLabel.frame), kScreenWidth - CGRectGetWidth(_codeLabel.frame) - CGRectGetWidth(_codeButton.frame), CGRectGetHeight(_codeLabel.frame))];
    _codeTextField.placeholder = @"请输入验证码";
    [_backView addSubview:_codeTextField];
    
    _determineButton  =[UIButton buttonWithType:UIButtonTypeCustom];
    _determineButton.frame = CGRectMake(0, CGRectGetMaxY(_backView.frame) + 20/PxHeight, kScreenWidth , 55/PxHeight);
    _determineButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_determineButton setTitle:@"确定" forState:UIControlStateNormal];
    _determineButton.backgroundColor = Color_indigo;
    [self addSubview:_determineButton];
}

@end
