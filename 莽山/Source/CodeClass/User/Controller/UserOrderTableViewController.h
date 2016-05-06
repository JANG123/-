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
@property (nonatomic,strong) NSMutableArray *selectedDic;
-(void)rightBarAction;
@end
