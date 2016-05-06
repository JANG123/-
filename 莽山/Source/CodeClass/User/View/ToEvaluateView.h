//
//  ToEvaluateView.h
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class evaluateClassView;
@interface ToEvaluateView : UIScrollView
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *titleTextLabel;
@property (nonatomic,strong)evaluateClassView *evaClassView1;
@property (nonatomic,strong)evaluateClassView *evaClassView2;
@property (nonatomic,strong)evaluateClassView *evaClassView3;
@property (nonatomic,strong)evaluateClassView *evaClassView4;

@property (nonatomic,strong)UITextView *evaluateTextView;
@property (nonatomic,strong)UILabel *textLabel;

@property (nonatomic,strong)UIButton *addImageButton;

@property (nonatomic,strong)UIButton *nimingButton;
@property (nonatomic,strong)UILabel *nimingLabel;

@property (nonatomic,strong)UILabel *goodLabel;
@property (nonatomic,strong)UILabel *goodTextLabel;
@property (nonatomic,strong)evaluateClassView *evaClassView5;
@property (nonatomic,strong)evaluateClassView *evaClassView6;
@property (nonatomic,strong)evaluateClassView *evaClassView7;
@property (nonatomic,strong)evaluateClassView *evaClassView8;

@property (nonatomic,strong)UIView *backView3;
@property (nonatomic,strong)UIView *backView4;
@property (nonatomic,strong)UIView *backView5;
@end
