//
//  GoodViewController.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "GoodViewController.h"
#import "StoreView.h"
#import "GoodView.h"
#import "GoodDetailsView.h"
@interface GoodViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,EvaluationTableDelegate,XTPageViewControllerDataSource,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIScrollView *backView;
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)NSMutableArray *mainGoodArr;
@property (nonatomic,strong)StoreView *sv;
@property (nonatomic,strong)GoodView *gv;
@property (nonatomic,strong)GoodDetailsView *gdv;
@property (nonatomic,strong)UIButton *headButton1;
@property (nonatomic,strong)UIButton *headButton2;
@property (nonatomic,strong)UIButton *headButton3;
@property (nonatomic,strong)UILabel *greenLabel1;
@property (nonatomic,strong)UILabel *greenLabel2;
@property (nonatomic,strong)UILabel *greenLabel3;
@property (nonatomic,strong)UICollectionView *classCollectView;
@property (nonatomic,strong)UIButton *buyButton;
@property (nonatomic,strong)UIButton *collectionButton;
@property (nonatomic,strong)UIButton *upButton;
@property (nonatomic,strong)NSArray *RecommendGoodsArr;

@property (nonatomic,strong)NSArray *evaluationArr;
@end

@implementation GoodViewController

-(void)loadView{
    _backView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _backView.backgroundColor = [UIColor clearColor];
    self.view = _backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    rectNav = self.navigationController.navigationBar.frame;
    [self p_data];
    [self drawNav];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self drawCycleScrollView];
    [self drawView];
    [self drawHeadButton];
    [self p_Collection];
    _classCollectView.hidden = YES;
    _upButton.hidden = YES;
    _numberOfPages = 4;
    _backView.scrollEnabled = YES;
    _backView.delegate = self;
}

-(void)drawView{
    _sv = [[StoreView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainCycleScrollView.frame), kScreenWidth, 172/PxHeight)];
    _sv.storeNameLabel.text = _aGoodsDetaile.GoodsName;
    _sv.addressLabel.text = [NSString stringWithFormat:@"￥%@",_aGoodsDetaile.GoodsPrice.GoodsCurrentPrice];
    _sv.addressLabel.textColor = Color_indigo;
    _sv.timeLabel.text = _aGoodsDetaile.BusinessHours;
    _sv.locationLabel.text = _aGoodsDetaile.ShopAddress;
    [self.view addSubview:_sv];
    
    _gv = [[GoodView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_sv.frame), kScreenWidth, 412/PxHeight)];
    _gv.detailsLabel.text = _aGoodsDetaile.GoodsIntro;
    [self.view addSubview:_gv];
    
    [_gv.logoImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_posters,_aGoodsDetaile.ShopLogo]]];
    _gv.nameLabel.text = _aGoodsDetaile.ShopName;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([_backView isEqual:scrollView]) {
        UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
        CGFloat offsetY = scrollView.contentOffset.y;
        NSLog(@"%lf",offsetY);
        UIButton *tempButton = self.navigationItem.leftBarButtonItem.customView;
        [UIView animateWithDuration:0.3 animations:^{
            if (offsetY > 0 && offsetY < NAVBAR_CHANGE_POINT) {
                [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:offsetY/64.0]];
            }else if (offsetY > NAVBAR_CHANGE_POINT) {
                [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor whiteColor]];
                [tempButton setImage:[UIImage imageNamed:@"订单填写_返回"] forState:UIControlStateNormal];
                KFontColor_NavBlackColor
            }
            else {
                [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
                [tempButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
                KFontColor_NavWhite
            }
        }];
        if (offsetY > -rectNav.size.height-rectStatus.size.height) {
            _collectionButton.frame =  CGRectMake(0, kScreenHeight - 75/PxHeight + offsetY , kScreenWidth/2, 75/PxHeight);
            _buyButton.frame =  CGRectMake(kScreenWidth/2, kScreenHeight - 75/PxHeight + offsetY , kScreenWidth/2, 75/PxHeight);
            _upButton.frame = CGRectMake(kScreenWidth - 80/PxWidth, CGRectGetMinY(_buyButton.frame) - 100/PxHeight, 55/PxHeight, 55/PxHeight);
            _upButton.hidden = NO;
        }else{
            _collectionButton.frame =  CGRectMake(0, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/2, 75/PxHeight);
            _buyButton.frame =  CGRectMake(kScreenWidth/2, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/2, 75/PxHeight);
            _upButton.frame = CGRectMake(kScreenWidth - 80/PxWidth, CGRectGetMinY(_buyButton.frame) - 100/PxHeight, 55/PxHeight, 55/PxHeight);
            _upButton.hidden = YES;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    KFontColor_NavWhite
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    KFontColor_NavBlackColor
    [self.navigationController.navigationBar lt_reset];
}

-(void)drawNav{
    self.navigationItem.title = @"商品详情";
    self.navigationItem.titleView.alpha = 1;
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}

-(void)drawCycleScrollView{
    if (_imageArr.count == 0) {
        // 主循环滚动图
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"img"],[UIImage imageNamed:@"img"],[UIImage imageNamed:@"img"],[UIImage imageNamed:@"img"],[UIImage imageNamed:@"img"], nil];
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -rectNav.size.height-rectStatus.size.height, kScreenWidth, 440/PxHeight) imagesGroup:tempArr];
        [self.view addSubview:_mainCycleScrollView];
    }else{
        
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -rectNav.size.height-rectStatus.size.height, kScreenWidth, 440/PxHeight) imageURLStringsGroup:_imageArr];
        [self.view addSubview:_mainCycleScrollView];
        NSLog(@"%lf",CGRectGetMaxY(_mainCycleScrollView.frame));
    }
}


