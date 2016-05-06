//
//  ClassView.h
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassViewDelegate <NSObject>

- (void)goBack:(UIButton *)sender;

@end

@interface ClassView : UIView

@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic,strong)UIButton *allButton;
@property (nonatomic,strong)UILabel *allLabel;
@property (nonatomic,strong)UIButton *originalButton;
@property (nonatomic,strong)UILabel *originalLabel;
@property (nonatomic,strong)UIButton *homesButton;
@property (nonatomic,strong)UILabel *homesLabel;
@property (nonatomic,strong)UIButton *uniqueButton;
@property (nonatomic,strong)UILabel *uniqueLabel;
@property (nonatomic,strong)UIButton *holidayButton;
@property (nonatomic,strong)UILabel *holidayLabel;
@property (nonatomic,strong)UIButton *backButton;

@property (nonatomic,weak)id <ClassViewDelegate>delegate;

@end
