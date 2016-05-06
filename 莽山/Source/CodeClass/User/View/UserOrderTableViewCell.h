//
//  UserOrderTableViewCell.h
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderButton;
@interface UserOrderTableViewCell : UITableViewCell
@property (nonatomic,strong)OrderButton *paymentButton;
@property (nonatomic,strong)OrderButton *goodsButton;
@property (nonatomic,strong)OrderButton *evaluationButton;
@property (nonatomic,strong)OrderButton *refundButton;
@end
