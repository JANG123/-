//
//  UserOrderTableViewController.h
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UserOrderTableDelegate <NSObject>

//-(void)rightBarAction:(UIBarButtonItem *)sender;

@end
@interface UserOrderTableViewController : UITableViewController{
    UIButton *removeButton;
}
@property (nonatomic,weak)id <UserOrderTableDelegate>delegate;

//删除选中的cell
@property (nonatomic,strong) NSMutableArray *selectedDic;

//状态标示  0 查全部 1待付款 2待收货 3待评价
@property (nonatomic,assign)NSInteger index;

//改变编辑状态
-(void)rightBarAction;
@end
