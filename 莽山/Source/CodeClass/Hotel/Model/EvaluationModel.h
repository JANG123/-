//
//  EvaluationModel.h
//  莽山
//
//  Created by jang on 16/5/12.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EvaluationModel : NSObject
@property (nonatomic,strong)NSString *CommentId;//评论id

@property (nonatomic,strong)NSString *LoginId;//用户登录名

@property (nonatomic,strong)NSString *CommentTime; //评论时间

@property (nonatomic,strong)NSString *IsAnonymous;//是否匿名

@property (nonatomic,strong)NSString *CommentConnent;//评论内容

@property (nonatomic,strong)NSString *CommentScore;//店铺评分

@property (nonatomic,strong)NSArray *ImageDetailBean;//评论图片
@end
