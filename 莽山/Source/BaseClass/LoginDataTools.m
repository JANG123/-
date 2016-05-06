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

//我的关注
-(void)MyFavouriteWithUserId:(NSString *)UserId Md5Code:(NSString *)Md5Code WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    NSString *urlString = [NSString stringWithFormat:@"%@%@?UserId=%@&Md5Code=%@&",URL_api,URL_MyFavourite,UserId,_userModel.Md5Code];
    
    [AFNDataTools_JYT NetRequestGetWithUrl:urlString WithReturnValeuBlock:^(id code) {
        
        NSDictionary *dict = (NSDictionary *)code;
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        block(ReturnValue);
        
    } WithFailureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}

//取消关注
-(void)FavouriteDeleteWithUserId:(NSString *)UserId FavoId:(NSString *)FavoId Md5Code:(NSString *)Md5Code WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{

}










@end
