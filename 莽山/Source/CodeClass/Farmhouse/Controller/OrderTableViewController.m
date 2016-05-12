//
//  OrderTableViewController.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "OrderTableViewController.h"
#import "OrderTableViewCell.h"
@interface OrderTableViewController ()

@property (nonatomic,strong)UIButton *shoppingButton;//购物车信息

@property (nonatomic,strong)UIButton *buyButton;//提交订单

@property (nonatomic,strong)UILabel *priceLabel;//商品总价

@end

@implementation OrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier:@"OrderTableViewCell"];
    
    _shoppingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shoppingButton.frame = CGRectMake(0, kScreenHeight - K_rectNav - K_rectStatus - 75/PxHeight - kXTDefaultTabBarHeight/PxHeight, kScreenWidth/2, 75/PxHeight);
    _shoppingButton.backgroundColor = Color_back;

    UIImageView * logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80/PxWidth, 20/PxHeight, 35/PxHeight, 35/PxHeight)];
    logoImageView.image = [UIImage imageNamed:@"农家乐_点菜"];
    [_shoppingButton addSubview:logoImageView];
    
    _priceLabel = [UILabel setFrame:CGRectMake(CGRectGetMaxX(logoImageView.frame) + 10/PxWidth, CGRectGetMinY(logoImageView.frame), 100/PxWidth, CGRectGetHeight(logoImageView.frame)) title:@"42.00" tintColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:[UIFont systemFontOfSize:21]];
    [_shoppingButton addSubview:_priceLabel];

    [self.view addSubview:_shoppingButton];
    
    _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _buyButton.frame = CGRectMake(kScreenWidth/2, CGRectGetMinY(_shoppingButton.frame), kScreenWidth/2, 75/PxHeight);
    _buyButton.backgroundColor = Color_indigo;
    [_buyButton setTitle:@"提交订单" forState:UIControlStateNormal];
    [self.view addSubview:_buyButton];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        _shoppingButton.frame = CGRectMake(0, kScreenHeight - K_rectNav - K_rectStatus - 75/PxHeight - kXTDefaultTabBarHeight/PxHeight + offsetY, kScreenWidth/2, 75/PxHeight);
    }else{
        _shoppingButton.frame = CGRectMake(0, kScreenHeight - K_rectNav - K_rectStatus  - 75/PxHeight - kXTDefaultTabBarHeight/PxHeight, kScreenWidth/2, 75/PxHeight);
    }
    _buyButton.frame = CGRectMake(kScreenWidth/2, CGRectGetMinY(_shoppingButton.frame), kScreenWidth/2, 75/PxHeight);
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
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170/PxHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderTableViewCell" forIndexPath:indexPath];
    if (cell==nil) {
        cell= [[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OrderTableViewCell"];
    }
    cell.pirceLabel.attributedText = [self LabelAttributedString:@"¥42/份"];
    return cell;

}


-(NSMutableAttributedString *)LabelAttributedString:(NSString *)Str{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:Str];
    //价格字体
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:19.0],NSFontAttributeName,nil];
    [str addAttributes:attributeDict range:NSMakeRange(0,Str.length - 2)];
    
    //设置颜色
    [str addAttribute:NSForegroundColorAttributeName value:Color_indigo range:NSMakeRange(0,Str.length - 2)];
    
    // /份 字体
    attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                     [UIFont systemFontOfSize:14.0],NSFontAttributeName,nil];
    [str addAttributes:attributeDict range:NSMakeRange(Str.length - 2,2)];
    
    //设置颜色
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] range:NSMakeRange(Str.length - 2,2)];
    
    return str;
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
