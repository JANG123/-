//
//  CollectionTableViewController.h
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionTableViewController : UITableViewController{
    UIButton *removeButton;
}

//状态标示 
@property (nonatomic,strong)NSString *typeStr;

//删除选中的cell
@property (nonatomic,strong) NSMutableArray *selectedDic;

//收藏数据集合
@property (nonatomic,strong)NSMutableArray *dataArr;

//pageIndex值
@property (nonatomic,assign)NSInteger index;

-(void)rightBarAction;
@end
