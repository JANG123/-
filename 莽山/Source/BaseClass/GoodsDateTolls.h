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

@end
