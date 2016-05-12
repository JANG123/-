//
//  MainViewController.m
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <XTPageViewControllerDataSource> {
    NSInteger _numberOfPages;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _numberOfPages = 4;
}

-(void)viewWillAppear:(BOOL)animated{
    //page controllers管理器
    XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
    pageViewController.typeString = @"首页";
    pageViewController.dataSource = self;
    pageViewController.index = 0;
    [self.navigationController pushViewController:pageViewController animated:NO];
    
    if (![[UserAccount UserName] isEqualToString:@"0"]) {
        [[LoginDataTools shareGetLoginDate]LoginWithLoginId:[UserAccount UserName] LoginPwd:[UserAccount PassWord] Ip:[NetWorkTolls getIPAddress] WithReturnValeuBlock:^(id code) {
            NSString *returnValeu = [NSString stringWithFormat:@"%@",code];
            if (![returnValeu isEqualToString:@"0"]) {
                [self p_showAlertView:@"密码已修改，请重新登录" message:nil];
            }
        } WithFailureBlock:^(NSError *error) {
            
        }];
    }
}

//显示提示框
- (void)p_showAlertView:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    //    [UIView appearance].tintColor = Color_Alert;
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfPages {
    return _numberOfPages;
}

- (NSString*)titleOfPage:(NSInteger)page {
    NSString *titleStr = [NSString string];
    switch (page) {
        case 0:
            titleStr = @"生态商城";
            break;
        case 1:
            titleStr = @"生态农家";
            break;
        case 2:
            titleStr = @"生态酒店";
            break;
        case 3:
            titleStr = @"生态服务";
            break;
        default:
            break;
    }
    return titleStr;
}

- (UIViewController*)constrollerOfPage:(NSInteger)page {
    UIViewController *pageVC = [[UIViewController alloc]init];
    switch (page) {
        case 0:
        {
            MallTableViewController *mallVC = [[MallTableViewController alloc]init];
            pageVC = mallVC;
        }
            break;
        case 1:
        {
            FarmHouseTableViewController *fVC = [[FarmHouseTableViewController alloc]init];
            pageVC = fVC;
        }
            break;
        case 2:
        {
            HotelTableViewController *hotelVC = [[HotelTableViewController alloc]init];
            pageVC = hotelVC;
        }
            break;
        case 3:
        {
            ServiceViewController *sVC = [[ServiceViewController alloc]init];
            pageVC = sVC;
        }
            break;
        default:
            break;
    }
    return pageVC;
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
