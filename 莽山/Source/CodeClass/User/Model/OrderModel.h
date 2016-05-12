//
//  OrderModel.h
//  莽山
//
//  Created by jang on 16/5/11.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
//订单信息
@interface OrderModel : NSObject
@property (nonatomic,strong)NSString *OrderId;
@property (nonatomic,strong)NSString *CreateTime;
@property (nonatomic,strong)NSString *TotalPrice;
@property (nonatomic,strong)NSString *OrderStatus;
@property (nonatomic,strong)NSString *OrderNumber;
@property (nonatomic,strong)NSString *ApplyShopsId;
@property (nonatomic,strong)NSString *EcologicalId;
@property (nonatomic,strong)NSString *OrderName;
@property (nonatomic,strong)NSString *ShopName;
@property (nonatomic,strong)NSString *ImagesPath;
@property (nonatomic,strong)NSString *GoodsId;
@property (nonatomic,strong)NSString *HotelId;
@end
