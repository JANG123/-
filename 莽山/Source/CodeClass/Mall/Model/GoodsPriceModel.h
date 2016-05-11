//
//  GoodsPriceModel.h
//  莽山
//
//  Created by jang on 16/5/6.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsPriceModel : NSObject
@property (nonatomic,strong)NSString *GoodsId;//商品Id

@property (nonatomic,strong)NSString *GoodsWeight;//数量

@property (nonatomic,strong)NSString *GoodsWeigthUnit;//单位

@property (nonatomic,strong)NSString *GoodsOriginalPrice;//原价

@property (nonatomic,strong)NSString *GoodsCurrentPrice;//现价

@property (nonatomic,strong)NSString *GoodsStore;//库存

@property (nonatomic,strong)NSString *GoodsSales;//销量
@end
