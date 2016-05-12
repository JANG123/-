//
//  FarmHouseTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FarmHouseTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *nameLabel; //店铺名

@property(nonatomic,strong)UILabel *titleLabel; //店铺介绍

@property(nonatomic,strong)UILabel *priceLabel; //店铺价格

@property(nonatomic,strong)UIImageView *logoView;

@property(nonatomic,strong)UIImageView *goodImageView;
@end
