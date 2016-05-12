//
//  MyFavouriteModel.h
//  莽山
//
//  Created by jang on 16/5/5.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
//收藏商品
@interface MyFavouriteModel : NSObject
@property (nonatomic,strong)NSString *FavoId;
@property (nonatomic,strong)NSString *GoodsName;
@property (nonatomic,strong)NSString *GoodsId;
@property (nonatomic,strong)NSString *GoodsBrief;
@property (nonatomic,strong)NSString *GoodsStore;
@property (nonatomic,strong)NSString *GoodsPrice;
@property (nonatomic,strong)NSString *ImagePath;
@end
