//
//  EvaluationHeadTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationHeadTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UILabel *txtLabel;
@property (nonatomic,strong)HCSStarRatingView *starRatingView;
@property (nonatomic,strong)UILabel *scoreLabel;
@property (nonatomic,strong)UILabel *highLabel1;
@property (nonatomic,strong)UILabel *highLabel2;
@property (nonatomic,strong)UILabel *highLabel3;
@property (nonatomic,strong)UILabel *highLabel4;
@property (nonatomic,strong)UILabel *lowLabel1;
@property (nonatomic,strong)UILabel *lowLabel2;

@property (strong, nonatomic) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *data;

-(CGFloat)hightForCell;

@end
