//
//  SearchViewController.m
//  莽山
//
//  Created by jang on 16/5/10.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
@interface SearchViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>

@property (nonatomic,strong)SearchView *sv;

@property (nonatomic,assign)NSInteger currentIndex;//记录当前的page

@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation SearchViewController

-(void)loadView{
    self.sv = [[SearchView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _sv;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_sv.leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.sv.searchBar.delegate = self;
    
    self.sv.scrollView.delegate = self;//设置代理
    
    [self.sv.page addTarget:self action:@selector(page:) forControlEvents:UIControlEventValueChanged];
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(3/PxWidth, 0, kScreenWidth * 2, 140/PxHeight) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.sv.scrollView addSubview:_collectionView];
    
}

-(void)leftButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [[GoodsDateTolls shareGetGoodsDate]GetShopByNameWithName:searchBar.text pageIndex:1 pageSize:10 WithReturnValeuBlock:^(id code) {
        _searchBlock(@"是");
        dispatch_async(dispatch_get_main_queue(), ^{
            [searchBar resignFirstResponder];
            [self dismissViewControllerAnimated:YES completion:nil];
        });

    } WithFailureBlock:^(NSError *error) {
        
    }];
    

}

#pragma mark 同步scrollView
-(void)page:(UIPageControl *)sender
{
    //动画效果
    [UIView animateWithDuration:0.2 animations:^{
        self.sv.scrollView.contentOffset = CGPointMake(self.sv.frame.size.width*sender.currentPage, 0);
    }];
    if (_currentIndex != self.sv.page.currentPage) {
        
    }
    _currentIndex = self.sv.page.currentPage;
}


#pragma mark 减速的代理方法 同步page
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.sv.page.currentPage = scrollView.contentOffset.x/self.sv.frame.size.width;
    if (_currentIndex != self.sv.page.currentPage) {
        
    }
    _currentIndex = self.sv.page.currentPage;
}

#pragma mark 加载数据
-(void)p_date
{

}



#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 18;
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
    cell.backgroundColor = [UIColor whiteColor];
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(cell.frame), CGRectGetHeight(cell.frame))];
    textLabel.font = [UIFont systemFontOfSize:14.0];
    textLabel.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
    textLabel.text = @"茶叶";
    textLabel.textAlignment = NSTextAlignmentCenter;
    [cell addSubview:textLabel];
    return cell;
}

#pragma mark --UICollectionViewDelegate


#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenWidth - 60/PxWidth)/3, (CGRectGetHeight(_collectionView.frame) - 40/PxHeight)/3);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 10, 10);
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
