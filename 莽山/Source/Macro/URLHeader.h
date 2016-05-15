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
//#define URL_api @"http://10.0.0.66"
#define URL_api @"http://ms.wowzb.net"

//上传图片
#define URL_UploadImg @"/MobileAPI/Upload/UploadImg"

/**
 * 商品图片
 */
#define URL_f_b @"http://10.0.0.66/images/goods/f_b/"


/**
 * 商品海报
 */
#define URL_posters @"http://10.0.0.66/images/goods/posters/"

/**
 * 用户头像
 */
#define URL_user @"http://10.0.0.66/images/user/"

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
 * 绑定获取验证码
 */
#define URL_EditPhoneGetCode @"/MobileAPI/User/EditPhoneGetCode"

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
 * 收藏/取消收藏商品
 */
#define URL_CollectionGoods @"/MobileAPI/Goods/CollectionGoods"


/**
 * 我的关注店铺
 */
#define URL_MyShops @"/MobileAPI/User/MyShops"

/**
 * 取消/收藏店铺
 */
#define URL_LoveShopNo @"/MobileAPI/User/LoveShopNo"



/**
 * 刷新数据
 */
#define URL_RenovateUser @"/MobileAPI/User/RenovateUser"

/**
 * 订单查询
 */
#define URL_UserOrderAll @"/MobileAPI/UserOrder/UserOrderAll"

/**
 * 取消订单(订单状态只能为已提交)
 */
#define URL_CloseOrder @"/MobileAPI/UserOrder/CloseOrder"

/**
 * 删除订单 (订单状态需要为取消或关闭)
 */
#define URL_DeleteOrder @"/MobileAPI/UserOrder/DeleteOrder"


/**
 * 确认收货 (订单状态需要为已发货)
 */
#define URL_TakeDelivery @"/MobileAPI/UserOrder/TakeDelivery"

/**
 * 四、	商城:
 * 查询总店全部分区
 */
#define URL_GetPartitionAll @"/MobileAPI/GoodsType/GetPartitionAll"

/**
 * 商品列表查询
 */
#define URL_ListGoods @"/MobileAPI/Goods/ListGoods"


/**
 * 商品详情查询
 */
#define URL_GoodsDetail @"/MobileAPI/Goods/GoodsDetail"


/**
 * 推荐商品
 */
#define URL_RecommendGoods @"/MobileAPI/Goods/RecommendGoods"

/**
 * 根据店铺或商品名称查店铺
 */
#define URL_GetShopByName @"/MobileAPI/Goods/GetShopByName"


/**
 * 根据店铺或商品名称查店铺
 */
#define URL_GetShopList @"/MobileAPI/Shop/GetShopList"


/**
 * 查询首页商品
 */
#define URL_GetHomeAll @"/MobileAPI/GoodsType/GetHomeAll"

/**
 * 酒店或农家首页
 */
#define URL_GetShopList @"/MobileAPI/Shop/GetShopList"

/**
 * 查询商品所有评论
 */
#define URL_SelectGoodsComment @"/MobileAPI/GoodsComment/SelectGoodsComment"

/**
 * 根据店铺id查询店铺评论类型
 */
#define URL_SelectCommentType @"/MobileAPI/GoodsComment/SelectCommentType"

#endif
