//
//  SearchView.m
//  莽山
//
//  Created by jang on 16/5/11.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView:frame];
    }
    return self;
}

-(void)p_setupView:(CGRect)frame
{
    self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100/PxHeight)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView];
    
    _leftButton = [[UIButton alloc ]initWithFrame:CGRectMake(12/PxWidth, 50/PxHeight, 38/PxWidth, 38/PxWidth)];
    //[backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [_leftButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    [self addSubview:_leftButton];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(60/PxWidth, CGRectGetMinY(_leftButton.frame), kScreenWidth - 85/PxWidth, CGRectGetHeight(_leftButton.frame))];
    [_backView addSubview:_searchBar];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteColor"]];
    [_searchBar insertSubview:imageView atIndex:1];
    _searchBar.placeholder = @"搜索";
    [_searchBar.layer setMasksToBounds:YES];
    [_searchBar.layer setCornerRadius:19/PxHeight];
    [_searchBar.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 200/255.0, 200/255.0, 200/255.0, 1 });
    [_searchBar.layer setBorderColor:colorref];//边框颜色
    [_backView addSubview:_searchBar];
    
    
    UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_backView.frame), kScreenWidth, 210/PxHeight)];
    backView1.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    [self addSubview:backView1];
    
    
    
    UILabel *textLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 0, kScreenWidth - 50/PxWidth, 40/PxHeight) title:@"热门搜索" tintColor:[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [backView1 addSubview:textLabel];
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(textLabel.frame), kScreenWidth , 170/PxHeight)];
    self.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator= NO;
    self.scrollView.pagingEnabled = YES;
    [backView1 addSubview:_scrollView];
    
    

    self.page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame) - 30/PxHeight, kScreenWidth, 30/PxHeight)];
    
    self.page.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    [backView1 addSubview:_page];
    
    self.page.numberOfPages = 2;
    
    self.page.currentPage = 0;
    
    self.page.currentPageIndicatorTintColor = Color_indigo;
    
    self.page.pageIndicatorTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    

}

@end
