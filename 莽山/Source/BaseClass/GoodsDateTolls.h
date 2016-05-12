//
//  MallDateTolls.h
//  莽山
//
//  Created by jang on 16/5/4.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface GoodsDateTolls : NSObject

+(GoodsDateTolls *)shareGetGoodsDate;

//查询总店全部分区
-(void)GetPartitionAllWithEcologicalId:(NSString *)EcologicalId
                  WithReturnValeuBlock:(ReturnValueBlock) block
                      WithFailureBlock:(FailureBlock) failureBlock;
//商品列表查询
-(void)ListGoodsWithName:(NSString *)Name
               OrderName:(NSString *)OrderName
                  TypeId:(NSString *)TypeId
               pageIndex:(NSString *)pageIndex
                pageSize:(NSString *)pageSize
                  ShopId:(NSString *)ShopId
            EcologicalId:(NSString *)EcologicalId
             PartitionId:(NSString *)PartitionId
    WithReturnValeuBlock:(ReturnValueBlock) block
        WithFailureBlock:(FailureBlock) failureBlock;

//商品列表查询
-(void)GoodsDetailWithGoodsId:(NSString *)GoodsId
                     UserId:(NSString *)UserId
    WithReturnValeuBlock:(ReturnValueBlock) block
        WithFailureBlock:(FailureBlock) failureBlock;

//推荐商品查询
-(void)RecommendGoodsWithShopId:(NSString *)ShopId
                      pageIndex:(NSInteger)pageIndex
                       pageSize:(NSInteger)pageSize
            WithReturnValeuBlock:(ReturnValueBlock) block
                WithFailureBlock:(FailureBlock) failureBlock;

//根据店铺或商品名称查店铺
-(void)GetShopByNameWithName:(NSString *)Name
                      pageIndex:(NSInteger)pageIndex
                       pageSize:(NSInteger)pageSize
           WithReturnValeuBlock:(ReturnValueBlock) block
               WithFailureBlock:(FailureBlock) failureBlock;

//酒店或农家首页
-(void)GetShopListWithEcologicalId:(NSString *)EcologicalId
                         pageIndex:(NSInteger)pageIndex
                          pageSize:(NSInteger)pageSize
              WithReturnValeuBlock:(ReturnValueBlock) block
                  WithFailureBlock:(FailureBlock) failureBlock;

@end
