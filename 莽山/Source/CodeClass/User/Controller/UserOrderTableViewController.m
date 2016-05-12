//
//  UserOrderTableViewController.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UserOrderTableViewController.h"
#import "OrderUserTableViewCell.h"
#import "ToEvaluateViewController.h"
@interface UserOrderTableViewController ()<UIScrollViewDelegate>
@property (nonatomic,assign)NSInteger cellInterger;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation UserOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[OrderUserTableViewCell class] forCellReuseIdentifier:@"OrderUserTableViewCell"];
    _cellInterger = 5;
    removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    removeButton.frame =  CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus, kScreenWidth, 75/PxWidth);
    removeButton.backgroundColor = Color_back;
    [removeButton setTitle:@"删除" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(rightBtnPressedWithSure:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];
    removeButton.hidden = YES;
    self.tableView.delegate = self;
    [self.tableView setExtraCellLineHidden:self.tableView];
    [self p_data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)p_data{
    _dataArr = [NSMutableArray array];
    NSString *Status = [NSString string];
    switch (_index) {
        case 0:
            Status = @"";
            break;
        case 1:
            Status = @"notpay";
            break;
        case 2:
            Status = @"notsign";
            break;
        case 3:
            Status = @"noteval";
            break;
        default:
            break;
    }
    [[LoginDataTools shareGetLoginDate]UserOrderAllWithOrderStatus:Status pageIndex:1 pageSize:5 ReturnValeuBlock:^(id code) {
        _dataArr = code;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } WithFailureBlock:^(NSError *error) {
        
    }];

}

-(void)viewWillAppear:(BOOL)animated{

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 248/PxHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //OrderModel *aOrder = _dataArr[indexPath.row];
    OrderUserTableViewCell *cell=nil;
    if (cell==nil) {
        cell= [tableView dequeueReusableCellWithIdentifier:@"OrderUserTableViewCell" forIndexPath:indexPath];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    [cell addButton:@"待评价"];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

//添加一项
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        [self.selectedDic addObject:indexPath];
        if (self.selectedDic.count > 0) {
            removeButton.backgroundColor = [UIColor redColor];
            [removeButton setTitle:[NSString stringWithFormat:@"删除(%ld)",self.selectedDic.count] forState:UIControlStateNormal];
        }else{
            removeButton.backgroundColor = Color_back;
            [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        }
    }else{
        ToEvaluateViewController *teVC = [[ToEvaluateViewController alloc]init];
        [self.navigationController pushViewController:teVC animated:YES];
    }
}

//取消一项
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        [self.selectedDic removeObject:indexPath];
        if (self.selectedDic.count > 0) {
            removeButton.backgroundColor = [UIColor redColor];
            [removeButton setTitle:[NSString stringWithFormat:@"删除(%ld)",self.selectedDic.count] forState:UIControlStateNormal];
        }else{
            removeButton.backgroundColor = Color_back;
            [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        }
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

//删除按钮保持相对位置
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        removeButton.frame =  CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus + offsetY, kScreenWidth, 75/PxWidth);
    }else{
        removeButton.frame =  CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus, kScreenWidth, 75/PxWidth);;
    }
}

-(void)rightBarAction
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing) {
        self.selectedDic = [NSMutableArray array];
        removeButton.backgroundColor = Color_back;
        [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        removeButton.hidden = NO;
    }else{
        removeButton.hidden = YES;
    }
    
}


//删除
- (void)rightBtnPressedWithSure:(UIButton *)sender{
    
    if ([sender.titleLabel.text isEqualToString:@"删除"]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"未选择数据" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否确认" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSInteger count = [self.selectedDic count];
            for (int i = 0; i < count; i++) {
                //NSInteger row = [[self.selectedDic objectAtIndex:i] row];
                //[self.dataArray removeObjectAtIndex:row];
                _cellInterger --;
            }
            [self.tableView deleteRowsAtIndexPaths:self.selectedDic withRowAnimation:UITableViewRowAnimationFade];
            [self.selectedDic removeAllObjects];
            removeButton.backgroundColor = Color_back;
            [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
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
