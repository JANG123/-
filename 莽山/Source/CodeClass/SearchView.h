//
//  SearchView.h
//  莽山
//
//  Created by jang on 16/5/11.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchView : UIView

@property (nonatomic,strong)UIView *backView;
@property (nonatomic,strong)UIButton *leftButton;
@property (nonatomic,strong)UISearchBar *searchBar;

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *page;

@property (nonatomic,strong)UICollectionView *collectionView;

@end
