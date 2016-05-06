//
//  MallDateTolls.m
//  莽山
//
//  Created by jang on 16/5/4.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "GoodsDateTolls.h"
static GoodsDateTolls *gData;
@implementation GoodsDateTolls

+(GoodsDateTolls *)shareGetGoodsDate{
    static dispatch_once_t once_token;
    if (gData == nil) {
        dispatch_once(&once_token, ^{
            gData = [[GoodsDateTolls alloc]init];
        });
    }
    return gData;
}

//查询总店全部分区
-(void)GetPartitionAllWithEcologicalId:(NSString *)EcologicalId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?EcologicalId=%@",URL_api,URL_GetPartitionAll,EcologicalId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            NSArray *PartitionIdArr = [dict objectForKey:@"Items"];
            for (NSDictionary *d in PartitionIdArr) {
                [self ListGoodsWithName:@"" OrderName:@"" TypeId:@"" pageIndex:@"" pageSize:@"5" ShopId:@"" EcologicalId:@"1" PartitionId:[d objectForKey:@"PartitionId"] WithReturnValeuBlock:^(id code) {
                    
                } WithFailureBlock:^(NSError *error) {
                    
                }];
            }
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//商品列表查询
-(void)ListGoodsWithName:(NSString *)Name OrderName:(NSString *)OrderName TypeId:(NSString *)TypeId pageIndex:(NSString *)pageIndex pageSize:(NSString *)pageSize ShopId:(NSString *)ShopId EcologicalId:(NSString *)EcologicalId PartitionId:(NSString *)PartitionId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?Name=%@&OrderName=%@&TypeId=%@&pageIndex=%@&pageSize=%@&ShopId=%@&EcologicalId=%@&PartitionId=%@",URL_api,URL_ListGoods,Name,OrderName,TypeId,pageIndex,pageSize,ShopId,EcologicalId,PartitionId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            NSArray *PartitionIdArr = [dict objectForKey:@"Items"];
            for (NSDictionary *d in PartitionIdArr) {
                GoodsModel *aGood = [GoodsModel mj_objectWithKeyValues:d];
                [tempArr addObject:aGood];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

@end
