//
//  GoodViewController.h
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodViewController : UIViewController{
    CGRect rectStatus;
    CGRect rectNav;
    BOOL didAddSperateVerticalLine;
    BOOL isSelected;
    NSInteger _numberOfPages;
}
@property (nonatomic,strong)SDCycleScrollView *mainCycleScrollView;
@property (nonatomic,strong)EvaluationTable *evaluationTableView;
@end
