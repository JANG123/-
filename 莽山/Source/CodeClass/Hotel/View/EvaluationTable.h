//
//  EvaluationTable.h
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EvaluationTableDelegate <NSObject>

-(void)foodButtonAction:(id)sender;
@end

@interface EvaluationTable : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel *scoreLabel;
@property (nonatomic,strong)UILabel *numLabel;
@property (nonatomic,strong)NSMutableArray *hightArr;

@property (nonatomic,assign)BOOL type;

@property (nonatomic,weak)id <EvaluationTableDelegate>delegate;
-(CGFloat)hightForTableView;
@end
