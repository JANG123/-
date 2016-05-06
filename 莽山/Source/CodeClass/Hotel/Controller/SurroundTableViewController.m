//
//  SurroundTableViewController.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SurroundTableViewController.h"
#import "SurroundTableViewCell.h"
#import "SurroundHeadTableViewCell.h"
@interface SurroundTableViewController ()
@property(nonatomic,strong) UIImageView *headView;
@property(nonatomic,strong) UIButton *headButton1;
@property(nonatomic,strong) UIButton *headButton2;
@end

@implementation SurroundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[SurroundTableViewCell class] forCellReuseIdentifier:@"SurroundTableViewCell"];
    [self.tableView registerClass:[SurroundHeadTableViewCell class] forCellReuseIdentifier:@"SurroundHeadTableViewCell"];
    [self drawNav];
     _isSelect = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)drawNav{
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200/PxWidth, 46/PxHeight)];
    _headView.userInteractionEnabled = YES;
    _headView.image = [UIImage imageNamed:@"周边美食"];
    _headButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _headButton1.frame = CGRectMake(0, 0, 100/PxWidth, 46/PxHeight);
    [_headButton1 setTitle:@"周边美食" forState:UIControlStateNormal];
    _headButton1.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton1 addTarget:self action:@selector(headButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_headButton1];
    _headButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _headButton2.frame = CGRectMake(100/PxWidth, 0, 100/PxWidth, 46/PxHeight);
    [_headButton2 setTitle:@"周边环境" forState:UIControlStateNormal];
    _headButton2.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton2 setTitleColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_headButton2 addTarget:self action:@selector(headButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_headButton2];
    self.navigationItem.titleView=_headView;
    
    KFontColor_NavBlackColor
    [self.navigationController.navigationBar lt_reset];
}

-(void)headButtonAction:(UIButton *)sender{
    if ([sender isEqual:_headButton1]) {
        _isSelect = YES;
        _headView.image = [UIImage imageNamed:@"周边美食"];
        [_headButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_headButton2 setTitleColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] forState:UIControlStateNormal];
    }else{
         _isSelect = NO;
        _headView.image = [UIImage imageNamed:@"周边环境"];
        [_headButton1 setTitleColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_headButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 && _isSelect) {
        return 128/PxHeight;
    }
    return 230/PxHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && _isSelect) {
        SurroundHeadTableViewCell *cell=nil;
        if (cell==nil) {
            cell= [tableView dequeueReusableCellWithIdentifier:@"SurroundHeadTableViewCell" forIndexPath:indexPath];
        }else{
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
            }
        }
        [self p_addTarget:cell];
        return cell;
    }
    else{
        SurroundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SurroundTableViewCell" forIndexPath:indexPath];
        if(!cell) {
            cell = [[SurroundTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SurroundTableViewCell"];
        }
        NSString *imageStr = [NSString stringWithFormat:@"%ld%ld%ld",indexPath.row +1,indexPath.row +1,indexPath.row +1];
        UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-50, 0, kScreenWidth, 230/PxHeight)];
        goodImageView.image = [UIImage imageNamed:imageStr];
        [cell setBackgroundView:goodImageView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (_isSelect) {
            [cell setTextName:@"天天农家乐" title:@"天天农家乐" price:@"￥88/人" map:@"316m" logoBool:NO];
        }else{
            [cell setTextName:@"莽山森林公园" title:@"4A级风景区" price:@"可自助" map:@"333m" logoBool:YES];
        }
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)p_addTarget:(SurroundHeadTableViewCell *)cell{
    [cell.type1View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.type2View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.type3View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.type4View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)typeButtonAction:(UIButton *)sender{
    DetailsTableViewController *dv = [[DetailsTableViewController alloc]init];
    [self.navigationController pushViewController:dv animated:YES];
}


-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
