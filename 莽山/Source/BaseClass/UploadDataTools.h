//
//  UploadDataTools.h
//  莽山
//
//  Created by jang on 16/5/5.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadDataTools : NSObject

+(void)UploadImgWithImgStr:(UIImage *)ImgStr
                     UploadName:(NSString *)UploadName
                    UserId:(NSString *)UserId
          WithReturnValeuBlock: (ReturnValueBlock) block
              WithFailureBlock: (FailureBlock) failureBlock;


@end
