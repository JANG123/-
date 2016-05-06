//
//  UITableView+ExtraCell.m
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UITableView+ExtraCell.h"

@implementation UITableView (ExtraCell)

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

@end
