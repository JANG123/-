//
//  FarmHouseViewController.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "FarmHouseViewController.h"
#import "StoreView.h"
#import "OrderTableViewController.h"

@interface FarmHouseViewController ()<UIScrollViewDelegate,XTPageViewControllerDataSource,EvaluationTableDelegate>
@property (nonatomic,strong)UIScrollView *backView; //背景ScrollView

@property (nonatomic,strong)SDCycleScrollView *mainCycleScrollView;//轮播图

@property (nonatomic,strong)NSMutableArray *imageArr; //商品轮播图，未加载，显示本地图片

@property (nonatomic,strong)NSMutableArray *mainGoodArr; //商品轮播图

@property (nonatomic,strong)StoreView *sv; //店铺信息View

@property (nonatomic,strong)UILabel *priceLabel; //轮播图 商品价格

@property (nonatomic,strong)UILabel *recommenTextLabel; //独家推荐

@property (nonatomic,strong)EvaluationTable *evaluationTableView;//评价信息

@property (nonatomic,strong)UIButton *collectionButton; //收藏

@property (nonatomic,strong)UIButton *buyButton; //购买

@property (nonatomic,strong)UIButton *reservationButton; //预定

@end

@implementation FarmHouseViewController

-(void)loadView{
    _backView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _backView.backgroundColor = [UIColor clearColor];
    _backView.scrollEnabled = YES;
    _backView.delegate = self;
    _backView.contentSize = CGSizeMake(0, kScreenHeight*1.5);
    self.view = _backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    rectNav = self.navigationController.navigationBar.frame;
    
    [self drawNav];// 自定义 navigation
    
    // 修改navigation透明度
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    //初始化轮播图
    [self drawCycleScrollView];
    
    //加载页面
    [self drawView];

}

//滑动顶部改变navigation透明效果
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
    
    //底部button 保持相对位置不变
    if (offsetY > -K_rectNav-K_rectStatus) {
        _collectionButton.frame =  CGRectMake(0, kScreenHeight - 75/PxHeight + offsetY , kScreenWidth/3, 75/PxHeight);
    }else{
        _collectionButton.frame =  CGRectMake(0, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/3, 75/PxHeight);
    }
    
    _buyButton.frame =  CGRectMake(CGRectGetMaxX(_collectionButton.frame), CGRectGetMinY(_collectionButton.frame), kScreenWidth/3, 75/PxHeight);
    
    _reservationButton.frame = CGRectMake(CGRectGetMaxX(_buyButton.frame), CGRectGetMinY(_buyButton.frame), kScreenWidth/3, 75/PxHeight);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    //进入页面修改 navigation 字体颜色，及背景
    KFontColor_NavWhite
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //离开页面修改 navigation 字体颜色，及背景
    KFontColor_NavBlackColor
    
    [self.navigationController.navigationBar lt_reset];
}

// 自定义 navigation
-(void)drawNav{
    self.navigationItem.title = @"莽山原生态农家乐园";
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}

//初始化轮播图
-(void)drawCycleScrollView{
    if (_imageArr.count == 0) {
        // 主循环滚动图
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1f.png"],[UIImage imageNamed:@"2f.png"],[UIImage imageNamed:@"3f.png"],[UIImage imageNamed:@"4f.png"],[UIImage imageNamed:@"5f.png"], nil];
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -rectNav.size.height-rectStatus.size.height, kScreenWidth, 280/PxHeight) imagesGroup:tempArr];
        [self.view addSubview:_mainCycleScrollView];
    }else{
        
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -rectNav.size.height, kScreenWidth, 280/PxHeight) imageURLStringsGroup:_imageArr];
        [self.view addSubview:_mainCycleScrollView];
    }
    
    UIImageView *logoView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 100/PxWidth, 240/PxHeight, 25/PxWidth, 25/PxWidth)];
    logoView.image = [UIImage imageNamed:@"钱"];
    [_mainCycleScrollView addSubview:logoView];
    
    _priceLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(logoView.frame), CGRectGetMinY(logoView.frame), 100/PxWidth, CGRectGetHeight(logoView.frame)) title:@"88/人" tintColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    [_mainCycleScrollView addSubview:_priceLabel];
}

