//
//  StoreViewController.h
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreViewController : UIViewController{
    BOOL isSelected;
    BOOL didAddSperateVerticalLine;
    CGRect rectStatus;
    CGRect rectNav;
    CGFloat contentOffsetY;
    NSInteger _numberOfPages;

}
@property (nonatomic,strong)SDCycleScrollView *mainCycleScrollView;
@property (nonatomic,strong)EvaluationTable *evaluationTableView;
@end
