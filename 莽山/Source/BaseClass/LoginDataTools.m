//
//  LoginDataTools.m
//  莽山
//
//  Created by jang on 16/5/4.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "LoginDataTools.h"
static LoginDataTools *lData;
@implementation LoginDataTools

+(LoginDataTools *)shareGetLoginDate{
    static dispatch_once_t once_token;
    if (lData == nil) {
        dispatch_once(&once_token, ^{
            lData = [[LoginDataTools alloc]init];
        });
    }
    return lData;
}

//注册
-(void)RegisterWithLoginId:(NSString *)loginId LoginPwd:(NSString *)loginPwd Ip:(NSString *)ip WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@&LoginPwd=%@&Ip=%@",URL_api,URL_Register,loginId,loginPwd,ip];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//获取注册验证码
-(void)RegisterGetCodeWithLoginId:(NSString *)LoginId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@",URL_api,URL_RegisterGetCode,LoginId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _code = [[dict objectForKey:@"View"] objectForKey:@"Code"];
            NSLog(@"%@",_code);
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//用户登录
-(void)LoginWithLoginId:(NSString *)loginId LoginPwd:(NSString *)loginPwd Ip:(NSString *)ip WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
     NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@&LoginPwd=%@&Ip=%@",URL_api,URL_Login,loginId,loginPwd,ip];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _userModel = [UserInfoModel mj_objectWithKeyValues:[dict objectForKey:@"View"]];
            
            [UserAccount SetUserAccout:loginId PassWord:loginPwd];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//找回密码
-(void)ResetPwdWithLoginId:(NSString *)loginId
                  LoginPwd:(NSString *)loginPwd
                        Ip:(NSString *)ip
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@&LoginPwd=%@&Ip=%@",URL_api,URL_ResetPwd,loginId,loginPwd,ip];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
    
            [UserAccount SetUserAccout:loginId PassWord:loginPwd];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

-(void)ResetPwdGetCodeLoginId:(NSString *)LoginId
         WithReturnValeuBlock: (ReturnValueBlock) block
             WithFailureBlock: (FailureBlock) failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@",URL_api,URL_ResetPwdGetCode,LoginId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _code = [[dict objectForKey:@"View"] objectForKey:@"Code"];
            NSLog(@"%@",_code);
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//修改密码
-(void)EditPwdWithLoginId:(NSString *)loginId LoginPwd:(NSString *)loginPwd Ip:(NSString *)ip WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@&LoginPwd=%@&Ip=%@&Md5Code=%@",URL_api,URL_EditPwd,loginId,loginPwd,ip,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            
            [UserAccount SetUserAccout:loginId PassWord:loginPwd];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//绑定获取验证码
