//
//  AFNDataTools-JYT.h
//  莽山
//
//  Created by jang on 16/5/4.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ReturnValueBlock)(id code);
typedef void (^FailureBlock)(NSError *error);
@interface AFNDataTools_JYT : NSObject

+ (void) NetRequestGetWithUrl:(NSString *)url
         WithReturnValeuBlock: (ReturnValueBlock) block
             WithFailureBlock: (FailureBlock) failureBlock;

@end
