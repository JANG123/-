//
//  LoginViewController.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegiestViewController.h"
@interface LoginViewController ()
@property (nonatomic,strong)LoginView *lv;
@property (nonatomic,strong)MBProgressHUD *hud;
@end

@implementation LoginViewController

-(void)loadView{
    self.lv = [[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _lv;
    
}

- (void)p_setupProgressHud
{
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    _hud.frame = self.view.bounds;
    _hud.minSize = CGSizeMake(100, 100);
    _hud.mode = MBProgressHUDModeIndeterminate;
    [self.view addSubview:_hud];
    
    [_hud show:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_lv.downButton addTarget:self action:@selector(downButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_lv.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_lv.regiestButton addTarget:self action:@selector(regiestButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)downButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)regiestButtonAction:(UIButton *)sender{
    RegiestViewController *regiestVC = [[RegiestViewController alloc]init];
    //[self p_setupProgressHud];
    regiestVC.rBlock= ^(NSString *userName,NSString *passWord)
    {
        _lv.userTextField.text = userName;
        _lv.passWordTextField.text = passWord;
        
    };
    [self presentViewController:regiestVC animated:YES completion:nil];
}

-(void)loginButtonAction:(UIButton *)sender{
    NSString *loginID = [NSString stringWithFormat:@"%@",_lv.userTextField.text];
    NSString *passWord = [NSString stringWithFormat:@"%@",_lv.passWordTextField.text];
    NSString *ip = [NetWorkTolls getIPAddress];
    if ([loginID isEqualToString:@""]) {
        [self p_showAlertView:@"用户名为空" message:nil];
    }else if ([passWord isEqualToString:@""]){
        [self p_showAlertView:@"密码为空" message:nil];
    }else{
    [[LoginDataTools shareGetLoginDate]LoginWithLoginId:loginID LoginPwd:passWord Ip:ip WithReturnValeuBlock:^(id code) {
        NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
        if ([returnValeu isEqualToString:@"0"]) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }else if ([returnValeu isEqualToString:@"1001"]){
            [self p_showAlertView:@"密码错误" message:nil];
        }

    } WithFailureBlock:^(NSError *error) {
        [self p_showAlertView:@"当前网络不稳定" message:nil];
    }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
