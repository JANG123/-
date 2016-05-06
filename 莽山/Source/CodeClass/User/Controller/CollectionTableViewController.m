//
//  CollectionTableViewController.m
//  莽山
//
//  Created by jang on 16/4/28.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "CollectionTableViewController.h"
#import "CollectionGoodTableViewCell.h"
#import "CollectionStoreTableViewCell.h"
@interface CollectionTableViewController ()
@property (nonatomic,assign)NSInteger cellInterger;
@end

@implementation CollectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[CollectionGoodTableViewCell class] forCellReuseIdentifier:@"CollectionGoodTableViewCell"];
    [self.tableView registerClass:[CollectionStoreTableViewCell class] forCellReuseIdentifier:@"CollectionStoreTableViewCell"];
    
    _cellInterger = 5;
    removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    removeButton.frame =  CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus, kScreenWidth, 75/PxWidth);
    removeButton.backgroundColor = Color_back;
    [removeButton setTitle:@"删除" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(rightBtnPressedWithSure:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];
    removeButton.hidden = YES;
    self.tableView.delegate = self;
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
    return _cellInterger;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_typeStr isEqualToString:@"商品"]) {
        CollectionGoodTableViewCell *cell=nil;
        if (cell==nil) {
            cell= [tableView dequeueReusableCellWithIdentifier:@"CollectionGoodTableViewCell" forIndexPath:indexPath];
        }else{
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        return cell;
 
    }else{
        CollectionStoreTableViewCell *cell=nil;
        if (cell==nil) {
            cell= [tableView dequeueReusableCellWithIdentifier:@"CollectionStoreTableViewCell" forIndexPath:indexPath];
        }else{
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        return cell;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200/PxHeight;
}

//添加一项
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        [self.selectedDic addObject:indexPath];
        if (self.selectedDic.count > 0) {
            removeButton.backgroundColor = [UIColor redColor];
            [removeButton setTitle:[NSString stringWithFormat:@"删除(%d)",self.selectedDic.count] forState:UIControlStateNormal];
        }else{
            removeButton.backgroundColor = Color_back;
            [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        }
    }
}

//取消一项
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        [self.selectedDic removeObject:indexPath];
        if (self.selectedDic.count > 0) {
            removeButton.backgroundColor = [UIColor redColor];
            [removeButton setTitle:[NSString stringWithFormat:@"删除(%d)",self.selectedDic.count] forState:UIControlStateNormal];
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
    //    return UITableViewCellEditingStyleDelete;
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    _cellInterger = _cellInterger -1;
//    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//}

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

@end
