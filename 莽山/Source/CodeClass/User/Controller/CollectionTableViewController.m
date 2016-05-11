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
#import "GoodViewController.h"
@interface CollectionTableViewController ()
@property (nonatomic,assign)NSInteger cellInterger;
@end

@implementation CollectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[CollectionGoodTableViewCell class] forCellReuseIdentifier:@"CollectionGoodTableViewCell"];
    [self.tableView registerClass:[CollectionStoreTableViewCell class] forCellReuseIdentifier:@"CollectionStoreTableViewCell"];
    [self.tableView setExtraCellLineHidden:self.tableView];
    
    _cellInterger = 5;
    removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    removeButton.frame =  CGRectMake(0, kScreenHeight - 120/PxWidth - K_rectNav -K_rectStatus, kScreenWidth, 75/PxWidth);
    removeButton.backgroundColor = Color_back;
    [removeButton setTitle:@"删除" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(rightBtnPressedWithSure:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];
    removeButton.hidden = YES;
    self.tableView.delegate = self;
    
    _index = 1;
    _dataArr = [NSMutableArray array];
    [self p_data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)p_data{
    if ([_typeStr isEqualToString:@"商品"]) {
        [[LoginDataTools shareGetLoginDate]MyFavouriteWithUserId:[LoginDataTools shareGetLoginDate].userModel.UserId Md5Code:[LoginDataTools shareGetLoginDate].userModel.Md5Code pageIndex:_index WithReturnValeuBlock:^(id code) {
            _dataArr = code;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        } WithFailureBlock:^(NSError *error) {
            
        }];
    }else if ([_typeStr isEqualToString:@"店铺"]){
    
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_typeStr isEqualToString:@"商品"]) {
        CollectionGoodTableViewCell *cell=nil;
        if (cell==nil) {
            cell= [tableView dequeueReusableCellWithIdentifier:@"CollectionGoodTableViewCell" forIndexPath:indexPath];
            MyFavouriteModel *mf = _dataArr[indexPath.row];
            
            cell.goodNameLabel.text = mf.GoodsName;
            [cell.goodImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_f_b,mf.ImagePath]]];
            cell.goodTitleLabel.text = mf.GoodsBrief;
            cell.goodPriceLabel.attributedText = [self LabelAttributedString:[NSString stringWithFormat:@"价格:￥%@",mf.GoodsPrice]];
            if (![mf.GoodsStore isEqualToString:@"0"]) {
                cell.goodNoteLabel.text = @"";
            }
            
        }else{
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    }else{
        MyFavouriteModel *mf = _dataArr[indexPath.row];
        if ([_typeStr isEqualToString:@"商品"]) {
            [[GoodsDateTolls shareGetGoodsDate]GoodsDetailWithGoodsId:mf.GoodsId UserId:[LoginDataTools shareGetLoginDate].userModel.UserId WithReturnValeuBlock:^(id code) {
                GoodViewController *gv = [[GoodViewController alloc]init];
                gv.aGoodsDetaile = code;
                [self.navigationController pushViewController:gv animated:YES];
            } WithFailureBlock:^(NSError *error) {
                
                
            }];
        }else{
        
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
    
    for (int i = 0; i < _dataArr.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if (self.tableView.editing) {
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        }else{
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    
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
                NSInteger row = [[self.selectedDic objectAtIndex:i] row];
                MyFavouriteModel *aMyFavourite = [[MyFavouriteModel alloc]init];
                aMyFavourite = _dataArr[row];
                if ([_typeStr isEqualToString:@"商品"]) {
                    [[LoginDataTools shareGetLoginDate]FavouriteDeleteWithFavoId:aMyFavourite.FavoId WithReturnValeuBlock:^(id code) {
                        [_dataArr removeObject:aMyFavourite];
                        if (i == count-1) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self.selectedDic removeAllObjects];
                                [self.tableView reloadData];
                            });
                        }
                    } WithFailureBlock:^(NSError *error) {
                        
                    }];
                }else if ([_typeStr isEqualToString:@"店铺"]){
                    
                }
                removeButton.backgroundColor = Color_back;
                [removeButton setTitle:@"删除" forState:UIControlStateNormal];
            }
        }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}

-(NSMutableAttributedString *)LabelAttributedString:(NSString *)Str{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:Str];
    //设置颜色
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0] range:NSMakeRange(0,4)];
    //设置颜色
    [str addAttribute:NSForegroundColorAttributeName value:Color_indigo range:NSMakeRange(4 ,Str.length - 4)];
    
    return str;
}

@end
