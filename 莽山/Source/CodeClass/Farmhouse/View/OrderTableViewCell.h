//
//  OrderTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *foodImage;//菜品图

@property (nonatomic,strong)UILabel *foodLabel;//菜名

//推荐指数
@property (nonatomic,strong)UILabel *indexLabel;
@property (nonatomic,strong)UIImageView *indexImageView1;
@property (nonatomic,strong)UIImageView *indexImageView2;
@property (nonatomic,strong)UIImageView *indexImageView3;
@property (nonatomic,strong)UIImageView *indexImageView4;
@property (nonatomic,strong)UIImageView *indexImageView5;

@property (nonatomic,strong)UILabel *pirceLabel; //价格

@property (nonatomic,strong)UIButton *reductionButton;//减

@property (nonatomic,strong)UILabel *numLabel;//当前数量

@property (nonatomic,strong)UIButton *addButton;//加
@end
