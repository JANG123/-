//
//  UILabel+JYT.h
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentTypeModel;
@interface UILabel (JYT)
+(UILabel *)setFrame:(CGRect)frame title:(NSString *)text tintColor:(UIColor *)tintColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font;

+(CGFloat)heightForString:(NSString *)aString font:(UIFont *)font Width:(CGFloat)Width;

+(CGFloat)widthForString:(NSString *)aString font:(UIFont *)font;

@property (nonatomic,retain)CommentTypeModel *commentType;
@end
