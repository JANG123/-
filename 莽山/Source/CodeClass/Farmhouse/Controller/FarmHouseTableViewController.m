//
//  FarmHouseTableViewController.m
//  莽山
//
//  Created by jang on 16/4/19.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "FarmHouseTableViewController.h"
#import "FarmHouseTableViewCell.h"
#import "FarmHouseViewController.h"
@interface FarmHouseTableViewController ()
@property (nonatomic,strong)NSMutableArray *dataArr;//酒店数据
@end

@implementation FarmHouseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FarmHouseTableViewCell class] forCellReuseIdentifier:@"FarmHouseTableViewCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self p_data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)p_data{
    _dataArr = [NSMutableArray array];
    [[GoodsDateTolls shareGetGoodsDate]GetShopListWithEcologicalId:@"2" pageIndex:1 pageSize:10 WithReturnValeuBlock:^(id code) {
        _dataArr = code;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } WithFailureBlock:^(NSError *error) {
    
    }];
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
    FarmHouseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FarmHouseTableViewCell" forIndexPath:indexPath];
    if(!cell) {
        cell = [[FarmHouseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FarmHouseTableViewCell"];
    }
    FarmHouseModel *aFaemHouse = _dataArr[indexPath.row];
    
    //商品背景图
    UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-50, 0, kScreenWidth, 230/PxHeight)];
    [goodImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_f_b,aFaemHouse.ShopImage]]];
    [cell setBackgroundView:goodImageView];
    
    //商品名
    cell.nameLabel.text = aFaemHouse.ShopName;
    
    //商品介绍
    cell.titleLabel.text = aFaemHouse.ShopDescribe;
    
    //商品价格
    cell.priceLabel.text = [NSString stringWithFormat:@"%@/人",aFaemHouse.ConsumptionAmount];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //进入详情页
    FarmHouseViewController *fv = [[FarmHouseViewController alloc]init];
    [self.navigationController pushViewController:fv animated:YES];
}


//tableView的代理方法。
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //tableview 向下滑动加载，出现动画效果
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
