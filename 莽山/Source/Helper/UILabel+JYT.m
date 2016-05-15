//
//  UILabel+JYT.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UILabel+JYT.h"
#import <objc/runtime.h>
@implementation UILabel (JYT)

+(UILabel *)setFrame:(CGRect)frame title:(NSString *)text tintColor:(UIColor *)tintColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textAlignment = textAlignment;
    label.font = font;
    label.textColor = tintColor;
    return label;
}

+(CGFloat)heightForString:(NSString *)aString font:(UIFont *)font Width:(CGFloat)Width
{
    NSDictionary *dict = @{NSFontAttributeName :font};
    
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(Width, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
}

+(CGFloat)widthForString:(NSString *)aString font:(UIFont *)font
{
    CGSize size =[aString sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.width + 10/PxWidth;
}

-(void)setCommentType:(CommentTypeModel *)commentType{
    objc_setAssociatedObject(self, @"commentType", commentType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CommentTypeModel *)commentType{
    return objc_getAssociatedObject(self, @"commentType");
}

@end
