//
//  MallView.h
//  莽山
//
//  Created by jang on 16/4/20.
//  Copyright © 2016年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MallTypeView;
@class TypeDetailsView;
@interface MallView : UIView
@property (nonatomic,strong)UIView *typeView;
@property (nonatomic,strong)MallTypeView *type1View;
@property (nonatomic,strong)MallTypeView *type2View;
@property (nonatomic,strong)MallTypeView *type3View;
@property (nonatomic,strong)MallTypeView *type4View;
@property (nonatomic,strong)UIScrollView *goodsView;
@property (nonatomic,strong)UIImageView *goodImageView1;
@property (nonatomic,strong)UIImageView *goodImageView2;
@property (nonatomic,strong)UIImageView *goodImageView3;
@end
