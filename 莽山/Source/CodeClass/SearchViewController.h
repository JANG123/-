//
//  SearchViewController.h
//  莽山
//
//  Created by jang on 16/5/10.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SearchCode)(NSString *code);
@interface SearchViewController : UIViewController

@property (nonatomic,copy)SearchCode searchBlock;
@end
