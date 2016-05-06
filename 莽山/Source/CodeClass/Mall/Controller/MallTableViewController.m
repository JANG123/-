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

@end

@implementation MallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self p_data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//数据加载
-(void)p_data{

    [[GoodsDateTolls shareGetGoodsDate]GetPartitionAllWithEcologicalId:@"1" WithReturnValeuBlock:^(id code) {
    
    } WithFailureBlock:^(NSError *error) {
    
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
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
    GoodViewController *gv = [[GoodViewController alloc]init];
    [self.navigationController pushViewController:gv animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat Height;
    switch (indexPath.row) {
        case 0:
            Height = 278/PxHeight;
            break;
        case 1:
            Height = 472/PxHeight;
            break;
        case 2:
            Height = 472/PxHeight;
            break;
        case 3:
            Height = 472/PxHeight;
            break;
        case 4:
            Height = 472/PxHeight;
            break;
        default:
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
