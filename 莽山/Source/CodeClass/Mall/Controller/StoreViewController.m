//
//  StoreViewController.m
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreView.h"
#import "GoodCollectionViewCell.h"


@interface StoreViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,EvaluationTableDelegate,XTPageViewControllerDataSource>
@property (nonatomic,strong)UIScrollView *backView;
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)NSMutableArray *mainGoodArr;
@property (nonatomic,strong)StoreView *sv;
@property (nonatomic,strong)UIButton *headButton1;
@property (nonatomic,strong)UIButton *headButton2;
@property (nonatomic,strong)UIButton *headButton3;
@property (nonatomic,strong)UILabel *greenLabel1;
@property (nonatomic,strong)UILabel *greenLabel2;
@property (nonatomic,strong)UILabel *greenLabel3;
@property (nonatomic,strong)UICollectionView *classCollectView;
@property (nonatomic,strong)UIButton *collectionButton;
@end

@implementation StoreViewController

-(void)loadView{
    _backView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _backView.backgroundColor = [UIColor clearColor];
    _backView.scrollEnabled = YES;
    _backView.delegate = self;
    self.view = _backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    rectNav = self.navigationController.navigationBar.frame;
    [self drawNav];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self drawCycleScrollView];
    [self drawView];
    [self drawHeadButton];
    [self p_Collection];
    _numberOfPages = 4;
}

-(void)drawView{
    _sv = [[StoreView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainCycleScrollView.frame), kScreenWidth, 172/PxHeight)];
    [self.view addSubview:_sv];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
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
        _collectionButton.frame =  CGRectMake(0, kScreenHeight - 75/PxHeight + offsetY , kScreenWidth, 75/PxHeight);
    }else{
        _collectionButton.frame =  CGRectMake(0, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth, 75/PxHeight);
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
    self.navigationItem.title = @"农家休闲店";
    //self.navigationController.navigationBar.alpha = 0;
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
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"img-拷贝"],[UIImage imageNamed:@"img-拷贝"],[UIImage imageNamed:@"img-拷贝"],[UIImage imageNamed:@"img-拷贝"],[UIImage imageNamed:@"img-拷贝"], nil];
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -rectNav.size.height-rectStatus.size.height, kScreenWidth, 280/PxHeight) imagesGroup:tempArr];
        [self.view addSubview:_mainCycleScrollView];
    }else{
        
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -rectNav.size.height, kScreenWidth, 280/PxHeight) imageURLStringsGroup:_imageArr];
        [self.view addSubview:_mainCycleScrollView];
    }
}

-(void)drawHeadButton{
    _headButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _headButton1.backgroundColor = [UIColor whiteColor];
    _headButton1.frame = CGRectMake(0, CGRectGetMaxY(_sv.frame), kScreenWidth/3, 50/PxHeight);
    [_headButton1 setTitle:@"商品" forState:UIControlStateNormal];
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
    [_headButton2 setTitle:@"独家介绍" forState:UIControlStateNormal];
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
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)headButtonAction:(UIButton *)sender{
    [_headButton1 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_headButton2 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_headButton3 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _greenLabel1.backgroundColor = [UIColor whiteColor];
    _greenLabel2.backgroundColor = [UIColor whiteColor];
    _greenLabel3.backgroundColor = [UIColor whiteColor];
    
    if (sender == _headButton1) {
        _classCollectView.hidden = NO;
        _evaluationTableView.hidden = YES;
        [_headButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel1.backgroundColor = Color_indigo;
        [_classCollectView reloadData];
    }if (sender == _headButton2) {
        [_headButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel2.backgroundColor = Color_indigo;
        _classCollectView.hidden = YES;
        _evaluationTableView.hidden = YES;
        _backView.contentSize = CGSizeMake(0, 0);
        [_headButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel2.backgroundColor = Color_indigo;
    }if (sender == _headButton3) {
        [_headButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _greenLabel3.backgroundColor = Color_indigo;
        _classCollectView.hidden = YES;
        _evaluationTableView.hidden = NO;
        _evaluationTableView.frame = CGRectMake(0, CGRectGetMaxY(_headButton1.frame), kScreenWidth, 700/PxHeight);
        _evaluationTableView.tableView.frame = CGRectMake(0, 0, kScreenWidth, 700/PxHeight);
        _evaluationTableView.tableView.scrollEnabled = NO;
    }
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
    _collectionButton.frame = CGRectMake(0, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth, 75/PxHeight);
    _collectionButton.backgroundColor = Color_indigo;
    [_collectionButton setTitle:@"收藏店铺" forState:UIControlStateNormal];
    [self.view addSubview:_collectionButton];
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    _classCollectView.frame = CGRectMake(0, CGRectGetMaxY(_headButton1.frame), kScreenWidth, 200/PxHeight * 4);
    _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_headButton1.frame) + 200/PxHeight * 4 + 75/PxHeight);
    return 8;
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

    UIImageView *goodImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 200/PxHeight)];
    goodImage.image = [UIImage imageNamed:@"图层-3"];
    [cell addSubview:goodImage];
    UILabel *gooNameLabel = [UILabel setFrame:CGRectMake(25/PxWidth, 150/PxHeight, kScreenWidth/4 - 25/PxWidth, 50/PxHeight) title:@"茶叶" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:15.0]];
    [cell addSubview:gooNameLabel];
    UILabel *priceLabel =  [UILabel setFrame:CGRectMake(kScreenWidth/2 - CGRectGetMaxX(gooNameLabel.frame), 150/PxHeight, kScreenWidth/4 - 20/PxWidth, 50/PxHeight) title:@"¥188" tintColor:Color_indigo textAlignment:NSTextAlignmentRight font:[UIFont systemFontOfSize:15.0]];
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
    if (page == 0) {
        ec.isAll = YES;
    }else{
        ec.isAll = NO;
    }
    return ec;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
