//
//  MallTableViewController.m
//  莽山
//
//  Created by jang on 16/4/21.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "MallTableViewController.h"
#import "MallView.h"
#import "TypeDetailsView.h"
#import "DetailsTableViewController.h"
#import "GoodViewController.h"
@interface MallTableViewController ()<TypeDetailsViewDelegate>
@property (nonatomic,strong)NSArray *idArr;
@end

@implementation MallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _idArr = [NSArray array];
    [self p_data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//数据加载
-(void)p_data{

    [[GoodsDateTolls shareGetGoodsDate]GetPartitionAllWithEcologicalId:@"1" WithReturnValeuBlock:^(id code) {
        _idArr = code;
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

    return _idArr.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=nil;
    if (cell==nil) {
        cell= [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    
    if (indexPath.row == 0) {
        MallView *mv = [[MallView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 278/PxHeight)];
        [self p_addTarget:mv];
        [cell addSubview:mv];
    }else{
        TypeDetailsView *typeDetailsView = [[TypeDetailsView alloc]initWithFrame:CGRectMake(0, 18/PxHeight, kScreenWidth, 454/PxHeight)];
        typeDetailsView.delegate = self;
        typeDetailsView.titleLabel.text = [_idArr[indexPath.row -1] objectForKey:@"PartitionName"];
        [[GoodsDateTolls shareGetGoodsDate] ListGoodsWithName:@"" OrderName:@"" TypeId:@"" pageIndex:@"" pageSize:@"5" ShopId:@"" EcologicalId:@"1" PartitionId:[_idArr[indexPath.row -1] objectForKey:@"PartitionId"] WithReturnValeuBlock:^(id code) {
            NSArray *arr = code;
            if (arr.count<5) {
                for (int i = 5; i > arr.count; i--) {
                    switch (i) {
                        case 1:typeDetailsView.good1ImageView.image = [UIImage imageNamed:@"更多产品.png"];
                            break;
                        case 2:typeDetailsView.good2ImageView.image = [UIImage imageNamed:@"更多产品.png"];
                            break;
                        case 3:typeDetailsView.good3ImageView.image = [UIImage imageNamed:@"更多产品.png"];
                            break;
                        case 4:typeDetailsView.good4ImageView.image = [UIImage imageNamed:@"更多产品.png"];
                            break;
                        case 5:typeDetailsView.good5ImageView.image = [UIImage imageNamed:@"更多产品.png"];
                            break;
                        default:
                            break;
                    }
                }
            }
            for (int i =0; i < arr.count; i++) {
                switch (i) {
                    case 0:
                    {
                        typeDetailsView.singleTap1.goodInfo = arr[i];
                        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_f_b,typeDetailsView.singleTap1.goodInfo.ImagePath];
                        [typeDetailsView.good1ImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
                    }
                        break;
                    case 1:
                    {
                        typeDetailsView.singleTap2.goodInfo = arr[i];
                        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_f_b,typeDetailsView.singleTap2.goodInfo.ImagePath];
                        [typeDetailsView.good2ImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
                    }
                        break;
                    case 2:
                    {
                        typeDetailsView.singleTap3.goodInfo = arr[i];
                        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_f_b,typeDetailsView.singleTap3.goodInfo.ImagePath];
                        [typeDetailsView.good3ImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
                    }
                        break;
                    case 3:
                    {
                        typeDetailsView.singleTap4.goodInfo = arr[i];
                        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_f_b,typeDetailsView.singleTap4.goodInfo.ImagePath];
                        [typeDetailsView.good4ImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
                    }
                        break;
                    case 4:
                    {
                        typeDetailsView.singleTap5.goodInfo = arr[i];
                        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",URL_f_b,typeDetailsView.singleTap5.goodInfo.ImagePath];
                        [typeDetailsView.good5ImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
                    }
                        break;
                    default:
                        break;
                }
            }
        } WithFailureBlock:^(NSError *error) {
            
        }];
        [cell addSubview:typeDetailsView];
    }
    cell.backgroundColor = Color_back;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)p_addTarget:(MallView *)mallView{
    [mallView.type1View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mallView.type2View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mallView.type3View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mallView.type4View.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)typeButtonAction:(UIButton *)sender{
    DetailsTableViewController *dv = [[DetailsTableViewController alloc]init];
    [self.navigationController pushViewController:dv animated:YES];
}

-(void)shareImageAction:(id)sender{
    UIGestureRecognizer *singleTap = sender;
    if (singleTap.goodInfo.GoodsId.length > 0) {
        [[GoodsDateTolls shareGetGoodsDate]GoodsDetailWithGoodsId:singleTap.goodInfo.GoodsId UserId:[LoginDataTools shareGetLoginDate].userModel.UserId WithReturnValeuBlock:^(id code) {
            GoodViewController *gv = [[GoodViewController alloc]init];
            gv.aGoodsDetaile = code;
            [self.navigationController pushViewController:gv animated:YES];
        } WithFailureBlock:^(NSError *error) {
            
        
        }];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat Height;
    switch (indexPath.row) {
        case 0:
            Height = 278/PxHeight;
            break;
        default:
            Height = 472/PxHeight;
            break;
    }
    return Height;
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
