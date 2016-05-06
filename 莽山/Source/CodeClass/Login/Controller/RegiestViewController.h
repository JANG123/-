//
//  RegiestViewController.h
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RegiestCode)(NSString *code,NSString *pass);
@interface RegiestViewController : UIViewController

@property (nonatomic,copy)RegiestCode rBlock;
@end
