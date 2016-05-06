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
@property (nonatomic,strong)NSString *typeStr;
@property (nonatomic,strong) NSMutableArray *selectedDic;
-(void)rightBarAction;
@end
