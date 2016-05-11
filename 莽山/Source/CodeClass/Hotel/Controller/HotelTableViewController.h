//
//  HotelTableViewController.h
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelTableViewController : UITableViewController
/// 上一个cell的下标
@property (nonatomic, assign) long lastCellIndex;
/// tableview是否已经显示完毕
@property (nonatomic, assign) BOOL isApper;

@property (nonatomic, assign) CGFloat Offset;
@end
