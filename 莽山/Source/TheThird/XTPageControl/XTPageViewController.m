//
//  XTPageViewController.m
//  XTPageControl
//
//  Created by imchenglibin on 16/1/26.
//  Copyright © 2016年 xt. All rights reserved.
//  https://github.com/imchenglibin/XTPageControl
//

#import "XTPageViewController.h"
#import "XTTabBar.h"
#import "UserOrderTableViewController.h"
#import "CollectionTableViewController.h"
@interface XTPageViewController() <XTTabBarScrollViewDelegate, UIScrollViewDelegate,UserOrderTableDelegate,UITableViewDelegate>

@property (strong, nonatomic) UIScrollView *pageScrollView;
@property (strong, nonatomic) UIView *underlineView;
@property (strong, nonatomic) XTTabBar *tabBar;
@property (strong, nonatomic) NSMutableDictionary *cachedControllers;
@property (strong, nonatomic) UIViewController *currentController;
@property (assign, nonatomic) XTTabBarStyle style;
@property (assign, nonatomic) NSInteger nextIndex;
@property (assign, nonatomic) NSInteger currentPage;
@property (assign, nonatomic) BOOL forceToShowControllerWhenFirstTime;
@property (assign, nonatomic) BOOL disableScroll;
@property (assign, nonatomic) BOOL isFromTabBarItemWillChanged;
@end

@implementation XTPageViewController

//static CGFloat kXTDefaultTabBarHeight = 45;

- (instancetype)init {
    if (self = [super init]) {
        _style = XTTabBarStyleCursorUnderline;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _style = XTTabBarStyleCursorUnderline;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _style = XTTabBarStyleCursorUnderline;
    }
    return self;
}

- (instancetype)initWithTabBarStyle:(XTTabBarStyle)style {
    if (self = [super init]) {
        _style = style;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup:self.style];
    [self setNav];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor whiteColor]];
}

-(void)setNav{

    
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    if ([_typeString isEqualToString:@"首页"]) {
        [backButton setImage:[UIImage imageNamed:@"我的.png"] forState:UIControlStateNormal];
        
        UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 200, 20)];
        titleText.backgroundColor = [UIColor clearColor];
        [titleText setFont:[UIFont systemFontOfSize:15.0]];
        [titleText setText:@"上海"];
        titleText.textAlignment = NSTextAlignmentCenter;
        self.navigationItem.titleView=titleText;

        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"导航"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction:)];
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];

        
    }else if ([_typeString isEqualToString:@"点菜"]){
        [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
        UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 200, 20)];
        titleText.backgroundColor = [UIColor clearColor];
        [titleText setFont:[UIFont systemFontOfSize:15.0]];
        [titleText setText:@"点菜"];
        titleText.textAlignment = NSTextAlignmentCenter;
        self.navigationItem.titleView=titleText;
    }else if ([_typeString isEqualToString:@"用户评价"] || [_typeString isEqualToString:@"我的收藏"]){
        [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
        UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 200, 20)];
        titleText.backgroundColor = [UIColor clearColor];
        [titleText setFont:[UIFont systemFontOfSize:15.0]];
        [titleText setText:_typeString];
        titleText.textAlignment = NSTextAlignmentCenter;
        self.navigationItem.titleView=titleText;
        if ([_typeString isEqualToString:@"我的收藏"]) {
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction:)];
            self.navigationItem.rightBarButtonItem.tintColor = Color_indigo;
        }
        
    }else if ([_typeString isEqualToString:@"我的订单"]){
        [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
        UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, [UILabel widthForString:@"我的订单" font:[UIFont systemFontOfSize:15.0]] + 10, 20)];
        titleText.backgroundColor = [UIColor clearColor];
        [titleText setFont:[UIFont systemFontOfSize:15.0]];
        [titleText setText:@"我的订单"];
        titleText.textAlignment = NSTextAlignmentCenter;
        UIImageView *navImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleText.frame), 2, 16, 16)];
        navImageView.image = [UIImage imageNamed:@"生态酒店_下拉"];
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(0, 0, CGRectGetWidth(titleText.frame) + 20, 20);
        [titleButton addTarget:self action:@selector(SelectionButton:) forControlEvents:UIControlEventTouchUpInside];
        [titleButton addSubview:titleText];
        [titleButton addSubview:navImageView];
        self.navigationItem.titleView=titleButton;
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction:)];
        self.navigationItem.rightBarButtonItem.tintColor = Color_indigo;
        _osVC = [[OrderSelectionView alloc]initWithFrame:CGRectMake(0, -402/PxHeight + K_rectNav + K_rectStatus, kScreenWidth, 402/PxHeight)];
        [self.view addSubview:_osVC];
    }
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
}
-(void)rightBarAction:(UIBarButtonItem *)sender
{
    if ([_typeString isEqualToString:@"我的订单"]) {
        NSLog(@"%ld",self.currentPage);
        UserOrderTableViewController *tableviewController = [self.cachedControllers objectForKey:@(self.currentPage)];
        [tableviewController rightBarAction];
        
        UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        removeButton.frame = CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus, kScreenWidth, 75/PxWidth);
        removeButton.backgroundColor = Color_back;
        [removeButton setTitle:@"取消" forState:UIControlStateNormal];
        
        if (tableviewController.tableView.editing) {
            self.navigationItem.rightBarButtonItem.title = @"取消";
        }else{
            self.navigationItem.rightBarButtonItem.title = @"编辑";
        }
    }else if ([_typeString isEqualToString:@"我的收藏"]){
        CollectionTableViewController *tableviewController = [self.cachedControllers objectForKey:@(self.currentPage)];
        [tableviewController rightBarAction];
        
        UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        removeButton.frame = CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus, kScreenWidth, 75/PxWidth);
        removeButton.backgroundColor = Color_back;
        [removeButton setTitle:@"取消" forState:UIControlStateNormal];
        
        if (tableviewController.tableView.editing) {
            self.navigationItem.rightBarButtonItem.title = @"取消";
        }else{
            self.navigationItem.rightBarButtonItem.title = @"编辑";
        }
    }else if ([_typeString isEqualToString:@"首页"]){
        MapViewController *mapVC = [[MapViewController alloc]init];
        [self.navigationController pushViewController:mapVC animated:YES];
    }

}

