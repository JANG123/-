//
//  RoomTypeButton.h
//  莽山
//
//  Created by jang on 16/4/25.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomTypeButton : UIButton

@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *classLabel;
@property(nonatomic,strong)UILabel *bedLabel;
@property(nonatomic,strong)UILabel *payLabel;
@property(nonatomic,strong)UILabel *detailsLabel;


-(void)setTitleWithType:(NSString *)type Price:(NSString *)price Class:(NSString *)class Bed:(NSString *)bed Pay:(NSString *)pay Details:(NSString *)details;
@end