-(void)drawHeadButton{
    _headButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _headButton1.backgroundColor = [UIColor whiteColor];
    _headButton1.frame = CGRectMake(0, CGRectGetMaxY(_gv.frame), kScreenWidth/3, 50/PxHeight);
    [_headButton1 setTitle:@"商品简介" forState:UIControlStateNormal];
    _headButton1.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton1 addTarget:self action:@selector(headButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headButton1];
    
    _greenLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(25/PxWidth, CGRectGetHeight(_headButton1.frame) - 2, kScreenWidth/3 - 50/PxWidth, 2)];
    [_headButton1 addSubview:_greenLabel1];
    [_headButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _greenLabel1.backgroundColor = Color_indigo;
    
    _headButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _headButton2.frame = CGRectMake(CGRectGetMaxX(_headButton1.frame), CGRectGetMinY(_headButton1.frame), CGRectGetWidth(_headButton1.frame), CGRectGetHeight(_headButton1.frame));
    _headButton2.backgroundColor = [UIColor whiteColor];
    [_headButton2 setTitle:@"推荐商品" forState:UIControlStateNormal];
    [_headButton2 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _headButton2.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton2 addTarget:self action:@selector(headButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headButton2];
    
    _greenLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(25/PxWidth, CGRectGetHeight(_headButton1.frame) - 2, kScreenWidth/3 - 50/PxWidth, 2)];
    [_headButton2 addSubview:_greenLabel2];
    
    _headButton3 = [UIButton buttonWithType:UIButtonTypeSystem];
    _headButton3.frame = CGRectMake(CGRectGetMaxX(_headButton2.frame), CGRectGetMinY(_headButton1.frame), CGRectGetWidth(_headButton2.frame), CGRectGetHeight(_headButton2.frame));
    _headButton3.backgroundColor = [UIColor whiteColor];
    [_headButton3 setTitle:@"用户评价" forState:UIControlStateNormal];
    [_headButton3 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _headButton3.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_headButton3 addTarget:self action:@selector(headButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headButton3];
    
    _greenLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(25/PxWidth, CGRectGetHeight(_headButton1.frame) - 2, kScreenWidth/3 - 50/PxWidth, 2)];
    [_headButton3 addSubview:_greenLabel3];
    
    _gdv = [[GoodDetailsView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headButton2.frame), kScreenWidth, 55/PxHeight * _aGoodsDetaile.GoodsParameters.count + 750/PxHeight)];
    [self.view addSubview:_gdv];
    
    _gdv.parametersTbaleView.delegate = self;
    _gdv.parametersTbaleView.dataSource = self;
    _gdv.parametersTbaleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_gdv setTableFrame:CGRectMake(0, 0, kScreenWidth, 55/PxHeight * _aGoodsDetaile.GoodsParameters.count)];
    
    [_gdv.parametersTbaleView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    for (int i =0; i < _aGoodsDetaile.GoodsSp.count; i++) {
        switch (i) {
            case 0:
            {
                NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_posters,_aGoodsDetaile.GoodsSp[i]];

                [_gdv.goodImageView1 sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
            }
                break;
            case 1:
            {
                NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_posters,_aGoodsDetaile.GoodsSp[i]];
  
                [_gdv.goodImageView2 sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
            }
                break;
            case 2:
            {
                NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_posters,_aGoodsDetaile.GoodsSp[i]];

                [_gdv.goodImageView3 sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
            }
                break;
            default:
                break;
        }
    }

    _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_gdv.frame) + 75/PxHeight);
}

