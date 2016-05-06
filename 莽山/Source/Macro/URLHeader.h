//
//  URLHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里是URL信息

#ifndef Project_URLHeader_h
#define Project_URLHeader_h

//接口
#define URL_api @"http://10.0.0.66"
//#define URL_api @"http://cc520-21.xicp.net"

//上传图片
#define URL_UploadImg @"/MobileAPI/Upload/UploadImg"

/**
 * 注册
 */
#define URL_Register @"/MobileAPI/User/Register"

/**
 * 获取注册验证码
 */
#define URL_RegisterGetCode @"/MobileAPI/User/RegisterGetCode"

/**
 * 用户登录
 */
#define URL_Login @"/MobileAPI/User/Login"

/**
 * 用户找回密码
 */
#define URL_ResetPwd @"/MobileAPI/User/ResetPwd"

/**
 * 用户找回密码验证码
 */
#define URL_ResetPwdGetCode @"/MobileAPI/User/ResetPwdGetCode"


/**
 * 修改密码获取验证码
 */
#define URL_EditDataGetCode @"/MobileAPI/User/EditDataGetCode"

/**
 * 修改密码
 */
#define URL_EditPwd @"/MobileAPI/User/EditPwd"

/**
 * 修改手机
 */
#define URL_EditPhone @"/MobileAPI/User/EditPhone"


/**
 * 修改邮箱
 */
#define URL_EditEmail @"/MobileAPI/User/EditEmail"


/**
 * 修改生日
 */
#define URL_EditBirthday @"/MobileAPI/User/EditBirthday"

/**
 * 修改头像
 */
#define URL_EditUserPhoto @"/MobileAPI/User/EditUserPhoto"


/**
 * 我的关注商品
 */
#define URL_MyFavourite @"/MobileAPI/User/MyFavourite"

/**
 * 取消关注
 */
#define URL_FavouriteDelete @"/MobileAPI/User/FavouriteDelete"



/**
 * 四、	商城:
 * 查询总店全部分区
 */
#define URL_GetPartitionAll @"/MobileAPI/GoodsType/GetPartitionAll"

/**
 * 商品列表查询
 */
#define URL_ListGoods @"/MobileAPI/Goods/ListGoods"



#endif
