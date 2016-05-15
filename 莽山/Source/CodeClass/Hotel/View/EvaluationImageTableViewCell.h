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
@property (nonatomic,strong)HCSStarRatingView *starRatingView;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)UILabel *detailsLabel;
@property (nonatomic,strong)UIImageView *detailsImageView1;
@property (nonatomic,strong)UIImageView *detailsImageView2;
@property (nonatomic,strong)UIImageView *detailsImageView3;
@property (nonatomic,strong)UIImageView *detailsImageView4;
@property (nonatomic,strong)UIImageView *detailsImageView5;
@property (nonatomic,strong)UIImageView *detailsImageView6;

@property (nonatomic,strong)NSString *image1;
@property (nonatomic,strong)NSString *image2;
@property (nonatomic,strong)NSString *image3;
@property (nonatomic,strong)NSString *image4;
@property (nonatomic,strong)NSString *image5;
@property (nonatomic,strong)NSString *image6;

-(CGFloat)hightForCell:(BOOL)isImage;
@end
