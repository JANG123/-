//
//  APPHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef Project_APPHeader_h
#define Project_APPHeader_h

#import "FarmHouseTableViewController.h"
#import "ServiceViewController.h"
#import "HotelTableViewController.h"
#import "MallTableViewController.h"
#import "MallView.h"
#import "MallTypeView.h"
#import "TypeDetailsView.h"
#import "EvaluationTable.h"
#import "EvaluationTableViewController.h"
#import "DetailsTableViewController.h"
#import "UserTableViewController.h"
#import "OrderSelectionView.h"
#import "OrderSelectionButton.h"
#import "LoginViewController.h"
#import "MapViewController.h"
#import "SearchViewController.h"



#import "UITableView+ExtraCell.h"
#import "UILabel+JYT.h"
#import "UINavigationBar+Awesome.h"
#import "AFNDataTools-JYT.h"
#import "NetWorkTolls.h"
#import "NSObject+tag.h"


#import "UserInfoModel.h"
#import "GoodsModel.h"
#import "GoodsDetaileModel.h"
#import "GoodsPriceModel.h"
#import "MyFavouriteModel.h"
#import "MyShopModel.h"
#import "ShopModel.h"
#import "FarmHouseModel.h"
#import "HotelModel.h"
#import "OrderModel.h"


#import "LoginDataTools.h"
#import "GoodsDateTolls.h"
#import "UserAccount.h"
#import "UploadDataTools.h"


/**
 * 当前设备的屏幕宽高
 */
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height


#define PxWidth (540/kScreenWidth)
#define PxHeight (960/kScreenHeight)

// 导航栏（navigationbar）
#define SystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]

#define KFontColor_NavWhite [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];

#define KFontColor_NavBlackColor [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];

#define K_Nav_Image [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"whiteColor.png"] forBarMetrics:UIBarMetricsDefault];

#define NAVBAR_CHANGE_POINT 64

#define K_rectStatus  [[UIApplication sharedApplication] statusBarFrame].size.height

#define K_rectNav  self.navigationController.navigationBar.frame.size.height
/**
 * 背景灰色
 */
#define Color_back [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0]

#define Color_indigo [UIColor colorWithRed:56/255.0 green:219/255.0 blue:202/255.0 alpha:1.0]


#define Animation_Y 200

//选项卡高度
#define kXTDefaultTabBarHeight 45







































//TODO 提示
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


#endif
