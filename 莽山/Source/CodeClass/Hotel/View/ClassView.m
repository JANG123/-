//
//  ClassView.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "ClassView.h"

@implementation ClassView

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
    self.backgroundColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(25/PxWidth, 40/PxHeight, kScreenWidth - 50/PxWidth, 38/PxHeight)];
//    [[_searchBar.subviews objectAtIndex:0]removeFromSuperview];
//    
//    for (UIView *subview in _searchBar.subviews) {
//            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
//                [subview removeFromSuperview];
//                break;
//            }
//    }
    _searchBar.placeholder = @"搜索酒店";
    _searchBar.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_searchBar.layer setMasksToBounds:YES];
    [_searchBar.layer setCornerRadius:19/PxHeight];
    [self addSubview:_searchBar];
    
    _allButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _allButton.frame = CGRectMake(170/PxWidth, CGRectGetMaxY(_searchBar.frame) + 75/PxHeight, 75/PxWidth, 75/PxWidth);
    _allButton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_allButton.layer setMasksToBounds:YES];
    [_allButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_allButton];
    _allLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_allButton.frame) + 42/PxWidth, CGRectGetMinY(_allButton.frame), 300/PxWidth, CGRectGetHeight(_allButton.frame)) title:@"全部" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_allLabel];
    
    _originalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _originalButton.frame = CGRectMake(170/PxWidth, CGRectGetMaxY(_allButton.frame) + 44/PxHeight, 75/PxWidth, 75/PxWidth);
    _originalButton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_originalButton.layer setMasksToBounds:YES];
    [_originalButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_originalButton];
    _originalLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_originalButton.frame) + 42/PxWidth, CGRectGetMinY(_originalButton.frame), 300/PxWidth, CGRectGetHeight(_originalButton.frame)) title:@"原生态" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_originalLabel];
    
    _homesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _homesButton.frame = CGRectMake(170/PxWidth, CGRectGetMaxY(_originalButton.frame) + 44/PxHeight, 75/PxWidth, 75/PxWidth);
    _homesButton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_homesButton.layer setMasksToBounds:YES];
    [_homesButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_homesButton];
    _homesLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_homesButton.frame) + 42/PxWidth, CGRectGetMinY(_homesButton.frame), 300/PxWidth, CGRectGetHeight(_homesButton.frame)) title:@"精致民宿" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_homesLabel];
    
    _homesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _homesButton.frame = CGRectMake(170/PxWidth, CGRectGetMaxY(_originalButton.frame) + 44/PxHeight, 75/PxWidth, 75/PxWidth);
    _homesButton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_homesButton.layer setMasksToBounds:YES];
    [_homesButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_homesButton];
    _homesLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_homesButton.frame) + 42/PxWidth, CGRectGetMinY(_homesButton.frame), 300/PxWidth, CGRectGetHeight(_homesButton.frame)) title:@"精致民宿" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_homesLabel];
    
    _uniqueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _uniqueButton.frame = CGRectMake(170/PxWidth, CGRectGetMaxY(_homesButton.frame) + 44/PxHeight, 75/PxWidth, 75/PxWidth);
    _uniqueButton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_uniqueButton.layer setMasksToBounds:YES];
    [_uniqueButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_uniqueButton];
    _uniqueLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_homesButton.frame) + 42/PxWidth, CGRectGetMinY(_uniqueButton.frame), 300/PxWidth, CGRectGetHeight(_uniqueButton.frame)) title:@"独特设计" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_uniqueLabel];
    
    _holidayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _holidayButton.frame = CGRectMake(170/PxWidth, CGRectGetMaxY(_uniqueButton.frame) + 44/PxHeight, 75/PxWidth, 75/PxWidth);
    _holidayButton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    [_holidayButton.layer setMasksToBounds:YES];
    [_holidayButton.layer setCornerRadius:75/PxWidth/2];
    [self addSubview:_holidayButton];
    _holidayLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_holidayButton.frame) + 42/PxWidth, CGRectGetMinY(_holidayButton.frame), 300/PxWidth, CGRectGetHeight(_holidayButton.frame)) title:@"户外度假" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self addSubview:_holidayLabel];
    
    _backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake((kScreenWidth-60/PxHeight)/2, CGRectGetMaxY(_holidayButton.frame) + 100/PxHeight, 60/PxHeight, 60/PxHeight);
    [_backButton setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backButton];

}

- (void)goBack:(UIButton *)sender
{
    [self.delegate goBack:sender];
}

@end
