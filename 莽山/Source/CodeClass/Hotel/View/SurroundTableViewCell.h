//
//  SurroundTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurroundTableViewCell : UITableViewCell

@property(nonatomic,strong)UIView *mapView;

@property(nonatomic,strong)UILabel *mapLabel;

@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *priceLabel;

@property(nonatomic,strong)UIImageView *logoView;

@property(nonatomic,strong)UIImageView *goodImageView;

-(void)setTextName:(NSString *)name title:(NSString *)title price:(NSString *)price map:(NSString *)map logoBool:(BOOL)logo;
@end
