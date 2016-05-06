//
//  UILabel+JYT.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UILabel+JYT.h"

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

@end
