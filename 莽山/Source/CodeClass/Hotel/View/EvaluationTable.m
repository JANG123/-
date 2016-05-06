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
    self.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.frame.size.height) style:UITableViewStylePlain];
    [self.tableView registerClass:[EvaluationImageTableViewCell class] forCellReuseIdentifier:@"EvaluationImageTableViewCell"];
    [self.tableView registerClass:[EvaluationTableViewCell class] forCellReuseIdentifier:@"EvaluationTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:_tableView];
    
    _hightArr = [NSMutableArray array];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_hightArr.count > indexPath.row) {
        return [_hightArr[indexPath.row] floatValue];
    }else {
    return 205/PxHeight;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 46/PxHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 67/PxHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        EvaluationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationTableViewCell"];
        }
        [_hightArr addObject: [NSString stringWithFormat:@"%f",[cell hightForCell]]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        EvaluationImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluationImageTableViewCell" forIndexPath:indexPath];
        if (cell==nil) {
            cell= [[EvaluationImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EvaluationImageTableViewCell"];
        }
        [_hightArr addObject: [NSString stringWithFormat:@"%f",[cell hightForCell]]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 46/PxHeight)];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel *textLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 0, 100/PxWidth, CGRectGetHeight(headView.frame)) title:@"用户评价" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [headView addSubview:textLabel];
    
    _scoreLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 0, 80/PxWidth, CGRectGetHeight(headView.frame)) title:@"4.5分" tintColor:Color_indigo textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [headView addSubview:_scoreLabel];

    _numLabel = [UILabel setFrame:CGRectMake(kScreenWidth - 125/PxWidth, 0, 100/PxWidth, CGRectGetHeight(headView.frame)) title:@"20条评价" tintColor:Color_back textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:15.0]];
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
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        lineLabel.backgroundColor = Color_back;
        [footButton addSubview:lineLabel];
        
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
    CGFloat hight = 46/PxHeight;
    for (NSInteger i = 0;i < 2; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        EvaluationTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        hight += [cell hightForCell];
    }
    return hight;
}

-(void)foodButtonAction:(id)sender{
    [self.delegate foodButtonAction:sender];
}

@end
