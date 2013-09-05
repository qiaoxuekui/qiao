//
//  NoDataView.m
//  HuiBei
//
//  Created by invent on 13-6-7.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "NoDataView.h"
@interface NoDataView()
{
    UIImageView *logoImageView;
    UILabel *alertLabel;
}
@end
@implementation NoDataView
@synthesize alertString=_alertString;
@synthesize delegate=_delegate;
-(void)dealloc
{
    [logoImageView release];
    [alertLabel release];
    _delegate=nil;
    [super dealloc];
}
-(void)didTapView:(NoDataView *)view
{
    if ([_delegate respondsToSelector:@selector(didTapNoDataView:)]) {
        [_delegate didTapNoDataView:self];
    }
}
- (void)initialize
{
    logoImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noDataBg.png"]];
    [self addSubview:logoImageView];
    
    alertLabel=[[UILabel alloc]init];
    alertLabel.font=[UIFont systemFontOfSize:13];
    alertLabel.textColor=[UIColor colorWithRed:172/255.0 green:172/255.0 blue:172/255.0 alpha:1.0];
    alertLabel.textAlignment=NSTextAlignmentCenter;
    alertLabel.text=_alertString;
    alertLabel.backgroundColor=[UIColor clearColor];
    [self addSubview:alertLabel];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapView:)];
    [self addGestureRecognizer:tap];
    [tap release];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame alertString:(NSString *)str
{
    self = [super initWithFrame:frame];
    if (self) {
        _alertString=str;
         [self initialize];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}
-(void)setAlertString:(NSString *)alertString
{
    [alertLabel setText:alertString];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [logoImageView setFrame:CGRectMake( (self.bounds.size.width-110)/2 , 40, 110, 110)];
    [alertLabel setFrame:CGRectMake(0, 40+110+10, self.bounds.size.width, 40)];
}
-(void)showForTableView:(UITableView*)aTableView
{
    self.hidden=NO;
    aTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
-(void)showForTableView:(UITableView*)aTableView withAlertString:(NSString *)alertString
{
    self.hidden=NO;
    [alertLabel setText:alertString];
    aTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

-(void)hideForTableView:(UITableView*)aTableView
{
    self.hidden=YES;
    aTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
}
@end
