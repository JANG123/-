//
//  RegiestViewController.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "RegiestViewController.h"
#import "RegisetView.h"
@interface RegiestViewController ()
@property (nonatomic,strong)RegisetView *rv;
@property (nonatomic,strong)NSString *loginIDStr;
@property (nonatomic,strong)NSString *codeStr;
@property (nonatomic,strong)NSString *passWordStr;

@end

@implementation RegiestViewController


-(void)loadView{
    self.rv = [[RegisetView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _rv;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [_rv.liftButton addTarget:self action:@selector(liftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_rv.codeButton addTarget:self action:@selector(codeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_rv.regisetButton addTarget:self action:@selector(regisetButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)liftButtonAction:(UIButton *)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)codeButtonAction:(UIButton *)sender{
    NSString *loginID = [NSString stringWithFormat:@"%@",_rv.userTextField.text];
    if ([loginID isEqualToString:@""]) {
        [self p_showAlertView:@"用户名为空" message:nil];
    }else{
        [[LoginDataTools shareGetLoginDate]RegisterGetCodeWithLoginId:loginID WithReturnValeuBlock:^(id code) {
            NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
            if ([returnValeu isEqualToString:@"1"]) {
                [self p_showAlertView:@"用户已存在" message:nil];
            }else if ([returnValeu isEqualToString:@"0"]) {
                [self p_showAlertView:@"验证码发送成功" message:nil];
            }
        } WithFailureBlock:^(NSError *error) {
            [self p_showAlertView:@"当前网络不稳定" message:nil];
        }];
    }
}

-(void)regisetButtonAction:(UIButton *)sender{
    NSString *loginID = [NSString stringWithFormat:@"%@",_rv.userTextField.text];
    NSString *code = [NSString stringWithFormat:@"%@",_rv.codeTextField.text];
    NSString *passWord = [NSString stringWithFormat:@"%@",_rv.passWordTextField.text];
    NSString *ip = [NetWorkTolls getIPAddress];
    if ([loginID isEqualToString:@""]) {
        [self p_showAlertView:@"用户名为空" message:nil];
    }else if ([code isEqualToString:@""]){
        [self p_showAlertView:@"验证码为空" message:nil];
    }else if ([passWord isEqualToString:@""]){
        [self p_showAlertView:@"密码为空" message:nil];
    }else if (passWord.length < 6 || passWord.length >20){
        [self p_showAlertView:@"密码请为6-20位" message:nil];
    }else{
        if ([[LoginDataTools shareGetLoginDate].code isEqualToString:code]) {
            [[LoginDataTools shareGetLoginDate]RegisterWithLoginId:loginID LoginPwd:passWord Ip:ip WithReturnValeuBlock:^(id code) {
                NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
                if ([returnValeu isEqualToString:@"0"]) {
                    [self p_showAlertView:@"注册成功" message:nil];
                    _rBlock(loginID,passWord);
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                }else if ([returnValeu isEqualToString:@"20000"]){
                    [self p_showAlertView:@"用户已存在" message:nil];
                }
                [LoginDataTools shareGetLoginDate].code = @"";
            } WithFailureBlock:^(NSError *error) {
                [self p_showAlertView:@"当前网络不稳定" message:nil];
            }];
        }else{
            [self p_showAlertView:@"验证码错误" message:nil];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
