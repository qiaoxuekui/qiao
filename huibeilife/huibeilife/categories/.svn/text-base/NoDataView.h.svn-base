//
//  NoDataView.h
//  HuiBei
//
//  Created by invent on 13-6-7.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoDataView;
@protocol NoDataViewDelegate <NSObject>

-(void)didTapNoDataView:(NoDataView *)view;

@end
@interface NoDataView : UIView
@property (assign,nonatomic) id<NoDataViewDelegate>delegate;
@property (copy,nonatomic,setter = setAlertString:) NSString *alertString;
-(void)setAlertString:(NSString *)alertString;
-(id)initWithFrame:(CGRect)frame alertString:(NSString *)str;
-(void)showForTableView:(UITableView*)aTableView;
-(void)showForTableView:(UITableView*)aTableView withAlertString:(NSString *)alertString;
-(void)hideForTableView:(UITableView*)aTableView;
@end
