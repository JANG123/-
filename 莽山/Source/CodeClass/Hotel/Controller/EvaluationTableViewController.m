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
    [self.tableView setExtraCellLineHidden:self.tableView];
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
    
    if (_isAll) {
        if (_dataArr.count > 0) {
            NSMutableArray *arr = _dataArr[1];
            return arr.count  + 1;
        }else{
            return 0;
        }
    }else{
        if (_dataArr.count > 0) {
            NSMutableArray *arr = _dataArr[1];
            return arr.count ;
        }else{
            return 0;
        }
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isAll) {
        if (indexPath.row == 0 && _isAll) {
            return 151/PxHeight;
        }
        else{
            EvaluationModel *evaluation = _dataArr[1][indexPath.row - 1];
            if (evaluation.ImageDetailBean.count > 0) {
                return 265/PxHeight;
            }else{
                return 130/PxHeight;
            }
        }
    }else{
        EvaluationModel *evaluation = _dataArr[1][indexPath.row];
        if (evaluation.ImageDetailBean.count > 0) {
            return 265/PxHeight;
        }else{
            return 130/PxHeight;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && _isAll) {
        EvaluationHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationHeadTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationHeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationHeadTableViewCell"];
        }
        cell.scoreLabel.text = [NSString stringWithFormat:@"%@分",[_dataArr[0] objectForKey:@"Average"]];
        cell.starRatingView.value = [[_dataArr[0] objectForKey:@"Average"] floatValue];
        cell.data = _typeArr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else{
        EvaluationModel *evaluation;
        if (_isAll) {
            evaluation = _dataArr[1][indexPath.row - 1];
        }else{
            evaluation = _dataArr[1][indexPath.row];
        }
        
        
        EvaluationImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationImageTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationImageTableViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.nameLabel.text = evaluation.LoginId;
        cell.dateLabel.text = evaluation.CommentTime;
        
        cell.starRatingView.value = [evaluation.CommentScore intValue];
        
        cell.detailsLabel.text = evaluation.CommentConnent;
        
        for (int i = 0; i < evaluation.ImageDetailBean.count; i++) {
            switch (i) {
                case 0:
                    cell.image1 = [NSString stringWithFormat:@"%@%@",URL_f_b,evaluation.ImageDetailBean[i]];
                    break;
                case 1:
                    cell.image2 = [NSString stringWithFormat:@"%@%@",URL_f_b,evaluation.ImageDetailBean[i]];
                    break;
                case 2:
                    cell.image3 = [NSString stringWithFormat:@"%@%@",URL_f_b,evaluation.ImageDetailBean[i]];
                    break;
                case 3:
                    cell.image4 = [NSString stringWithFormat:@"%@%@",URL_f_b,evaluation.ImageDetailBean[i]];
                    break;
                case 4:
                    cell.image5 = [NSString stringWithFormat:@"%@%@",URL_f_b,evaluation.ImageDetailBean[i]];
                    break;
                case 5:
                    cell.image6 = [NSString stringWithFormat:@"%@%@",URL_f_b,evaluation.ImageDetailBean[i]];
                    break;
                    
                default:
                    break;
            }
        }
        return cell;
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
