//
//  GoodCollectionViewCell.m
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "GoodCollectionViewCell.h"

@implementation GoodCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

-(void)p_setupView
{
    self.backgroundColor = [UIColor whiteColor];
    _goodImage = [[UIImageView alloc]initWithFrame:self.frame];
    _goodImage.image = [UIImage imageNamed:@"图层-3"];
    [self addSubview:_goodImage];

//    _gooNameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, self.frame.size.height - 50/PxHeight, self.frame.size.width/2, 50/PxHeight) title:@""茶叶 tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont ]]
    
    
}
@end