-(void)headButtonAction:(UIButton *)sender{
    [_headButton1 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_headButton2 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_headButton3 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _greenLabel1.backgroundColor = [UIColor whiteColor];
    _greenLabel2.backgroundColor = [UIColor whiteColor];
    _greenLabel3.backgroundColor = [UIColor whiteColor];
    
    if (sender == _headButton1) {
        _evaluationTableView.hidden = YES;
        _classCollectView.hidden = YES;
        _gdv.hidden = NO;
        _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_gdv.frame) + 75/PxHeight);
        [_headButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel1.backgroundColor = Color_indigo;
    }if (sender == _headButton2) {
        _classCollectView.hidden = NO;
        _evaluationTableView.hidden = YES;
        _gdv.hidden = YES;
        [_headButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel2.backgroundColor = Color_indigo;
        _RecommendGoodsArr = [NSArray array];
        [[GoodsDateTolls shareGetGoodsDate]RecommendGoodsWithShopId:_aGoodsDetaile.ApplyShopsId pageIndex:1 pageSize:8 WithReturnValeuBlock:^(id code) {
            _RecommendGoodsArr = code;
             _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_headButton1.frame) + 200/PxHeight * (_RecommendGoodsArr.count + 1) / 2 + 75/PxHeight);
            [_classCollectView reloadData];
        } WithFailureBlock:^(NSError *error) {
            
        }];
        
    }if (sender == _headButton3) {
        [_headButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel3.backgroundColor = Color_indigo;
        _classCollectView.hidden = YES;
        _evaluationTableView.hidden = NO;
        _gdv.hidden = YES;
        _evaluationTableView.frame = CGRectMake(0, CGRectGetMaxY(_headButton1.frame), kScreenWidth, 700/PxHeight);
        _evaluationTableView.tableView.frame = CGRectMake(0, 0, kScreenWidth, 700/PxHeight);
        _evaluationTableView.tableView.scrollEnabled = NO;
        [[GoodsDateTolls shareGetGoodsDate]SelectGoodsCommentWithGoodsId:_aGoodsDetaile.GoodsId Type:@"" CommentTypeId:@"" pageIndex:1 pageSize:2 WithReturnValeuBlock:^(id code) {
            _evaluationTableView.dataArr = code;
            dispatch_async(dispatch_get_main_queue(), ^{
                _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_headButton1.frame) + [_evaluationTableView hightForTableView] + 75/PxHeight);
            });
        } WithFailureBlock:^(NSError *error) {
            
        }];
    }
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)p_Collection{
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [self.view addSubview:_classCollectView];
    //[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _classCollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headButton1.frame), kScreenWidth, 400/PxHeight) collectionViewLayout:flowLayout];
    _classCollectView.backgroundColor = [UIColor whiteColor];
    _classCollectView.scrollEnabled = NO;
    [self.view addSubview:_classCollectView];
    _classCollectView.dataSource=self;
    _classCollectView.delegate=self;
    //注册Cell，必须要有
    [_classCollectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];

    
    _evaluationTableView = [[EvaluationTable alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headButton1.frame), kScreenWidth, 250/PxHeight)];
    [self.view addSubview:_evaluationTableView];
    _evaluationTableView.hidden = YES;
    _evaluationTableView.type = YES;
    _evaluationTableView.delegate = self;
    
    
    _collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _collectionButton.frame = CGRectMake(0, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/2, 75/PxHeight);
    
    if ([_aGoodsDetaile.IsLove isEqualToString:@"0"]) {
        _collectionButton.backgroundColor = Color_back;
        [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectionButton setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
    }else{
        _collectionButton.backgroundColor = [UIColor colorWithRed:241/255.0 green:101/255.0 blue:97/255.0 alpha:1.0];
        [_collectionButton setTitle:@"取消收藏" forState:UIControlStateNormal];
        [_collectionButton setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
    }

    [_collectionButton addTarget:self action:@selector(collectionButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_collectionButton];
    
    _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _buyButton.frame = CGRectMake(kScreenWidth/2, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/2, 75/PxHeight);
    _buyButton.backgroundColor = Color_indigo;
    [_buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [_buyButton addTarget:self action:@selector(buyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buyButton];
    
    _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _upButton.frame = CGRectMake(kScreenWidth - 80/PxWidth, CGRectGetMinY(_buyButton.frame) - 100/PxHeight, 55/PxHeight, 55/PxHeight);
    [_upButton setImage:[UIImage imageNamed:@"返回顶部"] forState:UIControlStateNormal];
    [_upButton addTarget:self action:@selector(upButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_upButton];
}

-(void)upButtonAction{
    [UIView animateWithDuration:0.5 animations:^{
        _backView.contentOffset = CGPointMake(0, -64);
    }];
}

-(void)buyButtonAction{

}

//收藏
-(void)collectionButtonAction{
    [[LoginDataTools shareGetLoginDate] CollectionGoodsWithGoodsId:_aGoodsDetaile.GoodsId WithReturnValeuBlock:^(id code) {
        NSString *returnValue = code;
        if ([returnValue isEqualToString:@"0"]) {
            [[GoodsDateTolls shareGetGoodsDate]GoodsDetailWithGoodsId:_aGoodsDetaile.GoodsId UserId:[LoginDataTools shareGetLoginDate].userModel.UserId WithReturnValeuBlock:^(id code) {
                _aGoodsDetaile = code;
                if ([_aGoodsDetaile.IsLove isEqualToString:@"0"]) {
                    _collectionButton.backgroundColor = Color_back;
                    [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
                    [_collectionButton setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
                    [self p_showAlertView:@"取消成功" message:nil];
                }else{
                    _collectionButton.backgroundColor = [UIColor colorWithRed:241/255.0 green:101/255.0 blue:97/255.0 alpha:1.0];
                    [_collectionButton setTitle:@"取消收藏" forState:UIControlStateNormal];
                    [_collectionButton setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
                    [self p_showAlertView:@"收藏成功" message:nil];
                }
            } WithFailureBlock:^(NSError *error) {
                
            }];
        }else{
            if ([_aGoodsDetaile.IsLove isEqualToString:@"0"]) {
                [self p_showAlertView:@"收藏失败，请重试" message:nil];
            }else{
            [self p_showAlertView:@"取消失败，请重试" message:nil];
            }
        
        }
    } WithFailureBlock:^(NSError *error) {
        [self p_showAlertView:@"当前网络不稳定" message:nil];
    }];
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    _classCollectView.frame = CGRectMake(0, CGRectGetMaxY(_headButton1.frame), kScreenWidth, 200/PxHeight * (_RecommendGoodsArr.count + 1) / 2);
    return _RecommendGoodsArr.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    GoodsModel *aGood = _RecommendGoodsArr[indexPath.row];
    
    UIImageView *goodImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 200/PxHeight)];
    [goodImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_f_b,aGood.ImagePath]]];
    [cell addSubview:goodImage];
    UILabel *gooNameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 150/PxHeight, kScreenWidth/4 - 25/PxWidth, 50/PxHeight) title:aGood.GoodsName tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [cell addSubview:gooNameLabel];
    UILabel *priceLabel =  [UILabel setFrame:CGRectMake(kScreenWidth/2 - CGRectGetMaxX(gooNameLabel.frame), 150/PxHeight, kScreenWidth/4 - 20/PxWidth, 50/PxHeight) title:[NSString stringWithFormat:@"¥%@",aGood.GoodsCurrentPrice] tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:15.0]];
    [cell addSubview:priceLabel];
    
    [self drawLine:indexPath.row];
    return cell;
}

-(void)drawLine:(NSInteger)row{
    CGSize contentSize = _classCollectView.contentSize;
    if(didAddSperateVerticalLine == NO) {
        UIView *verticalLine = [[UIView alloc]initWithFrame:CGRectMake(contentSize.width/2 - 0.5, 0, 1, contentSize.height)];
        verticalLine.backgroundColor = [UIColor lightGrayColor];//colorWithRed:225/225.0f green:227/225.0f blue:233/225.0f alpha:1.0];
        verticalLine.alpha = 0.35;
        [_classCollectView addSubview:verticalLine];
        
        didAddSperateVerticalLine = YES;
    }
    UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_classCollectView.frame)/4 * row , contentSize.width, 1)];//每一个cell的framee是 17.00, 10.00, 160.00, 160.00  ,
    horizontalLine.backgroundColor = [UIColor lightGrayColor];
    horizontalLine.alpha = 0.35;
    if (row != 0) {
        [_classCollectView addSubview:horizontalLine];
    }
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kScreenWidth/2, 200/PxHeight);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark --UICollectionViewDelegate


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsModel *aGood = _RecommendGoodsArr[indexPath.row];
    [[GoodsDateTolls shareGetGoodsDate]GoodsDetailWithGoodsId:aGood.GoodsId UserId:[LoginDataTools shareGetLoginDate].userModel.UserId WithReturnValeuBlock:^(id code) {
        dispatch_async(dispatch_get_main_queue(), ^{
            GoodViewController *gv = [[GoodViewController alloc]init];
            gv.aGoodsDetaile = code;
            [self.navigationController pushViewController:gv animated:YES];
        });
    } WithFailureBlock:^(NSError *error) {
        
    }];
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)foodButtonAction:(id)sender{
    XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
    pageViewController.typeString = @"用户评价";
    pageViewController.dataSource = self;
    pageViewController.index = 0;
    [self.navigationController pushViewController:pageViewController animated:YES];
}

