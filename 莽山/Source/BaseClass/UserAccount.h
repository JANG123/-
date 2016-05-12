//
//  UserAccount.h
//  CaoDu
//
//  Created by jang on 16/3/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UserAccount : NSObject

+(UserAccount *)shareGetUserAccountDate;

//本地保存用户名密码
+(void)SetUserAccout:(NSString *)userName PassWord:(NSString *)passWord;

//获取用户名
+(NSString *)UserName;

//获取密码
+(NSString *)PassWord;

//删除用户信息
+(void)deleteUserAccount;

@end
