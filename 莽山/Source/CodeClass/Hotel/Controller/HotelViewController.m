//
//  HotelViewController.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "HotelViewController.h"
#import "HotelView.h"
#import "IntroductionView.h"
#import "ChooseRoomView.h"
#import "RoomTypeButton.h"
#import "DatePickView.h"
#import "SurroundTableViewController.h"
@interface HotelViewController ()<UIScrollViewDelegate,HotelViewDelegate,EvaluationTableDelegate,XTPageViewControllerDataSource> {
    NSInteger _numberOfPages;
}

@property (nonatomic,strong)UIScrollView *backView;
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)NSMutableArray *mainGoodArr;
@property (nonatomic,strong)HotelView *hv;
@property (nonatomic,strong)IntroductionView *iv;//简介
@property (nonatomic,strong)UILabel *containsLabel;//
@property (nonatomic,strong)UIButton *buyButton;
@property (nonatomic,strong)UIButton *collectionButton;
@property (nonatomic,strong)UILabel *priceContainsLabel;
@property (nonatomic,strong)ChooseRoomView *cv;
@property (nonatomic,strong)UIView *backgroundView;
@property (nonatomic,strong)UIView *backgroundView2;
@property (nonatomic,strong)UIView *backgroundView3;
@property (nonatomic,strong)UIView *backgroundView4;
@property (nonatomic,strong)DatePickView *datePick;
@property (nonatomic,strong)EvaluationTable *evaluationTableView;
@end

@implementation HotelViewController

-(void)loadView{
    _backView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.scrollEnabled = YES;
    _backView.delegate = self;
    self.view = _backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawNav];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self drawCycleScrollView];
    [self drawView];
    [self drawIntroductionView];
    _numberOfPages = 4;
}

-(void)drawNav{
    self.navigationItem.title = @"莽山原生态酒店";
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
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1h"],[UIImage imageNamed:@"2h"],[UIImage imageNamed:@"3h"],[UIImage imageNamed:@"4h"],[UIImage imageNamed:@"2h"], nil];
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -K_rectNav-K_rectStatus, kScreenWidth, 280/PxHeight) imagesGroup:tempArr];
        [self.view addSubview:_mainCycleScrollView];
    }else{
        
        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -K_rectNav-K_rectStatus, kScreenWidth, 280/PxHeight) imageURLStringsGroup:_imageArr];
        [self.view addSubview:_mainCycleScrollView];
    }
}

-(void)titleButtonAction:(id)sender{
    [_hv.headButton1 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_hv.headButton2 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_hv.headButton3 setTitleColor:[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0] forState:UIControlStateNormal];
    _hv.greenLabel1.backgroundColor = [UIColor whiteColor];
    _hv.greenLabel2.backgroundColor = [UIColor whiteColor];
    _hv.greenLabel3.backgroundColor = [UIColor whiteColor];
    
    if (sender == _hv.headButton1) {
        [_hv.headButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _hv.greenLabel1.backgroundColor = Color_indigo;
        _iv.hidden = NO;
        _priceContainsLabel.hidden = YES;
        _evaluationTableView.hidden = YES;
        _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_hv.frame) + 75/PxHeight);
        
    }if (sender == _hv.headButton2) {
        [_hv.headButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _iv.hidden = YES;
        _priceContainsLabel.hidden = NO;
        _evaluationTableView.hidden = YES;
        _hv.greenLabel2.backgroundColor = Color_indigo;
        _backView.contentSize = CGSizeMake(0, 0);
    }if (sender == _hv.headButton3) {
        [_hv.headButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _hv.greenLabel3.backgroundColor = Color_indigo;
        _iv.hidden = YES;
        _priceContainsLabel.hidden = YES;
        _evaluationTableView.hidden = NO;
        
        _evaluationTableView.frame = CGRectMake(0, CGRectGetMaxY(_hv.headButton1.frame), kScreenWidth, 700/PxHeight);
        _evaluationTableView.tableView.frame = CGRectMake(0, 0, kScreenWidth, 700/PxHeight);
        _evaluationTableView.tableView.scrollEnabled = NO;
        
        _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_evaluationTableView.frame) + 75/PxHeight + 280/PxHeight);
    }
}

-(void)drawView{
    _hv = [[HotelView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainCycleScrollView.frame), kScreenWidth, kScreenHeight)];
    _hv.delegate = self;
    [self.view addSubview:_hv];
}

