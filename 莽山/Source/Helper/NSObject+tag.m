//
//  NSObject+tag.m
//  莽山
//
//  Created by jang on 16/5/6.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "NSObject+tag.h"
#import <objc/runtime.h>
@implementation NSObject (tag)
//- (void)setUserInfo:(NSDictionary *)_userInfo {
//    objc_setAssociatedObject(self, @"userInfo", _userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (id)userInfo {
//    return objc_getAssociatedObject(self, @"userInfo");
//}
-(void)setGoodInfo:(GoodsModel *)goodInfo{
    objc_setAssociatedObject(self, @"goodInfo", goodInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(GoodsModel *)goodInfo{
    return objc_getAssociatedObject(self, @"goodInfo");
}

@end
