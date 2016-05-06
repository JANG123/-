//
//  FarmHouseTableViewController.m
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "FarmHouseTableViewController.h"
#import "FarmHouseTableViewCell.h"
#import "FarmHouseViewController.h"
@interface FarmHouseTableViewController ()

@end

@implementation FarmHouseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FarmHouseTableViewCell class] forCellReuseIdentifier:@"FarmHouseTableViewCell"];
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
    FarmHouseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FarmHouseTableViewCell" forIndexPath:indexPath];
    if(!cell) {
        cell = [[FarmHouseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FarmHouseTableViewCell"];
    }
    NSString *imageStr = [NSString stringWithFormat:@"%ld%ld%ld",indexPath.row +1,indexPath.row +1,indexPath.row +1];
    UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-50, 0, kScreenWidth, 230/PxHeight)];
    goodImageView.image = [UIImage imageNamed:imageStr];
    [cell setBackgroundView:goodImageView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FarmHouseViewController *fv = [[FarmHouseViewController alloc]init];
    [self.navigationController pushViewController:fv animated:YES];
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
