//
//  LoginDataTools.h
//  莽山
//
//  Created by jang on 16/5/4.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginDataTools : NSObject

@property (nonatomic,strong)NSString *code;//验证码
@property (nonatomic,strong)UserInfoModel *userModel;//用户登录信息

+(LoginDataTools *)shareGetLoginDate;

//注册
-(void)RegisterWithLoginId:(NSString *)loginId
                  LoginPwd:(NSString *)loginPwd
                        Ip:(NSString *)ip
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock;

//获取注册验证码
-(void)RegisterGetCodeWithLoginId:(NSString *)LoginId
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock;


//用户登录
-(void)LoginWithLoginId:(NSString *)loginId
               LoginPwd:(NSString *)loginPwd
                     Ip:(NSString *)ip
   WithReturnValeuBlock: (ReturnValueBlock) block
       WithFailureBlock: (FailureBlock) failureBlock;

//找回密码
-(void)ResetPwdWithLoginId:(NSString *)loginId
                  LoginPwd:(NSString *)loginPwd
                        Ip:(NSString *)ip
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock;

//找回密码验证码
-(void)ResetPwdGetCodeLoginId:(NSString *)LoginId
         WithReturnValeuBlock: (ReturnValueBlock) block
             WithFailureBlock: (FailureBlock) failureBlock;


//修改密码
-(void)EditPwdWithLoginId:(NSString *)loginId
                  LoginPwd:(NSString *)loginPwd
                        Ip:(NSString *)ip
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock;

//修改资料验证码
-(void)EditDataGetCodeWithLoginId:(NSString *)LoginId
                         DataType:(NSString *)DataType
                          Md5Code:(NSString *)Md5Code
         WithReturnValeuBlock: (ReturnValueBlock) block
             WithFailureBlock: (FailureBlock) failureBlock;

//修改邮箱
-(void)EditEmailWithUserId:(NSString *)UserId
                 Email:(NSString *)Email
     WithReturnValeuBlock: (ReturnValueBlock) block
         WithFailureBlock: (FailureBlock) failureBlock;

//修改手机
-(void)EditPhoneWithUserId:(NSString *)UserId
                     Phone:(NSString *)Phone
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock;

//修改生日
-(void)EditBirthdayWithUserId:(NSString *)UserId
                     Birthday:(NSString *)Birthday
      WithReturnValeuBlock: (ReturnValueBlock) block
          WithFailureBlock: (FailureBlock) failureBlock;

//修改头像
-(void)EditUserPhotoWithUserId:(NSString *)UserId
                      ImagePath:(NSString *)ImagePath
          WithReturnValeuBlock: (ReturnValueBlock) block
              WithFailureBlock: (FailureBlock) failureBlock;

//我的关注
-(void)MyFavouriteWithUserId:(NSString *)UserId
                     Md5Code:(NSString *)Md5Code
        WithReturnValeuBlock: (ReturnValueBlock) block
            WithFailureBlock: (FailureBlock) failureBlock;

//取消关注
-(void)FavouriteDeleteWithUserId:(NSString *)UserId
                          FavoId:(NSString *)FavoId
                     Md5Code:(NSString *)Md5Code
        WithReturnValeuBlock: (ReturnValueBlock) block
            WithFailureBlock: (FailureBlock) failureBlock;




@end
