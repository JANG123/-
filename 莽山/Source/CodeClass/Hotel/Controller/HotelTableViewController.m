//
//  HotelTableViewController.m
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "HotelTableViewController.h"
#import "HoteTableViewCell.h"
#import "ClassViewController.h"
#import "HotelViewController.h"
@interface HotelTableViewController ()
@property (nonatomic,strong)UIButton *dateButton;
@property (nonatomic,strong)UIButton *searchButton;
@end

@implementation HotelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HoteTableViewCell class] forCellReuseIdentifier:@"HoteTableViewCell"];
    [self p_addButton];
    self.view.backgroundColor = Color_back;
}

-(void)p_addButton{
    
    _dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dateButton.frame = CGRectMake(155/PxWidth, kScreenHeight - 120/PxHeight - K_rectNav - K_rectStatus, 60/PxHeight, 60/PxHeight);
    [_dateButton setImage:[UIImage imageNamed:@"日期"] forState:UIControlStateNormal];
    [_dateButton addTarget:self action:@selector(dateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dateButton];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.frame = CGRectMake(CGRectGetMaxX(_dateButton.frame) + 112/PxWidth, CGRectGetMinY(_dateButton.frame), 60/PxHeight, 60/PxHeight);
    [_searchButton setImage:[UIImage imageNamed:@"分类"] forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(searchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
}

-(void)dateButtonAction:(UIButton *)sender{
    ZFChooseTimeViewController * vc =[ZFChooseTimeViewController new];
    
    [vc backDate:^(NSArray *goDate, NSArray *backDate) {
        
        NSString *time = [NSString stringWithFormat:@"%@ : %@",[goDate componentsJoinedByString:@"-"],[backDate componentsJoinedByString:@"-"]];
        NSLog(@"%@",time);
        
    }];
    
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)searchButtonAction:(UIButton *)sender{

    ClassViewController *cv =[ClassViewController new];
    [self presentViewController:cv animated:YES completion:nil];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        _dateButton.frame = CGRectMake(155/PxWidth, kScreenHeight - 120/PxHeight - K_rectNav - K_rectStatus + offsetY, 60/PxHeight, 60/PxHeight);
        _searchButton.frame = CGRectMake(CGRectGetMaxX(_dateButton.frame) + 112/PxWidth, CGRectGetMinY(_dateButton.frame), 60/PxHeight, 60/PxHeight);
    }else{
        _dateButton.frame = CGRectMake(155/PxWidth, kScreenHeight - 120/PxHeight - K_rectNav - K_rectStatus, 60/PxHeight, 60/PxHeight);
        _searchButton.frame = CGRectMake(CGRectGetMaxX(_dateButton.frame) + 112/PxWidth, CGRectGetMinY(_dateButton.frame), 60/PxHeight, 60/PxHeight);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230/PxHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HoteTableViewCell" forIndexPath:indexPath];
    if(!cell) {
        cell = [[HoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HoteTableViewCell"];
    }
    NSString *imageStr = [NSString stringWithFormat:@"%ldh",indexPath.row +1];
    UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-50, 0, kScreenWidth, 230/PxHeight)];
    goodImageView.image = [UIImage imageNamed:imageStr];
    [cell setBackgroundView:goodImageView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.tuijianImageView.hidden = NO;
    }else{
        cell.tuijianImageView.hidden = YES;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotelViewController *hv = [[HotelViewController alloc]init];
    [self.navigationController pushViewController:hv animated:YES];
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
