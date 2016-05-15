//
//  EvaluationTable.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationTable.h"
#import "EvaluationTableViewCell.h"
#import "EvaluationImageTableViewCell.h"
@implementation EvaluationTable

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

-(void)p_setupView
{
    _hightArr = [NSMutableArray array];
    
    self.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.frame.size.height) style:UITableViewStylePlain];
    [self.tableView registerClass:[EvaluationImageTableViewCell class] forCellReuseIdentifier:@"EvaluationImageTableViewCell"];
    [self.tableView registerClass:[EvaluationTableViewCell class] forCellReuseIdentifier:@"EvaluationTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:_tableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_dataArr.count > 0) {
        return 2;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EvaluationModel *evaluation = _dataArr[1][indexPath.row];
    
    if (evaluation.ImageDetailBean.count > 0) {
        return 265/PxHeight;
    }else{
        return 130/PxHeight;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 46/PxHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 67/PxHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EvaluationModel *evaluation = _dataArr[1][indexPath.row];
    
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 46/PxHeight)];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel *textLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 0, 100/PxWidth, CGRectGetHeight(headView.frame)) title:@"用户评价" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [headView addSubview:textLabel];
    _scoreLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 0, 80/PxWidth, CGRectGetHeight(headView.frame)) title:[NSString stringWithFormat:@"%@分",[_dataArr[0] objectForKey:@"Average"]] tintColor:Color_indigo textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [headView addSubview:_scoreLabel];

    _numLabel = [UILabel setFrame:CGRectMake(kScreenWidth - 250/PxWidth, 0, 225/PxWidth, CGRectGetHeight(headView.frame)) title:[NSString stringWithFormat:@"%@条评价",[_dataArr[0] objectForKey:@"CommentCount"]] tintColor:Color_back textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:15.0]];
    [headView addSubview:_numLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(headView.frame) - 1, kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [headView addSubview:lineLabel];
    
    return headView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
        UIButton *footButton = [UIButton buttonWithType:UIButtonTypeCustom];
        footButton.frame = CGRectMake(0, 0, kScreenWidth, 67/PxHeight);
        footButton.backgroundColor = [UIColor whiteColor];
        [footButton setTitle:@"查看更多评论" forState:UIControlStateNormal];
        [footButton setTitleColor:Color_indigo forState:UIControlStateNormal];
        
        UILabel *lineLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(footButton.frame) - 1, kScreenWidth, 1)];
        lineLabel1.backgroundColor = Color_back;
        [footButton addSubview:lineLabel1];
        
        UIImageView *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 55/PxWidth, 20/PxHeight, 30/PxWidth, 30/PxWidth)];
        logoImage.image = [UIImage imageNamed:@"下一页"];
        [footButton addSubview:logoImage];
        
        [footButton addTarget:self action:@selector(foodButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        return footButton;
}

-(CGFloat)hightForTableView{
    CGFloat hight = 46/PxHeight + 67/PxHeight;
    for (NSInteger i = 0;i < 2; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        EvaluationImageTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        EvaluationModel *evaluation = _dataArr[1][indexPath.row];
        
        if (evaluation.ImageDetailBean.count > 0) {
            hight += [cell hightForCell:YES];
        }else{
            hight += [cell hightForCell:NO];
        }
    }
    return hight;
}

-(void)foodButtonAction:(id)sender{
    [self.delegate foodButtonAction:sender];
}

-(void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    [self.tableView reloadData];
}

@end
