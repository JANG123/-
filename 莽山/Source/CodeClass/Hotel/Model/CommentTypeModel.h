//
//  CommentTypeModel.h
//  莽山
//
//  Created by jang on 16/5/13.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentTypeModel : NSObject
@property (nonatomic,strong)NSString *CommentTypeId;//(评论类型id)
@property (nonatomic,strong)NSString *CommentTypeName;//(评论类型名称)
@property (nonatomic,strong)NSString *CommentTypeDescribe;//(评论类型描述)
@property (nonatomic,strong)NSString *CommentTypeCount;//(评论类型当前店铺个数)
@end
