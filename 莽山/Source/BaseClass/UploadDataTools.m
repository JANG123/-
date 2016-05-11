//
//  UploadDataTools.m
//  莽山
//
//  Created by jang on 16/5/5.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UploadDataTools.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <MobileCoreServices/UTCoreTypes.h>
@implementation UploadDataTools
+(void)UploadImgWithImgStr:(UIImage *)ImgStr UploadName:(NSString *)UploadName UserId:(NSString *)UserId WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock{
    
    NSData *mydata=UIImageJPEGRepresentation(ImgStr , 1);
    
    NSString *pictureDataString = [mydata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@?",URL_api,URL_UploadImg];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:urlString]];
    
    [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFormData:[UploadName dataUsingEncoding:NSUTF8StringEncoding]
                                    name:@"UploadName"];
        [formData appendPartWithFormData:[UserId dataUsingEncoding:NSUTF8StringEncoding]
                                    name:@"UserId"];
        [formData appendPartWithFormData:[UploadName dataUsingEncoding:NSUTF8StringEncoding]
                                    name:@"UploadName"];
        [formData appendPartWithFormData:[pictureDataString dataUsingEncoding:NSUTF8StringEncoding ] name:@"ImgStr"];
        [formData appendPartWithFormData:[[LoginDataTools shareGetLoginDate].userModel.Md5Code dataUsingEncoding:NSUTF8StringEncoding ] name:@"Md5Code"];
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *longNumber = [NSNumber numberWithLong:[[dict objectForKey:@"ReturnValue"] longLongValue]];
        NSString *ReturnValue = [longNumber stringValue];
        if ([ReturnValue isEqualToString:@"0"]) {
            
            NSString *ImagesName = [[dict objectForKey:@"View"] objectForKey:@"ImagesName"];
            [[LoginDataTools shareGetLoginDate]EditUserPhotoWithUserId:[LoginDataTools shareGetLoginDate].userModel.UserId ImagePath:ImagesName WithReturnValeuBlock:^(id code) {
                NSString *returnValue =  [NSString stringWithFormat:@"%@",code];
                if ([returnValue isEqualToString:@"0"]) {
                    block(returnValue);
                    NSLog(@"成功");
                }
            } WithFailureBlock:^(NSError *error) {
                
            }];
            
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failureBlock(error);
    }];




}
@end
