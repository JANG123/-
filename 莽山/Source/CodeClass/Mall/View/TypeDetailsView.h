//
//  TypeDetailsView.h
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TypeDetailsViewDelegate <NSObject>

-(void)shareImageAction:(id)sender;

@end

@interface TypeDetailsView : UIView
@property (nonatomic,strong)UIImageView *logoImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *good1ImageView;
@property (nonatomic,strong)UIImageView *good2ImageView;
@property (nonatomic,strong)UIImageView *good3ImageView;
@property (nonatomic,strong)UIImageView *good4ImageView;
@property (nonatomic,strong)UIImageView *good5ImageView;
@property (nonatomic,strong)UIGestureRecognizer *singleTap1;
@property (nonatomic,strong)UIGestureRecognizer *singleTap2;
@property (nonatomic,strong)UIGestureRecognizer *singleTap3;
@property (nonatomic,strong)UIGestureRecognizer *singleTap4;
@property (nonatomic,strong)UIGestureRecognizer *singleTap5;

@property (nonatomic,weak)id <TypeDetailsViewDelegate>delegate;
@end
