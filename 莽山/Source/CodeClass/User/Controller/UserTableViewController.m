//
//  UserTableViewController.m
//  莽山
//
//  Created by jang on 16/4/27.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserHeadTableViewCell.h"
#import "UserOrderTableViewCell.h"
#import "UserTableViewCell.h"
#import "OrderButton.h"
#import "UserOrderTableViewController.h"
#import "CollectionTableViewController.h"
#import "SettingTableViewController.h"

@interface UserTableViewController ()<XTPageViewControllerDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    NSInteger _numberOfPages;
}
@property (nonatomic,assign)BOOL isFullScreen;
@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"UserTableViewCell"];
    [self.tableView registerClass:[UserHeadTableViewCell class] forCellReuseIdentifier:@"UserHeadTableViewCell"];
    [self.tableView registerClass:[UserOrderTableViewCell class] forCellReuseIdentifier:@"UserOrderTableViewCell"];
    [self.tableView setExtraCellLineHidden:self.tableView];
    self.tableView.backgroundColor = Color_back;
    self.tableView.scrollEnabled = NO;
    
    
    [self drawNav];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)drawNav{
    self.navigationItem.title = @"个人中心";
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton *rightButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButton addTarget:self action:@selector(rightBar:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)rightBar:(UIBarButtonItem *)sender{
    if ([LoginDataTools shareGetLoginDate].userModel.LoginId != nil) {
    SettingTableViewController *st = [[SettingTableViewController alloc]init];
    [self.navigationController pushViewController:st animated:YES];
    }else{
        [self p_showAlertView:@"未登录" message:nil];
    }
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 200/PxHeight;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        return 87/PxHeight;
    }
    return 67/PxHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 30/PxHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        UserHeadTableViewCell *cell=nil;
        if (cell==nil) {
            cell= [tableView dequeueReusableCellWithIdentifier:@"UserHeadTableViewCell" forIndexPath:indexPath];
        }else{
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
            }
        }
        UIGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareLoginAction:)];
        [cell.headImageView addGestureRecognizer:singleTap];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ([LoginDataTools shareGetLoginDate].userModel.LoginId != nil) {
            cell.userNameLabel.text = [LoginDataTools shareGetLoginDate].userModel.LoginId;
        }
        [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_user,[LoginDataTools shareGetLoginDate].userModel.ImageName]]];
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        UserOrderTableViewCell *cell=nil;
        if (cell==nil) {
            cell= [tableView dequeueReusableCellWithIdentifier:@"UserOrderTableViewCell" forIndexPath:indexPath];
        }else{
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self p_CellAddTarget:cell];
        return cell;
    }
    UserTableViewCell *cell=nil;
    if (cell==nil) {
        cell= [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell" forIndexPath:indexPath];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    cell.logoImageView.image = [UIImage imageNamed:[self tableCell:indexPath]];
    cell.nameLabel.text = [self tableCell:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(NSString *)tableCell:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1) {
        return @"我的订单";
    }else if(indexPath.section == 1 && indexPath.row == 0){
        return @"我的收藏";
    }else if (indexPath.section == 1 && indexPath.row == 1){
        return @"申请驻店";
    }else if (indexPath.section == 2 && indexPath.row == 0) {
        return @"意见反馈";
    }else if (indexPath.section == 2 && indexPath.row == 1) {
        return @"关于我们";
    }
    return @"";
}


-(void)p_CellAddTarget:(UserOrderTableViewCell *)cell{
    [cell.paymentButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.paymentButton.tag = 501;
    [cell.goodsButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.goodsButton.tag = 502;
    [cell.evaluationButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.evaluationButton.tag = 503;
    [cell.refundButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.refundButton.tag = 504;
}


-(void)ButtonAction:(UIButton *)sender{
    
    if (sender.tag == 504) {
        //退款售后
        
        
    }else{
        //我的订单
        
        _numberOfPages = 4;
        XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
        pageViewController.typeString = @"我的订单";
        pageViewController.dataSource = self;
        pageViewController.index = sender.tag - 500;
        [self.navigationController pushViewController:pageViewController animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row ==0) {
        
    }else if (indexPath.section == 0 && indexPath.row ==1) {
        _numberOfPages = 4;
        XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
        pageViewController.typeString = @"我的订单";
        pageViewController.dataSource = self;
        pageViewController.index = 0;
        [self.navigationController pushViewController:pageViewController animated:YES];
    }if (indexPath.section == 1 && indexPath.row ==0) {
        _numberOfPages = 2;
        XTPageViewController *pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorUnderline];
        pageViewController.typeString = @"我的收藏";
        pageViewController.dataSource = self;
        pageViewController.index = 0;
        [self.navigationController pushViewController:pageViewController animated:YES];
    }

    
    
}

- (NSInteger)numberOfPages {
    return _numberOfPages;
}

- (NSString*)titleOfPage:(NSInteger)page {
    NSString *titleStr = [NSString string];
    if (_numberOfPages == 4) {
    switch (page) {
        case 0:
            titleStr = @"全部";
            break;
        case 1:
            titleStr = @"待付款";
            break;
        case 2:
            titleStr = @"待收货";
            break;
        case 3:
            titleStr = @"待评价";
            break;
        default:
            break;
    }
    }else if (_numberOfPages == 2){
        switch (page) {
            case 0:
                titleStr = @"商品";
                break;
            case 1:
                titleStr = @"店铺";
            default:
                break;
        }
    }
    return titleStr;
}

- (UIViewController*)constrollerOfPage:(NSInteger)page {
    
    if (_numberOfPages == 4) {
        UserOrderTableViewController * pageVC = [[UserOrderTableViewController alloc]init];
        pageVC.index = page;
        return pageVC;
    }else {
        CollectionTableViewController *cv = [[CollectionTableViewController alloc]init];
        if (page == 0) {
            cv.typeStr = @"商品";
        }else if (page == 1){
            cv.typeStr = @"店铺";
        }
        return cv;
    }
    
}



//显示提示框
- (void)p_showAlertView:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    //    [UIView appearance].tintColor = Color_Alert;
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)shareLoginAction:(id)sender{
    UIActionSheet *sheet;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"更换头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"更换头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    sheet.tag = 255;
    [sheet showInView:self.view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
    [self saveImage:image withName:@"tempHead.png"];
    
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *fullPath = [cachesPath stringByAppendingPathComponent:@"tempHead.png"];
    
    
    [UploadDataTools UploadImgWithImgStr:image UploadName:@"userImg" UserId:[LoginDataTools shareGetLoginDate].userModel.UserId WithReturnValeuBlock:^(id code) {
        NSString *returnValue = code;
        if ([returnValue isEqualToString:@"0"]) {
            UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
            
            _isFullScreen = NO;
            
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
            UserHeadTableViewCell *cell = [self.tableView cellForRowAtIndexPath:index];
            
            [cell.headImageView setImage:savedImage];
            
            cell.headImageView.tag = 100;
        }
    } WithFailureBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    

    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

NSData * UIImageJPEGRepresentation ( UIImage *image, CGFloat compressionQuality);

- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1);
    // 获取沙盒目录
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *fullPath = [cachesPath stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
    
    if (3145728 < [self fileSizeAtPath:fullPath]) {
        UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
        
        imageData = UIImageJPEGRepresentation(savedImage, 3145728/[self fileSizeAtPath:fullPath]);
        
        [imageData writeToFile:fullPath atomically:NO];

    }
    [self fileSizeAtPath:fullPath];
}

- (long long) fileSizeAtPath:(NSString*) filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    UserHeadTableViewCell *cell = [self.tableView cellForRowAtIndexPath:index];
    
    _isFullScreen = !_isFullScreen;
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self.view];
    
    CGPoint imagePoint = cell.headImageView.frame.origin;
    //touchPoint.x ，touchPoint.y 就是触点的坐标
    
    // 触点在imageView内，点击imageView时 放大,再次点击时缩小
    if(imagePoint.x <= touchPoint.x && imagePoint.x +cell.headImageView.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+cell.headImageView.frame.size.height >= touchPoint.y)
    {
        // 设置图片放大动画
        [UIView beginAnimations:nil context:nil];
        // 动画时间
        [UIView setAnimationDuration:1];
        
        if (_isFullScreen) {
            // 放大尺寸
            
            cell.headImageView.frame = CGRectMake(0, 0, 320, 480);
        }
        else {
            // 缩小尺寸
            cell.headImageView.frame = CGRectMake(50, 65, 90, 115);
        }
        
        // commit动画
        [UIView commitAnimations];
        
    }
    
}


@end
