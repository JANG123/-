//
//  EvaluationHeadTableViewCell.m
//  莽山
//
//  Created by jang on 16/4/26.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "EvaluationHeadTableViewCell.h"
@implementation EvaluationHeadTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    _txtLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 17/PxHeight, 100/PxWidth, 20/PxHeight) title:@"总体评价:" tintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_txtLabel];
    
    _starRatingView = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_txtLabel.frame) + 5/PxWidth, CGRectGetMinY(_txtLabel.frame), 120/PxHeight, 20/PxHeight)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 0;
    _starRatingView.allowsHalfStars = NO;
    _starRatingView.spacing = 5/PxWidth;
    _starRatingView.tintColor = Color_indigo;
    _starRatingView.touchBool = NO;
    [self addSubview:_starRatingView];
    
    
    _scoreLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_starRatingView.frame) + 10/PxWidth, CGRectGetMinY(_starRatingView.frame), 80/PxWidth, CGRectGetHeight(_starRatingView.frame)) title:@"4.5分" tintColor:Color_indigo textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_scoreLabel];
//
//    _highLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_txtLabel.frame), CGRectGetMaxY(_starRatingView.frame) +15/PxHeight , [UILabel widthForString:@"性价比高 4" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"性价比高 4" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
//    [_highLabel1.layer setBorderWidth:1.0]; //边框宽度
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 56/255.0, 219/255.0, 202/255.0, 1 });
//    [_highLabel1.layer setBorderColor:colorref];//边框颜色
//    [self addSubview:_highLabel1];
//
//    _highLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_highLabel1.frame) + 10/PxWidth, CGRectGetMinY(_highLabel1.frame) , [UILabel widthForString:@"服务态度好 6" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"服务态度好 6" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
//    [_highLabel2.layer setBorderWidth:1.0]; //边框宽度
//    [_highLabel2.layer setBorderColor:colorref];//边框颜色
//    [self addSubview:_highLabel2];
//    
//    _highLabel3 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_highLabel2.frame) + 10/PxWidth, CGRectGetMinY(_highLabel2.frame) , [UILabel widthForString:@"性价比高 4" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"性价比高 4" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
//    [_highLabel3.layer setBorderWidth:1.0]; //边框宽度
//    [_highLabel3.layer setBorderColor:colorref];//边框颜色
//    [self addSubview:_highLabel3];
//    
//    _highLabel4 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_highLabel3.frame) + 10/PxWidth, CGRectGetMinY(_highLabel3.frame) , [UILabel widthForString:@"服务态度好 6" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"服务态度好 6" tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
//    [_highLabel4.layer setBorderWidth:1.0]; //边框宽度
//    [_highLabel4.layer setBorderColor:colorref];//边框颜色
//    [self addSubview:_highLabel4];
//    
//    _lowLabel1 = [UILabel setFrame:CGRectMake(CGRectGetMinX(_highLabel1.frame), CGRectGetMaxY(_highLabel1.frame) +15/PxHeight , [UILabel widthForString:@"服务态度好 6" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"服务态度好 6" tintColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
//    [_lowLabel1.layer setBorderWidth:1.0]; //边框宽度
//    CGColorRef colorref1 = CGColorCreate(colorSpace,(CGFloat[]){ 158/255.0, 158/255.0, 158/255.0, 1 });
//    [_lowLabel1.layer setBorderColor:colorref1];//边框颜色
//    [self addSubview:_lowLabel1];
//    
//    _lowLabel2 = [UILabel setFrame:CGRectMake(CGRectGetMaxX(_lowLabel1.frame) + 10/PxWidth, CGRectGetMinY(_lowLabel1.frame) , [UILabel widthForString:@"性价比高 4" font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:@"性价比高 4" tintColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0] textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
//    [_lowLabel2.layer setBorderWidth:1.0]; //边框宽度
//    [_lowLabel2.layer setBorderColor:colorref1];//边框颜色
//    [self addSubview:_lowLabel2];
}

-(void)setData:(NSArray *)data{
    _data = data;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_txtLabel.frame), CGRectGetMaxY(_starRatingView.frame) +15/PxHeight, kScreenWidth - 2*CGRectGetMinX(_txtLabel.frame), 100/PxHeight) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self addSubview:_collectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    CommentTypeModel *aCommentType = _data[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"%@ %@",aCommentType.CommentTypeName,aCommentType.CommentTypeCount] ;
    
    UILabel *myLabel;
    
    myLabel = [UILabel setFrame:CGRectMake(0, 0, [UILabel widthForString:str font:[UIFont systemFontOfSize:15.0]], 30/PxHeight) title:str tintColor:Color_indigo textAlignment:NSTextAlignmentCenter font:[UIFont systemFontOfSize:15.0]];
    [myLabel.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 56/255.0, 219/255.0, 202/255.0, 1 });
    [myLabel.layer setBorderColor:colorref];//边框颜色
    
    [cell addSubview:myLabel];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 0, 5, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTypeModel *aCommentType = _data[indexPath.row];
    NSString *str = aCommentType.CommentTypeName;
    CGSize detailSize = CGSizeMake([UILabel widthForString:str font:[UIFont systemFontOfSize:15.0]], 30/PxHeight);
    return detailSize;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentTypeModel *aCommentType = _data[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"%@ %@",aCommentType.CommentTypeName,aCommentType.CommentTypeCount];
    
    NSLog(@"%@",str);
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
