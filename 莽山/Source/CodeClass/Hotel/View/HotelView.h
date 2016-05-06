//
//  HotelView.h
//  莽山
//
//  Created by jang on 16/4/22.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MallTypeView;

@protocol HotelViewDelegate <NSObject>

-(void)titleButtonAction:(id)sender;

-(void)dataButtonAction:(id)sender;

-(void)chooseAction:(id)sender;

-(void)mapAction:(id)sender;

-(void)surroundAction:(id)sender;

-(void)phoneAction:(id)sender;
@end

@interface HotelView : UIView
@property(nonatomic,strong)UILabel *storeNameLabel;
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UIButton *phoneButton;
@property(nonatomic,strong)UIButton *inButton;
@property(nonatomic,strong)UILabel *inLabel;
@property(nonatomic,strong)UIButton *outButton;
@property(nonatomic,strong)UILabel *outLabel;
@property(nonatomic,strong)UIButton *dayButton;
@property(nonatomic,strong)MallTypeView *typeView1;
@property(nonatomic,strong)MallTypeView *typeView2;
@property(nonatomic,strong)MallTypeView *typeView3;
@property (nonatomic,strong)UIButton *headButton1;
@property (nonatomic,strong)UIButton *headButton2;
@property (nonatomic,strong)UIButton *headButton3;
@property (nonatomic,strong)UILabel *greenLabel1;
@property (nonatomic,strong)UILabel *greenLabel2;
@property (nonatomic,strong)UILabel *greenLabel3;
@property (nonatomic,weak)id <HotelViewDelegate>delegate;

@end
