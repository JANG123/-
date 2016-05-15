//
//  EvaluationTableViewController.h
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationTableViewController : UITableViewController
@property (nonatomic,assign)BOOL isAll;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *typeArr;
@end