-(void)EditPhoneGetCodeWithLoginId:(NSString *)LoginId UserId:(NSString *)UserId Md5Code:(NSString *)Md5Code WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@&UserId=%@&Md5Code=%@",URL_api,URL_EditPhoneGetCode,LoginId,UserId,Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _code = [[dict objectForKey:@"View"] objectForKey:@"Code"];
            NSLog(@"%@",_code);
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//修改密码验证码
-(void)EditDataGetCodeWithLoginId:(NSString *)LoginId DataType:(NSString *)DataType Md5Code:(NSString *)Md5Code WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?LoginId=%@&DataType=%@&Md5Code=%@",URL_api,URL_EditDataGetCode,LoginId,DataType,Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _code = [[dict objectForKey:@"View"] objectForKey:@"Code"];
            NSLog(@"%@",_code);
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//修改邮箱
-(void)EditEmailWithUserId:(NSString *)UserId Email:(NSString *)Email WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Email=%@&Md5Code=%@&",URL_api,URL_EditEmail,UserId,Email,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//修改手机
-(void)EditPhoneWithUserId:(NSString *)UserId Phone:(NSString *)Phone WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Phone=%@&Md5Code=%@&",URL_api,URL_EditPhone,UserId,Phone,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//修改生日
-(void)EditBirthdayWithUserId:(NSString *)UserId Birthday:(NSString *)Birthday WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Birthday=%@&Md5Code=%@&",URL_api,URL_EditBirthday,UserId,Birthday,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//修改头像
-(void)EditUserPhotoWithUserId:(NSString *)UserId ImagePath:(NSString *)ImagePath WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&ImagePath=%@&Md5Code=%@&",URL_api,URL_EditUserPhoto,UserId,ImagePath,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//我关注的商品
-(void)MyFavouriteWithUserId:(NSString *)UserId Md5Code:(NSString *)Md5Code pageIndex:(NSInteger)pageIndex WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&pageSize=%ld",URL_api,URL_MyFavourite,UserId,_userModel.Md5Code,pageIndex];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            NSArray *dataArr = [dict objectForKey:@"Items"];
            for (NSDictionary *d in dataArr) {
                MyFavouriteModel *aMyFavourite = [MyFavouriteModel mj_objectWithKeyValues:d];
                [tempArr addObject:aMyFavourite];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


//商品取消关注
-(void)FavouriteDeleteWithFavoId:(NSString *)FavoId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&FavoId=%@&",URL_api,URL_FavouriteDelete,_userModel.UserId,_userModel.Md5Code,FavoId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


//收藏/取消收藏商品
-(void)CollectionGoodsWithGoodsId:(NSString *)GoodsId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&GoodsId=%@&",URL_api,URL_CollectionGoods,_userModel.UserId,_userModel.Md5Code,GoodsId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}



//我的关注店铺
-(void)MyShopsWithpageIndex:(NSInteger)pageIndex WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&pageSize=%ld",URL_api,URL_MyShops,_userModel.UserId,_userModel.Md5Code,pageIndex];
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            NSArray *dataArr = [dict objectForKey:@"Items"];
            for (NSDictionary *d in dataArr) {
                MyShopModel *aMyShop = [MyShopModel mj_objectWithKeyValues:d];
                [tempArr addObject:aMyShop];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
    
}

//取消/收藏店铺
-(void)LoveShopNoWithShopId:(NSString *)ShopId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&ShopId=%@&",URL_api,URL_LoveShopNo,_userModel.UserId,_userModel.Md5Code,ShopId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


//刷新
-(void)RenovateUserWithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@",URL_api,URL_RenovateUser,_userModel.UserId,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _userModel = [UserInfoModel mj_objectWithKeyValues:[dict objectForKey:@"View"]];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//订单查询
-(void)UserOrderAllWithOrderStatus:(NSString *)OrderStatus pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize ReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&OrderStatus=%@&pageIndex=%ld&pageSize=%ld",URL_api,URL_UserOrderAll,_userModel.UserId,_userModel.Md5Code,OrderStatus,pageIndex,pageSize];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        NSMutableArray *tempArr = [NSMutableArray array];
        if ([ReturnValue isEqualToString:@"0"]) {
            for (NSDictionary *d in [dict objectForKey:@"Items"] ) {
                OrderModel *aOrder = [OrderModel mj_objectWithKeyValues:d];
                [tempArr addObject:aOrder];
            }
        }
        block(tempArr);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


//取消订单
-(void)CloseOrderWithOrderId:(NSString *)OrderId ReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&OrderId=%@",URL_api,URL_CloseOrder,_userModel.UserId,_userModel.Md5Code,OrderId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _userModel = [UserInfoModel mj_objectWithKeyValues:[dict objectForKey:@"View"]];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//删除订单
-(void)DeleteOrderWithOrderId:(NSString *)OrderId ReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&OrderId=%@",URL_api,URL_DeleteOrder,_userModel.UserId,_userModel.Md5Code,OrderId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _userModel = [UserInfoModel mj_objectWithKeyValues:[dict objectForKey:@"View"]];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//确认收货
-(void)TakeDeliveryWithOrderId:(NSString *)OrderId ReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&OrderId=%@",URL_api,URL_TakeDelivery,_userModel.UserId,_userModel.Md5Code,OrderId];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            _userModel = [UserInfoModel mj_objectWithKeyValues:[dict objectForKey:@"View"]];
        }
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}


@end
