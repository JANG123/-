//
//  GoodsModel.h
//  莽山
//
//  Created by jang on 16/5/5.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic,strong)NSString *GoodsId;//	(商品Id)

@property (nonatomic,strong)NSString *GoodsStore;//	(库存)
@property (nonatomic,strong)NSString *UserId;// (所属用户Id)

@property (nonatomic,strong)NSString *GoodsSales;// (销量)

@property (nonatomic,strong)NSString *GoodsName;// 	(名称)

@property (nonatomic,strong)NSString *GoodsBrief;// (简介)

@property (nonatomic,strong)NSString *GoodsIntro;//	(详情)

@property (nonatomic,strong)NSString *GoodsWeight;//(数量)

@property (nonatomic,strong)NSString *GoodsWeigthUnit;//(单位)

@property (nonatomic,strong)NSString *ImagePath;//	(图片名)

@property (nonatomic,strong)NSString *GoodsOriginalPrice;//	(原价)

@property (nonatomic,strong)NSString *GoodsCurrentPrice;//	(现价)

@property (nonatomic,strong)NSString *ApplyShopsId;//	(店铺Id)

@property (nonatomic,strong)NSString *ShopName;//	(店铺名称)

@property (nonatomic,strong)NSString *ShopLogo;// 	(店铺logo)
@end
