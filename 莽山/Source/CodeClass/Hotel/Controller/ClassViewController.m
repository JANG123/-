//
//  ClassViewController.m
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "ClassViewController.h"
#import "ClassView.h"

@interface ClassViewController ()<UISearchBarDelegate,ClassViewDelegate>
@property (nonatomic,strong)ClassView *cv;
@end

@implementation ClassViewController

-(void)loadView{
    //加载视图
    self.cv = [[ClassView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _cv.searchBar.delegate = self;
    _cv.delegate = self;
    self.view = _cv;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)goBack:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