-(void)drawIntroductionView{
    _iv = [[IntroductionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_hv.headButton1.frame), kScreenWidth, 500)];
    [self.hv addSubview:_iv];
    
    _hv.frame = CGRectMake(0, CGRectGetMaxY(_mainCycleScrollView.frame), kScreenWidth, CGRectGetMaxY(_iv.frame));
    
    [_iv.dateButton addTarget:self action:@selector(datePickViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _priceContainsLabel = [UILabel setFrame:CGRectMake(25/PxWidth, CGRectGetMaxY(_hv.headButton1.frame) + 20/PxHeight, kScreenWidth/2 - 25/PxWidth, 20/PxHeight) title:@"日常服务以酒店提供为准" tintColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:12.0]];
    _priceContainsLabel.numberOfLines = 0;
    [self.hv addSubview:_priceContainsLabel];
    _priceContainsLabel.hidden = YES;
    
    _evaluationTableView = [[EvaluationTable alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_hv.headButton1.frame), kScreenWidth, 250/PxHeight)];
    [self.hv addSubview:_evaluationTableView];
    _evaluationTableView.hidden = YES;
    _evaluationTableView.type = YES;
    _evaluationTableView.delegate = self;
    
    
    _collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _collectionButton.frame = CGRectMake(0, kScreenHeight - 75/PxHeight - 280/PxHeight, kScreenWidth/2, 75/PxHeight);
    _collectionButton.backgroundColor = Color_back;
    [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
    [self.hv addSubview:_collectionButton];
    
    _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _buyButton.frame = CGRectMake(kScreenWidth/2, CGRectGetMinY(_collectionButton.frame), kScreenWidth/2, 75/PxHeight);
    _buyButton.backgroundColor = Color_indigo;
    [_buyButton setTitle:@"立即预定" forState:UIControlStateNormal];
    [self.hv addSubview:_buyButton];

    _backView.contentSize = CGSizeMake(0, CGRectGetMaxY(_hv.frame) + 75/PxHeight);
}


-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

//查看日期
-(void)datePickViewAction:(UIButton *)sender{
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 73/PxHeight)];
    _backgroundView.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
    _backgroundView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.6];
    [self.view.window addSubview:_backgroundView];
    
    _backgroundView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 73/PxHeight, 27/PxWidth, kScreenHeight - 146/PxHeight)];
    _backgroundView2.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
    _backgroundView2.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.6];
    [self.view.window addSubview:_backgroundView2];
    
    _backgroundView3 = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 73/PxHeight, kScreenWidth, 73/PxHeight)];
    _backgroundView3.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
    _backgroundView3.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.6];
    [self.view.window addSubview:_backgroundView3];
    
    _backgroundView4 = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth - 27/PxWidth, 73/PxHeight, 27/PxWidth, kScreenHeight - 146/PxHeight)];
    _backgroundView.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
    _backgroundView4.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.6];
    [self.view.window addSubview:_backgroundView4];
    
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(datePickViewdissMiss)];
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(datePickViewdissMiss)];
    UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(datePickViewdissMiss)];
    UITapGestureRecognizer *singleTap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(datePickViewdissMiss)];
    [_backgroundView addGestureRecognizer:singleTap1];
    [_backgroundView2 addGestureRecognizer:singleTap2];
    [_backgroundView3 addGestureRecognizer:singleTap3];
    [_backgroundView4 addGestureRecognizer:singleTap4];

    
    _datePick = [[DatePickView alloc]initWithFrame:CGRectMake(27/PxWidth, 73/PxHeight, kScreenWidth - 54/PxWidth, kScreenHeight - 146/PxHeight)];
    [self.view.window addSubview:_datePick];
}

-(void)datePickViewdissMiss{
    [_datePick removeFromSuperview];
    [_backgroundView removeFromSuperview];
    [_backgroundView2 removeFromSuperview];
    [_backgroundView3 removeFromSuperview];
    [_backgroundView4 removeFromSuperview];
}

//选择日期
-(void)dataButtonAction:(id)sender{
    ZFChooseTimeViewController * vc =[ZFChooseTimeViewController new];
    
    [vc backDate:^(NSArray *goDate, NSArray *backDate) {
        
        NSString *time = [NSString stringWithFormat:@"%@ : %@",[goDate componentsJoinedByString:@"-"],[backDate componentsJoinedByString:@"-"]];
        NSLog(@"%@",time);
        
    }];
    
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

//选择房型
-(void)chooseAction:(id)sender{
    _backgroundView = [[UIView alloc] init];
    _backgroundView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 256/PxHeight);
    _backgroundView.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
    _backgroundView.alpha = 0.6;
    [self.view.window addSubview:_backgroundView];
    _cv = [[ChooseRoomView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 256/PxHeight, kScreenWidth, 256/PxHeight)];
    [_cv.typeButton1 addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_cv.typeButton2 addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.window addSubview:_cv];
}

//确定房型
-(void)typeButtonAction:(UIButton *)sender{
    [_backgroundView removeFromSuperview];
    [_cv removeFromSuperview];
}

//查看导航
-(void)mapAction:(id)sender{
    NSLog(@"1234");
}

//周围环境
-(void)surroundAction:(id)sender{
    SurroundTableViewController *sv = [[SurroundTableViewController alloc]init];
    [self.navigationController pushViewController:sv animated:YES];
}

-(void)phoneAction:(id)sender{
    NSLog(@"phone");
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
    
    if (offsetY > -K_rectNav - K_rectStatus) {
        _collectionButton.frame = CGRectMake(0, kScreenHeight - 75/PxHeight - 280/PxHeight + offsetY + K_rectNav + K_rectStatus, kScreenWidth/2, 75/PxHeight);
    }else{
        _collectionButton.frame = CGRectMake(0, kScreenHeight - 75/PxHeight - 280/PxHeight, kScreenWidth/2, 75/PxHeight);
    }
    _buyButton.frame = CGRectMake(kScreenWidth/2, CGRectGetMinY(_collectionButton.frame), kScreenWidth/2, 75/PxHeight);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    KFontColor_NavWhite
    _backView.delegate = self;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    KFontColor_NavBlackColor
    _backView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
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
