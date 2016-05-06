//
//  DatePickView.h
//  莽山
//
//  Created by jang on 16/4/25.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSDate *pickDate;
//newDate
@property (nonatomic, strong) UICollectionView *datecollectionView;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSDateComponents *comps;
@property (nonatomic, strong) NSCalendar *calender;
@property (nonatomic, strong) NSArray * weekdays;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property (nonatomic, strong) NSArray *OutDateArray;
@property (nonatomic, strong) NSArray *selectedData;
@property (nonatomic, strong) UIButton *promptButton;

@property (nonatomic, copy) chooseDate selectedDate;

@end
