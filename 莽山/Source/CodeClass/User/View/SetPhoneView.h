//
//  SetPhoneView.h
//  莽山
//
//  Created by jang on 16/4/29.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPhoneView : UIView
@property (nonatomic,strong)UIView *backView;

@property (nonatomic,strong)UILabel *oldtitleLabel;
@property (nonatomic,strong)NSString *oldString;

@property (nonatomic,strong)UILabel *oldtextLabel;
@property (nonatomic,strong)NSString *oldtextString;


@property (nonatomic,strong)UILabel *updateLabel;
@property (nonatomic,strong)NSString *updateString;
@property (nonatomic,strong)UITextField *updateTextField;
@property (nonatomic,strong)NSString *updateTextString;

@property (nonatomic,strong)UILabel *updateLabel2;
@property (nonatomic,strong)NSString *updateString2;
@property (nonatomic,strong)UITextField *updateTextField2;
@property (nonatomic,strong)NSString *updateTextString2;

@property (nonatomic,strong)UILabel *codeLabel;
@property (nonatomic,strong)NSString *codeString;
@property (nonatomic,strong)UITextField *codeTextField;
@property (nonatomic,strong)NSString *codeTextString;

@property (nonatomic,strong)UIButton *codeButton;
@property (nonatomic,strong)UIButton *determineButton;
@end
