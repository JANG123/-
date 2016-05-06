//
//  AFNDataTools-JYT.m
//  莽山
//
//  Created by jang on 16/5/4.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "AFNDataTools-JYT.h"

@implementation AFNDataTools_JYT

+ (void) NetRequestGetWithUrl:(NSString *)url
         WithReturnValeuBlock: (ReturnValueBlock) block
             WithFailureBlock: (FailureBlock) failureBlock{
    //1.请求管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //2.发起请求
    [manager GET:url parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 检索成功
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        block(dict);
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];

}

@end
