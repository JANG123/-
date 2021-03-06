//
//  HotelTableViewController.m
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "HotelTableViewController.h"
#import "HoteTableViewCell.h"
#import "ClassViewController.h"
#import "HotelViewController.h"
@interface HotelTableViewController ()
@property (nonatomic,strong)UIButton *dateButton;
@property (nonatomic,strong)UIButton *searchButton;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation HotelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HoteTableViewCell class] forCellReuseIdentifier:@"HoteTableViewCell"];
    [self p_addButton];
    self.view.backgroundColor = Color_back;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _Offset = 0;
    [self p_data];
}

-(void)p_data{
    _dataArr = [NSMutableArray array];
    [[GoodsDateTolls shareGetGoodsDate]GetShopListWithEcologicalId:@"3" pageIndex:1 pageSize:10 WithReturnValeuBlock:^(id code) {
        _dataArr = code;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } WithFailureBlock:^(NSError *error) {
        
    }];
}

-(void)p_addButton{
    
    _dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _dateButton.frame = CGRectMake(155/PxWidth, kScreenHeight - 150/PxHeight - K_rectNav - K_rectStatus, 60/PxHeight, 60/PxHeight);
    [_dateButton setImage:[UIImage imageNamed:@"日期"] forState:UIControlStateNormal];
    [_dateButton addTarget:self action:@selector(dateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dateButton];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.frame = CGRectMake(CGRectGetMaxX(_dateButton.frame) + 112/PxWidth, CGRectGetMinY(_dateButton.frame), 60/PxHeight, 60/PxHeight);
    [_searchButton setImage:[UIImage imageNamed:@"分类"] forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(searchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
}

-(void)dateButtonAction:(UIButton *)sender{
    ZFChooseTimeViewController * vc =[ZFChooseTimeViewController new];
    
    [vc backDate:^(NSArray *goDate, NSArray *backDate) {
        
        NSString *time = [NSString stringWithFormat:@"%@ : %@",[goDate componentsJoinedByString:@"-"],[backDate componentsJoinedByString:@"-"]];
        NSLog(@"%@",time);
        
    }];
    
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)searchButtonAction:(UIButton *)sender{

    ClassViewController *cv =[ClassViewController new];
    [self presentViewController:cv animated:YES completion:nil];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        _dateButton.frame = CGRectMake(155/PxWidth, kScreenHeight - 150/PxHeight - K_rectNav - K_rectStatus + offsetY, 60/PxHeight, 60/PxHeight);
        _searchButton.frame = CGRectMake(CGRectGetMaxX(_dateButton.frame) + 112/PxWidth, CGRectGetMinY(_dateButton.frame), 60/PxHeight, 60/PxHeight);
    }else{
        _dateButton.frame = CGRectMake(155/PxWidth, kScreenHeight - 150/PxHeight - K_rectNav - K_rectStatus, 60/PxHeight, 60/PxHeight);
        _searchButton.frame = CGRectMake(CGRectGetMaxX(_dateButton.frame) + 112/PxWidth, CGRectGetMinY(_dateButton.frame), 60/PxHeight, 60/PxHeight);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230/PxHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelModel *aHotel = _dataArr[indexPath.row];
    
    HoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HoteTableViewCell" forIndexPath:indexPath];
    if(!cell) {
        cell = [[HoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HoteTableViewCell"];
    }

    UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-50, 0, kScreenWidth, 230/PxHeight)];
    [goodImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_f_b,aHotel.ShopImage]]];
    [cell setBackgroundView:goodImageView];

    cell.nameLabel.text = aHotel.ShopName;
    cell.titleLabel.text = aHotel.ShopDescribe;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@",aHotel.ConsumptionAmount];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.tuijianImageView.hidden = NO;
    }else{
        cell.tuijianImageView.hidden = YES;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotelViewController *hv = [[HotelViewController alloc]init];
    [self.navigationController pushViewController:hv animated:YES];
}

//tableView的代理方法。
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.row > _Offset) {
        
        cell.center = CGPointMake(cell.center.x, cell.center.y + Animation_Y/PxHeight);
        POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anBasic.toValue = @(cell.center.y - Animation_Y/PxHeight);
        anBasic.beginTime = CACurrentMediaTime();
        [cell pop_addAnimation:anBasic forKey:@"position"];
    }
    
     _Offset = indexPath.row ;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
