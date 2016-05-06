//
//  DetailsTableViewController.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "DetailsTableViewCell.h"
#import "StoreViewController.h"
#import "GoodViewController.h"
@interface DetailsTableViewController ()

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"休闲";
    
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;

    UIButton *rightButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButton addTarget:self action:@selector(rightBar) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.tableView registerClass:[DetailsTableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBar{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 417/PxHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 58/PxHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 58/PxHeight)];
    cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cityButton.frame = CGRectMake(0, 0, kScreenWidth/3, CGRectGetHeight(view.frame));
    cityButton.backgroundColor = [UIColor whiteColor];
    cityLabel = [UILabel setFrame:CGRectMake(0, 19/PxHeight, kScreenWidth/3, 20/PxHeight) title:@"全城" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [cityButton addSubview:cityLabel];
    UIImageView *cityImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/6 + 30/PxWidth, CGRectGetMinY(cityLabel.frame) + 5/PxHeight, 15/PxWidth, 15/PxWidth)];
    cityImage.image = [UIImage imageNamed:@"休闲_下拉"];
    [cityButton addSubview:cityImage];
    [view addSubview:cityButton];
    
    smartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    smartButton.frame = CGRectMake(CGRectGetMaxX(cityButton.frame), 0, kScreenWidth/3, CGRectGetHeight(view.frame));
    smartButton.backgroundColor = [UIColor whiteColor];
    smartLabel = [UILabel setFrame:CGRectMake(0, 19/PxHeight, kScreenWidth/3, 20/PxHeight) title:@"智能" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [smartButton addSubview:smartLabel];

    UIImageView *smartImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/6 + 30/PxWidth, CGRectGetMinY(cityLabel.frame) + 5/PxHeight, 15/PxWidth, 15/PxWidth)];
    smartImage.image = [UIImage imageNamed:@"休闲_下拉"];
    [smartButton addSubview:smartImage];
    [view addSubview:smartButton];
    
    screeningButton = [UIButton buttonWithType:UIButtonTypeCustom];
    screeningButton.frame = CGRectMake(CGRectGetMaxX(smartButton.frame), 0, kScreenWidth/3, CGRectGetHeight(view.frame));
    screeningButton.backgroundColor = [UIColor whiteColor];
    screeningLabel = [UILabel setFrame:CGRectMake(0, 19/PxHeight, kScreenWidth/3, 20/PxHeight) title:@"筛选" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:17.0]];
    [screeningButton addSubview:screeningLabel];
    
    UIImageView *screeningImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/6 + 30/PxWidth, CGRectGetMinY(cityLabel.frame) + 5/PxHeight, 15/PxWidth, 15/PxWidth)];
    screeningImage.image = [UIImage imageNamed:@"休闲_下拉"];
    [screeningButton addSubview:screeningImage];
    [view addSubview:screeningButton];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.storeImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(storeAction)];
    [cell.storeImageView addGestureRecognizer:singleTap1];
    // Configure the cell...
    
    return cell;
}
-(void)storeAction{
    StoreViewController *sv = [[StoreViewController alloc]init];
    [self.navigationController pushViewController:sv animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

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