-(void)leftBar{
    if ([_typeString isEqualToString:@"首页"]) {
        if ([LoginDataTools shareGetLoginDate].userModel.LoginId == nil) {
            LoginViewController *loginVC = [[LoginViewController alloc]init];
            [self presentViewController:loginVC animated:YES completion:nil];
        }else{
            UserTableViewController *uv = [[UserTableViewController alloc]init];
            [self.navigationController pushViewController:uv animated:YES];
        }

    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)SelectionButton:(UIButton *)sender{
    if (CGRectGetMinY(_osVC.frame) == K_rectNav + K_rectStatus) {
        [UIView animateWithDuration:0.5 animations:^{
            _osVC.frame = CGRectMake(0, -402/PxHeight + K_rectNav + K_rectStatus, kScreenWidth, 170/PxHeight);
        }];
    }else{
        [self.view bringSubviewToFront:_osVC];
        [UIView animateWithDuration:0.5 animations:^{
            _osVC.frame = CGRectMake(0, K_rectNav + K_rectStatus, kScreenWidth, 402/PxHeight);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [self clearCache];
}

- (void)clearCache {
    [self.cachedControllers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (obj != self.currentController) {
            UIViewController *controller = (UIViewController*)obj;
            [controller willMoveToParentViewController:nil];
            [controller removeFromParentViewController];
            [controller.view removeFromSuperview];
            [controller didMoveToParentViewController:nil];
        }
    }];
    [self.cachedControllers removeAllObjects];
    
    [self.cachedControllers setObject:self.currentController forKey:@(self.currentPage)];
}

- (void)setup:(XTTabBarStyle)style {
    self.view.backgroundColor = [UIColor whiteColor];
    NSAssert(self.dataSource != nil, @"XTPageViewController必须设置dataSource");
    self.nextIndex = _index - 1;
    self.cachedControllers = [NSMutableDictionary dictionary];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (self.parentViewController) {
        self.parentViewController.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tabBarHeight = kXTDefaultTabBarHeight/PxHeight;
    NSInteger numberOfPages = [self.dataSource numberOfPages];
    NSMutableArray *titles = [NSMutableArray array];
    for (NSInteger i=0; i<numberOfPages; i++) {
        [titles addObject:[self.dataSource titleOfPage:i]];
    }
    self.tabBar = [self createTabBar:titles style:style];
    [self.view addSubview:self.tabBar];
    
    self.underlineView = [[UIView alloc] init];
    self.underlineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.underlineView];
    
    self.pageScrollView = [[UIScrollView alloc] init];
    self.pageScrollView.showsHorizontalScrollIndicator = NO;
    self.pageScrollView.showsVerticalScrollIndicator = NO;
    self.pageScrollView.bounces = NO;
    [self.pageScrollView setPagingEnabled:YES];
    self.pageScrollView.delegate = self;
    [self.view addSubview:self.pageScrollView];
    for (int i = 0; i < [self.dataSource numberOfPages]; i++) {
        UIViewController *nextController = [self.dataSource constrollerOfPage:i];
        [nextController willMoveToParentViewController:self];
        [self addChildViewController:nextController];
        [self.pageScrollView addSubview:nextController.view];
        nextController.view.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, self.pageScrollView.bounds.size.height);
        [nextController didMoveToParentViewController:self];
        
        [self.cachedControllers setObject:nextController forKey:@(i)];
    }
   self.forceToShowControllerWhenFirstTime = YES;
    _first = YES;
    _firstNext = YES;
    [self.tabBar moveToIndex:_index];
}

- (XTTabBar*)createTabBar:(NSArray<NSString*>*)titles style:(XTTabBarStyle)style {
    XTTabBar* tabBar = [[XTTabBar alloc] initWithTitles:titles andStyle:style];
    tabBar.tabBarDelegate = self;
    tabBar.forceLeftAligment = self.forceLeftAligment;
    if (self.tabBarCursorColor) {
        tabBar.cursorColor = self.tabBarCursorColor;
    }
    if (self.tabBarTitleColorNormal) {
        tabBar.titleColorNormal = self.tabBarTitleColorNormal;
    }
    if (self.tabBarTitleColorSelected) {
        tabBar.titleColorSelected = self.tabBarTitleColorSelected;
    }
    if (self.tabBarLeftItemView) {
        tabBar.leftItemView = self.tabBarLeftItemView;
    }
    if (self.tabBarRightItemView) {
        tabBar.rightItemView = self.tabBarRightItemView;
    }
    if (self.tabBarBackgroundColor) {
        tabBar.backgroundColor = self.tabBarBackgroundColor;
    }
    return tabBar;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tabBar.frame = CGRectMake(0, [self.topLayoutGuide length], self.view.bounds.size.width, self.tabBarHeight);
    
    self.underlineView.frame = CGRectMake(0, [self.topLayoutGuide length] + self.tabBarHeight, self.view.bounds.size.width, 1.0);
    
    self.pageScrollView.frame = CGRectMake(0, [self.topLayoutGuide length] + self.tabBarHeight + 1.0, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBarHeight - 1.0 - [self.topLayoutGuide length]);
    
    if (self.dataSource) {
        NSInteger numberOfPages = [self.dataSource numberOfPages];
        self.pageScrollView.contentSize = CGSizeMake(numberOfPages * self.pageScrollView.bounds.size.width, self.pageScrollView.bounds.size.height);
        self.pageScrollView.contentOffset = CGPointMake(kScreenWidth * _index, 0);
    }
}

#pragma mark tabbar delegate 
- (void)willChanged:(NSInteger)preIndex nextIndex:(NSInteger)nextIndex {
    if (self.forceToShowControllerWhenFirstTime) {
        self.forceToShowControllerWhenFirstTime = NO;
        self.pageScrollView.scrollEnabled = NO;
        
        if (_index != 0 && _first) {
            for (int i = 0; i < _index + 1; i++) {
                [self showNextController:i];
            }
            _first = NO;
        }else{
         [self showNextController:nextIndex];
        }
    } else {
        if (!self.disableScroll) {
            self.pageScrollView.scrollEnabled = NO;
            self.nextIndex = nextIndex;
            self.isFromTabBarItemWillChanged = YES;
            [self.pageScrollView setContentOffset:CGPointMake(nextIndex * self.pageScrollView.bounds.size.width, 0) animated:YES];
        }
        self.disableScroll = NO;
    }
}

- (void)didChanged:(NSInteger)preIndex nextIndex:(NSInteger)nextIndex {
    self.pageScrollView.scrollEnabled = YES;
}

#pragma mark scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width + .5);
    if (_index != 0 && _firstNext) {
        self.nextIndex = _index;
        _firstNext = NO;
    }
    if (self.nextIndex != -1) {
        [self showNextController:self.nextIndex];
        self.nextIndex = -1;
    } else {
        if (self.currentPage != page && !self.isFromTabBarItemWillChanged) {
            self.disableScroll = YES;
            [self showNextController:page];
            [self.tabBar moveToIndex:page];
        }
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.isFromTabBarItemWillChanged = NO;
}

- (void)showNextController:(NSInteger)nextPage {
    
    
    NSString *CurrentSelectedCViewController = NSStringFromClass([[self getVisibleViewControllerFrom:[self.cachedControllers objectForKey:@(self.currentPage)]] class]);
    if ([CurrentSelectedCViewController isEqualToString:@"UserOrderTableViewController"]) {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        UserOrderTableViewController *tableviewController = [self.cachedControllers objectForKey:@(self.currentPage)];
        //[tableviewController rightBarAction];
        [tableviewController.tableView setEditing:NO animated:YES];
    } else if ([CurrentSelectedCViewController isEqualToString:@"CollectionTableViewController"]){
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        CollectionTableViewController *tableviewController = [self.cachedControllers objectForKey:@(self.currentPage)];
        //[tableviewController rightBarAction];
        [tableviewController.tableView setEditing:NO animated:YES];
    }
    
    self.currentPage = nextPage;

    UIViewController *nextController = [self.cachedControllers objectForKey:@(nextPage)];
    if (nextController == nil) {
        nextController = [self.dataSource constrollerOfPage:nextPage];
        [nextController willMoveToParentViewController:self];
        [self addChildViewController:nextController];
        [self.pageScrollView addSubview:nextController.view];
        nextController.view.frame = CGRectMake(nextPage * self.pageScrollView.bounds.size.width, 0, self.pageScrollView.bounds.size.width, self.pageScrollView.bounds.size.height);
        [nextController didMoveToParentViewController:self];
        
        [self.cachedControllers setObject:nextController forKey:@(nextPage)];
    } else {
        nextController.view.frame = CGRectMake(nextPage * self.pageScrollView.bounds.size.width, 0, self.pageScrollView.bounds.size.width, self.pageScrollView.bounds.size.height);
    }
    self.currentController = nextController;
}

- (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

@end
