//
//  ToEvaluateViewController.m
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import "ToEvaluateViewController.h"
#import "ToEvaluateView.h"
@interface ToEvaluateViewController ()<UITextViewDelegate>
@property (nonatomic,strong)ToEvaluateView *tv;
@end

@implementation ToEvaluateViewController

-(void)loadView{
    self.tv = [[ToEvaluateView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _tv.evaluateTextView.delegate = self;
    self.view = _tv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawNav];
}

-(void)drawNav{
    self.navigationItem.title = @"评价";
    UIButton *backButton = [[UIButton alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backButton addTarget:self action:@selector(leftBar) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"订单填写_返回.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [_tv.addImageButton addTarget:self action:@selector(addImageButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addImageButtonAction{
    _tv.backView3.hidden = YES;
    _tv.backView4.hidden = NO;
}

-(void)leftBar{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    NSInteger textNum = 150 - (textView.text.length + text.length);
    if (textView.text.length + text.length > 150){
        if (location != NSNotFound){
            [textView resignFirstResponder];
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        return NO;
    }
    _tv.textLabel.text = [NSString stringWithFormat:@"%d",textNum];
    return YES;
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
