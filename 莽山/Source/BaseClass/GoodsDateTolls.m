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
        NSArray *tempArr = [NSArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            tempArr = [dict objectForKey:@"Items"];
            block(tempArr);
        }else{
            block(tempArr);
        }
        
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

//商品详情查询
-(void)GoodsDetailWithGoodsId:(NSString *)GoodsId UserId:(NSString *)UserId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?GoodsId=%@&UserId=%@",URL_api,URL_GoodsDetail,GoodsId,UserId];
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        GoodsDetaileModel *aGoodsDetaile;
        if ([ReturnValue isEqualToString:@"0"]) {

            aGoodsDetaile= [GoodsDetaileModel mj_objectWithKeyValues:[dict objectForKey:@"View"]];
            GoodsPriceModel *aGoodsPrice = [GoodsPriceModel mj_objectWithKeyValues:[[dict objectForKey:@"View"] objectForKey:@"GoodsPrice"][0]];
            aGoodsDetaile.GoodsPrice = aGoodsPrice;
        }
        block(aGoodsDetaile);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


//推荐商品查询
-(void)RecommendGoodsWithShopId:(NSString *)ShopId pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize  WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?ShopId=%@&pageIndex=%ld&pageSize=%ld",URL_api,URL_RecommendGoods,ShopId,pageIndex,pageSize];
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            for (NSDictionary *d in [dict objectForKey:@"Items"] ) {
                GoodsModel *aGoods = [GoodsModel mj_objectWithKeyValues:d];
                [tempArr addObject:aGoods];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//根据店铺或商品名称查店铺
-(void)GetShopByNameWithName:(NSString *)Name pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?Name=%@&pageIndex=%ld&pageSize=%ld",URL_api,URL_GetShopByName,Name,pageIndex,pageSize];
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            for (NSDictionary *d in [dict objectForKey:@"Items"] ) {
                ShopModel *aShop = [ShopModel mj_objectWithKeyValues:d];
                [tempArr addObject:aShop];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//酒店或农家首页
-(void)GetShopListWithEcologicalId:(NSString *)EcologicalId pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?EcologicalId=%@&pageIndex=%ld&pageSize=%ld",URL_api,URL_GetShopList,EcologicalId,pageIndex,pageSize];
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            for (NSDictionary *d in [dict objectForKey:@"Items"] ) {
                FarmHouseModel *aFarmHouse = [FarmHouseModel mj_objectWithKeyValues:d];
                [tempArr addObject:aFarmHouse];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


@end
