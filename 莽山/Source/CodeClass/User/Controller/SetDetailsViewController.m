//
//  SetDetailsViewController.m
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SetDetailsViewController.h"
#import "SetPhoneView.h"
@interface SetDetailsViewController ()
@property (nonatomic,strong)SetPhoneView *sp;
@end

@implementation SetDetailsViewController

-(void)loadView{
    self.sp = [[SetPhoneView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    if ([_type isEqualToString:@"更换手机"]) {
        if ([LoginDataTools shareGetLoginDate].userModel.UserPhone != nil) {
            _sp.oldString = @"已绑定手机";
            _sp.oldtextString = [LoginDataTools shareGetLoginDate].userModel.UserPhone;
        }
        _sp.updateString = @"新手机号:";
        _sp.updateTextString = @"请输入新手机号";
    }
    if ([_type isEqualToString:@"修改密码"]) {
        _sp.oldString = @"账户:";
        _sp.oldtextString = [LoginDataTools shareGetLoginDate].userModel.LoginId;
        _sp.updateString2 = @"新密码:";
        _sp.updateTextString2 = @"请输入新密码";
        _sp.updateString = @"验证密码:";
        _sp.updateTextString = @"请再次输入密码";
    }
    if ([_type isEqualToString:@"认证邮箱"]) {
        if ([LoginDataTools shareGetLoginDate].userModel.UserEmail != nil) {
            _sp.oldString = @"已绑邮箱:";
            _sp.oldtextString = [LoginDataTools shareGetLoginDate].userModel.UserEmail;
        }
        _sp.updateString = @"新邮箱号:";
        _sp.updateTextString = @"请输入新邮箱号";
    }
    if ([_type isEqualToString:@"找回密码"]) {
        _sp.oldString = @"账户";
        _sp.oldtextString = [LoginDataTools shareGetLoginDate].userModel.LoginId;
        _sp.updateString = @"新密码:";
        _sp.updateTextString = @"请输入新密码";
    }

    self.view = _sp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = _type;
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [_sp.determineButton addTarget:self action:@selector(determineButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_sp.codeButton addTarget:self action:@selector(codeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)codeButtonAction:(UIButton *)sender{
    NSString *loginID = [LoginDataTools shareGetLoginDate].userModel.LoginId;
    NSString *md5 = [LoginDataTools shareGetLoginDate].userModel.Md5Code;
    
    if ([_type isEqualToString:@"更换手机"]) {
        [[LoginDataTools shareGetLoginDate]EditDataGetCodeWithLoginId:loginID DataType:@"Phone" Md5Code:md5 WithReturnValeuBlock:^(id code) {
            NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
            if ([returnValeu isEqualToString:@"0"]) {
                [self p_showAlertView:@"验证码发送成功" message:nil];
            }
        } WithFailureBlock:^(NSError *error) {
            [self p_showAlertView:@"当前网络不稳定" message:nil];
        }];
    }
    
    if ([_type isEqualToString:@"修改密码"]) {
        [[LoginDataTools shareGetLoginDate]EditDataGetCodeWithLoginId:loginID DataType:@"Pwd" Md5Code:md5 WithReturnValeuBlock:^(id code) {
            NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
            if ([returnValeu isEqualToString:@"0"]) {
                [self p_showAlertView:@"验证码发送成功" message:nil];
            }
        } WithFailureBlock:^(NSError *error) {
            [self p_showAlertView:@"当前网络不稳定" message:nil];
        }];
    }
    
    if ([_type isEqualToString:@"认证邮箱"]) {
        [[LoginDataTools shareGetLoginDate]EditDataGetCodeWithLoginId:loginID DataType:@"Email" Md5Code:md5 WithReturnValeuBlock:^(id code) {
            NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
            if ([returnValeu isEqualToString:@"0"]) {
                [self p_showAlertView:@"验证码发送成功" message:nil];
            }
        } WithFailureBlock:^(NSError *error) {
            [self p_showAlertView:@"当前网络不稳定" message:nil];
        }];
    }
    
    if ([_type isEqualToString:@"找回密码"]) {
    [[LoginDataTools shareGetLoginDate]ResetPwdGetCodeLoginId:loginID WithReturnValeuBlock:^(id code) {
            NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
            if ([returnValeu isEqualToString:@"0"]) {
                [self p_showAlertView:@"验证码发送成功" message:nil];
            }
    }WithFailureBlock:^(NSError *error) {
            [self p_showAlertView:@"当前网络不稳定" message:nil];
    }];
    }
}

-(void)determineButtonAction:(UIButton *)sender{
    NSString *loginID = [LoginDataTools shareGetLoginDate].userModel.LoginId;
    NSString *code = [NSString stringWithFormat:@"%@",_sp.codeTextField.text];
    NSString *passWord2 = [NSString stringWithFormat:@"%@",_sp.updateTextField2.text];
    NSString *passWord = [NSString stringWithFormat:@"%@",_sp.updateTextField.text];

    NSString *ip = [NetWorkTolls getIPAddress];
    
    if ([_type isEqualToString:@"更换手机"]) {
        if ([code isEqualToString:@""]){
            [self p_showAlertView:@"验证码为空" message:nil];
        }else if ([passWord isEqualToString:@""]){
            [self p_showAlertView:@"手机号为空" message:nil];
        }else{
            if ([[LoginDataTools shareGetLoginDate].code isEqualToString:code]) {
                [[LoginDataTools shareGetLoginDate]EditPhoneWithUserId:[LoginDataTools shareGetLoginDate].userModel.UserId Phone:passWord WithReturnValeuBlock:^(id code) {
                    
                    NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
                    if ([returnValeu isEqualToString:@"0"]) {
                        [self.navigationController popViewControllerAnimated:YES];
                        [UserAccount SetUserAccout:passWord PassWord:[UserAccount PassWord]];
                        [LoginDataTools shareGetLoginDate].code = @"";
                    }

                } WithFailureBlock:^(NSError *error) {
                    [self p_showAlertView:@"当前网络不稳定" message:nil];
                }];
                
            }else{
                [self p_showAlertView:@"验证码错误" message:nil];
            }
        }
    }
    if ([_type isEqualToString:@"修改密码"]) {
        if ([code isEqualToString:@""]){
            [self p_showAlertView:@"验证码为空" message:nil];
        }else if ([passWord isEqualToString:@""]){
            [self p_showAlertView:@"密码为空" message:nil];
        }else if (![passWord isEqualToString:passWord2]){
            [self p_showAlertView:@"两次密码输入不一致" message:nil];
        }else if (passWord.length < 6 || passWord.length >20){
            [self p_showAlertView:@"密码请为6-20位" message:nil];
        }else{
            if ([[LoginDataTools shareGetLoginDate].code isEqualToString:code]) {
                [[LoginDataTools shareGetLoginDate]EditPwdWithLoginId:loginID LoginPwd:passWord Ip:ip WithReturnValeuBlock:^(id code) {
                    NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
                    if ([returnValeu isEqualToString:@"0"]) {
                        [self.navigationController popToRootViewControllerAnimated:NO];
                        [UserAccount deleteUserAccount];
                        [LoginDataTools shareGetLoginDate].userModel = nil;
                        [LoginDataTools shareGetLoginDate].code = @"";
                        [self p_showAlertView:@"修改成功，请重新登录" message:nil];
                    }
                } WithFailureBlock:^(NSError *error) {
                    [self p_showAlertView:@"当前网络不稳定" message:nil];
                }];
                
            }else{
                [self p_showAlertView:@"验证码错误" message:nil];
            }
        }
    }
    if ([_type isEqualToString:@"认证邮箱"]) {
        if ([passWord isEqualToString:@""]){
            [self p_showAlertView:@"邮箱为空" message:nil];
        }else if ([code isEqualToString:@""]){
            [self p_showAlertView:@"验证码为空" message:nil];
        }else{
            if ([[LoginDataTools shareGetLoginDate].code isEqualToString:code]) {
               
                [[LoginDataTools shareGetLoginDate]EditEmailWithUserId:[LoginDataTools shareGetLoginDate].userModel.UserId Email:passWord WithReturnValeuBlock:^(id code) {
                    NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
                    if ([returnValeu isEqualToString:@"0"]) {
                        [LoginDataTools shareGetLoginDate].code = @"";
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                } WithFailureBlock:^(NSError *error) {
                    [self p_showAlertView:@"当前网络不稳定" message:nil];
                }];
                
            }else{
                [self p_showAlertView:@"验证码错误" message:nil];
            }
        }

    }
    if ([_type isEqualToString:@"找回密码"]) {
        if ([code isEqualToString:@""]){
            [self p_showAlertView:@"验证码为空" message:nil];
        }else if ([passWord isEqualToString:@""]){
            [self p_showAlertView:@"密码为空" message:nil];
        }else if ([passWord isEqualToString:[UserAccount PassWord]]){
            [self p_showAlertView:@"原密码不正确" message:nil];
        }else if (passWord.length < 6 || passWord.length >20){
            [self p_showAlertView:@"密码请为6-20位" message:nil];
        }else{
            if ([[LoginDataTools shareGetLoginDate].code isEqualToString:code]) {
                [[LoginDataTools shareGetLoginDate]ResetPwdWithLoginId:loginID LoginPwd:passWord Ip:ip WithReturnValeuBlock:^(id code) {
                    NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
                    if ([returnValeu isEqualToString:@"0"]) {
                        [self.navigationController popToRootViewControllerAnimated:NO];
                        [UserAccount deleteUserAccount];
                        [LoginDataTools shareGetLoginDate].userModel = nil;
                        [LoginDataTools shareGetLoginDate].code = @"";
                        [self p_showAlertView:@"修改成功，请重新登录" message:nil];
                    }
                } WithFailureBlock:^(NSError *error) {
                    [self p_showAlertView:@"当前网络不稳定" message:nil];
                }];
                
            }else{
                [self p_showAlertView:@"验证码错误" message:nil];
            }
        }
    }
}

//显示提示框
- (void)p_showAlertView:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [UIView appearance].tintColor = Color_indigo;
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
