//
//  EvaluationImageTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationImageTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UIImageView *indexImageView1;
@property (nonatomic,strong)UIImageView *indexImageView2;
@property (nonatomic,strong)UIImageView *indexImageView3;
@property (nonatomic,strong)UIImageView *indexImageView4;
@property (nonatomic,strong)UIImageView *indexImageView5;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)UILabel *detailsLabel;
@property (nonatomic,strong)UIImageView *detailsImageView1;
@property (nonatomic,strong)UIImageView *detailsImageView2;
@property (nonatomic,strong)UIImageView *detailsImageView3;

-(CGFloat)hightForCell;
@end
