//
//  EvaluationTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UIImageView *indexImageView1;
@property (nonatomic,strong)UIImageView *indexImageView2;
@property (nonatomic,strong)UIImageView *indexImageView3;
@property (nonatomic,strong)UIImageView *indexImageView4;
@property (nonatomic,strong)UIImageView *indexImageView5;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)UILabel *detailsLabel;
-(CGFloat)hightForCell;
@end