- (NSInteger)numberOfPages {
    return _numberOfPages;
}

- (NSString*)titleOfPage:(NSInteger)page {
    NSString *titleStr = [NSString string];
    switch (page) {
        case 0:
            titleStr = @"全部";
            break;
        case 1:
            titleStr = @"晒图";
            break;
        case 2:
            titleStr = @"低分";
            break;
        case 3:
            titleStr = @"最新";
            break;
        default:
            break;
    }
    
    return titleStr;
}

- (UIViewController*)constrollerOfPage:(NSInteger)page {
    EvaluationTableViewController *ec = [[EvaluationTableViewController alloc]init];
    NSString *type = [NSString string];
    if (page == 0) {
        ec.isAll = YES;
        type = @"";
    }else {
        ec.isAll = NO;
        type = [NSString stringWithFormat:@"%ld",page];
    }
    [[GoodsDateTolls shareGetGoodsDate]SelectGoodsCommentWithGoodsId:_aGoodsDetaile.GoodsId Type:type CommentTypeId:@"" pageIndex:1 pageSize:5 WithReturnValeuBlock:^(id code) {
        ec.dataArr = code;
        [[GoodsDateTolls shareGetGoodsDate]SelectCommentTypeWithApplyShopsId:_aGoodsDetaile.ApplyShopsId WithReturnValeuBlock:^(id code) {
            ec.typeArr = code;
            dispatch_async(dispatch_get_main_queue(), ^{
                [ec.tableView reloadData];
            });
        } WithFailureBlock:^(NSError *error) {
            
        }];
    } WithFailureBlock:^(NSError *error) {
        
    }];
    return ec;
}

#pragma mark -- UIDate
-(void)p_data{
    _imageArr = [NSMutableArray array];
    for (NSString *str in _aGoodsDetaile.ImageDetails) {
        [_imageArr addObject:[NSString stringWithFormat:@"%@%@",URL_f_b,str]];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _aGoodsDetaile.GoodsParameters.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55/PxHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *tempDict = _aGoodsDetaile.GoodsParameters[indexPath.row];
    
    UILabel * titleLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 15/PxHeight, 160/PxWidth, 40/PxHeight) title:[tempDict objectForKey:@"ParameterName"] tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [cell addSubview:titleLabel];
    
    UILabel * textLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), CGRectGetMinY(titleLabel.frame), CGRectGetWidth(titleLabel.frame), CGRectGetHeight(titleLabel.frame)) title:[tempDict objectForKey:@"ParameterExplain"]  tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [cell addSubview:textLabel];

    
    return cell;
}


//显示提示框
- (void)p_showAlertView:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
