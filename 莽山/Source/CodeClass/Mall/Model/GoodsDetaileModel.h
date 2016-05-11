//
//  GoodsDetaileModel.h
//  莽山
//
//  Created by jang on 16/5/6.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GoodsPriceModel;
@interface GoodsDetaileModel : NSObject

@property (nonatomic,strong)NSString *GoodsId;//商品ID

@property (nonatomic,strong)GoodsPriceModel *GoodsPrice;//商品价格规格

@property (nonatomic,strong)NSArray *ImageDetails;//商品图片

@property (nonatomic,strong)NSArray *GoodsSp;//商品海报

@property (nonatomic,strong)NSArray *GoodsParameters;//商品参数

@property (nonatomic,strong)NSString *GoodsName;//商品名称

@property (nonatomic,strong)NSString *GoodsBrief;//简介

@property (nonatomic,strong)NSString *GoodsIntro;//商品详情

@property (nonatomic,strong)NSString *IsLove;//(是否收藏)

@property (nonatomic,strong)NSString *ApplyShopsId;//店铺Id

@property (nonatomic,strong)NSString *ShopName;//店铺名称

@property (nonatomic,strong)NSString *ShopLogo;//店铺logo

@property (nonatomic,strong)NSString *ShopAddress;//(店铺地址)

@property (nonatomic,strong)NSString *BusinessHours;//(营业时间)


@end
