//
//  OrderTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderUserTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *orderLabel;
@property (nonatomic,strong)UILabel *typeLabel;
@property (nonatomic,strong)UIImageView *orderImage;
@property (nonatomic,strong)UILabel *orderTitleLabel;
@property (nonatomic,strong)UILabel *orderNmuLabel;
@property (nonatomic,strong)UILabel *orderSumLabel;
@property (nonatomic,strong)UIButton *pingjiaButton;
@property (nonatomic,strong)UIButton *querenButton;
@property (nonatomic,strong)UIButton *zuijiaButton;
@property (nonatomic,strong)UIButton *buyButton;

-(void)addButton:(NSString *)type;
@end