//加载页面
-(void)drawView{
    _sv = [[StoreView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainCycleScrollView.frame), kScreenWidth, 172/PxHeight)];
    _sv.storeNameLabel.text = @"莽山原生态农家乐园";
    [self.view addSubview:_sv];
    
    UILabel *recommendLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_sv.frame) + 5/PxHeight, kScreenWidth/2, 40/PxHeight) title:@"独家推荐" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17.0]];
    [self.view addSubview:recommendLabel];
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(recommendLabel.frame), kScreenWidth, 1)];
    lineLabel.backgroundColor = Color_back;
    [self.view addSubview:lineLabel];
    NSString *str = @"独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐\n独家推荐独家推荐独家推荐独家推荐";
    _recommenTextLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(lineLabel.frame), kScreenWidth - 50/PxWidth, 20/PxHeight + [UILabel heightForString:str font:[UIFont systemFontOfSize:14.0] Width:kScreenWidth - 50/PxWidth]) title:str tintColor:[UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:14.0]];
    _recommenTextLabel.numberOfLines = 0;
    [self.view addSubview:_recommenTextLabel];
    
    //用户评价
    _evaluationTableView = [[EvaluationTable alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_recommenTextLabel.frame), kScreenWidth, 600/PxHeight)];
    [self.view addSubview:_evaluationTableView];
    _evaluationTableView.type = YES;
    _evaluationTableView.delegate = self;
    _evaluationTableView.tableView.scrollEnabled = NO;
    [self.view addSubview:_evaluationTableView];
    
    
    _collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _collectionButton.frame = CGRectMake(0, kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/3, 75/PxHeight);
    _collectionButton.backgroundColor = Color_back;
    [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
    [self.view addSubview:_collectionButton];
    
    _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _buyButton.frame = CGRectMake(CGRectGetMaxX(_collectionButton.frame), kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/3, 75/PxHeight);
    _buyButton.backgroundColor = [UIColor colorWithRed:241/255.0 green:101/255.0 blue:97/255.0 alpha:1.0];
    [_buyButton setTitle:@"点菜" forState:UIControlStateNormal];
    [_buyButton addTarget:self action:@selector(buyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buyButton];
    
    _reservationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _reservationButton.frame = CGRectMake(CGRectGetMaxX(_buyButton.frame), kScreenHeight - rectNav.size.height - rectStatus.size.height - 75/PxHeight, kScreenWidth/3, 75/PxHeight);
    _reservationButton.backgroundColor = Color_indigo;
    [_reservationButton setTitle:@"立即预定" forState:UIControlStateNormal];
    [self.view addSubview:_reservationButton];
}


-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

//进入点菜界面
-(void)buyButtonAction:(UIButton *)sender{
    _numberOfPages = 4;
    type = YES;
    XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
    pageViewController.dataSource = self;
    pageViewController.typeString = @"点菜";
    pageViewController.index = 0;
    [self.navigationController pushViewController:pageViewController animated:YES];
}

- (NSInteger)numberOfPages {
    return _numberOfPages;
}

- (NSString*)titleOfPage:(NSInteger)page {
    NSString *titleStr = [NSString string];
    if (type) {
        switch (page) {
            case 0:
                titleStr = @"主食";
                break;
            case 1:
                titleStr = @"凉菜";
                break;
            case 2:
                titleStr = @"甜点";
                break;
            case 3:
                titleStr = @"饮料";
                break;
            default:
                break;
        }
    }else{
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
    }

    return titleStr;
}

- (UIViewController*)constrollerOfPage:(NSInteger)page {
    if (type) {
        OrderTableViewController *orderVC = [[OrderTableViewController alloc]init];
        return orderVC;
    }else{
        EvaluationTableViewController *ec = [[EvaluationTableViewController alloc]init];
        if (page == 0) {
            ec.isAll = YES;
        }else{
            ec.isAll = NO;
        }
        return ec;
    }
}

//用户评价详情页
-(void)foodButtonAction:(id)sender{
    type = NO;
    _numberOfPages = 4;
    XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
    pageViewController.typeString = @"用户评价";
    pageViewController.dataSource = self;
    [self.navigationController pushViewController:pageViewController animated:YES];
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
