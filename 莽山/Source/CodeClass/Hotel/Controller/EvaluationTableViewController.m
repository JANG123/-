//
//  EvaluationTableViewController.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationTableViewController.h"
#import "EvaluationTableViewCell.h"
#import "EvaluationImageTableViewCell.h"
#import "EvaluationHeadTableViewCell.h"
@interface EvaluationTableViewController ()

@end

@implementation EvaluationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[EvaluationImageTableViewCell class] forCellReuseIdentifier:@"EvaluationImageTableViewCell"];
    [self.tableView registerClass:[EvaluationTableViewCell class] forCellReuseIdentifier:@"EvaluationTableViewCell"];
    [self.tableView registerClass:[EvaluationHeadTableViewCell class] forCellReuseIdentifier:@"EvaluationHeadTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _hightdict = [NSMutableDictionary dictionary];
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
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row;
    if (_isAll) {
        row = indexPath.row-1;
    }else{
        row = indexPath.row;
    }
    
    if (indexPath.row == 0 && _isAll) {
        return 151/PxHeight;
    }
    else{
        if (_hightdict.count > row) {
            return [[_hightdict objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]] floatValue];
        }else {
            return 205/PxHeight;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && _isAll) {
        EvaluationHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationHeadTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationHeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationHeadTableViewCell"];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else{
    if (indexPath.row%2 == 0) {
        EvaluationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationTableViewCell"];
        }
        [_hightdict setValue:[NSString stringWithFormat:@"%f",[cell hightForCell]] forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        EvaluationImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationImageTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationImageTableViewCell"];
        }
        [_hightdict setValue:[NSString stringWithFormat:@"%f",[cell hightForCell]] forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    }
}

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
