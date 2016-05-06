//
//  SettingTableViewController.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "SetDetailsViewController.h"
@interface SettingTableViewController ()<IQActionSheetPickerViewDelegate>
@property (nonatomic,strong)UIButton *loginButton;
@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawNav];
}

-(void)drawNav{
    self.navigationItem.title = @"设置";
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self.tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"SettingTableViewCell"];
    
    [self.tableView setExtraCellLineHidden:self.tableView];
    self.tableView.backgroundColor = Color_back;
    self.tableView.scrollEnabled = NO;
    
    _loginButton  =[UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(0, 395/PxHeight, kScreenWidth , 55/PxHeight);
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    _loginButton.backgroundColor = Color_indigo;
    [self.tableView addSubview:_loginButton];
    [_loginButton setTitle:@"退出" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)loginButtonAction{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否退出登录？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        [UserAccount deleteUserAccount];
        [LoginDataTools shareGetLoginDate].userModel = nil;
    }];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [UIView appearance].tintColor = Color_indigo;
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [[LoginDataTools shareGetLoginDate]LoginWithLoginId:[UserAccount UserName] LoginPwd:[UserAccount PassWord] Ip:[NetWorkTolls getIPAddress] WithReturnValeuBlock:^(id code) {
        dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        });
        
    } WithFailureBlock:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 4;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingTableViewCell" forIndexPath:indexPath];
    cell.logoImageView.image = [UIImage imageNamed:[self tableCell:indexPath index:0]];
    cell.nameLabel.text = [self tableCell:indexPath index:1];
    
    if (indexPath.section == 1) {
        cell.cellLabel.text = [self tableCell:indexPath index:2];
        if (![[self tableCell:indexPath index:2] isEqualToString:@"添加"]) {
            if ([LoginDataTools shareGetLoginDate].userModel.UserBirthday.length > 9) {
                cell.cellString = [[LoginDataTools shareGetLoginDate].userModel.UserBirthday substringToIndex:10];
            }
        }
    }else{
    cell.cellLabel.text = [self tableCell:indexPath index:2];
    }
    
    if (indexPath.section == 0) {
        cell.cellButton.tag = 500 +indexPath.row;
        [cell.cellButton addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        cell.cellButton.tag = 500 + indexPath.section*10 +indexPath.row;
    [cell.cellButton addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventTouchUpInside]; 
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.userLabel.text = [LoginDataTools shareGetLoginDate].userModel.UserPhone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 67/PxHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 18/PxHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = Color_back;
    return view;
}

-(void)cellButtonAction:(UIButton *)sender{

    SetDetailsViewController *sdVC = [[SetDetailsViewController alloc]init];
    if (sender.tag %10 == 0) {
        sdVC.type = @"更换手机";
    }
    if (sender.tag %10 == 1) {
        sdVC.type = @"修改密码";
    }
    if (sender.tag %10 == 2) {
        sdVC.type = @"认证邮箱";
    }
    if (sender.tag %10 == 3) {
        sdVC.type = @"找回密码";
    }
    [self.navigationController pushViewController:sdVC animated:YES];
}

-(NSString *)tableCell:(NSIndexPath *)indexPath index:(NSInteger)index
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        if ([LoginDataTools shareGetLoginDate].userModel.UserPhone != nil) {
            
            if (index == 0 || index == 1) {
                return @"已绑定手机";
                
            }else{
                return @"更换";
            }
        }else{
            if (index == 0 || index == 1) {
                return @"绑定手机";
                
            }else{
                return @"绑定";
            }
        }
    }else if(indexPath.section == 0 && indexPath.row == 1){
        if (index == 0 || index == 1) {
            return @"登录密码";
        }else{
            return @"修改";
        }
    }else if (indexPath.section == 0 && indexPath.row == 2){
        if ([LoginDataTools shareGetLoginDate].userModel.UserEmail != nil) {
            if (index == 0 || index == 1) {
                return @"邮箱认证";
                
            }else{
                return @"更换";
            }
        }else{
            if (index == 0 || index == 1) {
                return @"邮箱认证";
            }else{
                return @"绑定";
            }
        }
    }else if (indexPath.section == 0 && indexPath.row == 3) {
        if (index == 0 || index == 1) {
            return @"找回密码";
        }else{
            return @"";
        }
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        if (index == 0 || index == 1) {
            return @"生日";
        }else{
            if ([LoginDataTools shareGetLoginDate].userModel.UserBirthday.length >0) {
                return [LoginDataTools shareGetLoginDate].userModel.UserBirthday;
            }else{
            return @"添加";
            }
        }
    }
    return @"";
}

-(void)datePickerAction:(UIButton *)sender{
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"Date Picker" delegate:self];

    [picker setActionSheetPickerStyle:IQActionSheetPickerStyleDatePicker];
    [picker show];
}

-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectTitles:(NSArray *)titles
{
    NSDate *date = (NSDate *)titles[0];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    [dateformatter stringFromDate:date];
    [[LoginDataTools shareGetLoginDate]EditBirthdayWithUserId:[LoginDataTools shareGetLoginDate].userModel.UserId Birthday:[dateformatter stringFromDate:date] WithReturnValeuBlock:^(id code) {
        [self p_showAlertView:@"修改成功" message:nil];
        [[LoginDataTools shareGetLoginDate]LoginWithLoginId:[UserAccount UserName] LoginPwd:[UserAccount PassWord] Ip:[NetWorkTolls getIPAddress] WithReturnValeuBlock:^(id code) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        } WithFailureBlock:^(NSError *error) {
            
        }];
    } WithFailureBlock:^(NSError *error) {
        [self p_showAlertView:@"当前网络不稳定" message:nil];
    }];
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
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
