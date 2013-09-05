//
//  RefreshHeaderView.m
//  HuiBei
//
//  Created by invent on 13-6-4.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "RefreshHeaderView.h"

@implementation RefreshHeaderView
@synthesize refreshArrow=_refreshArrow,activityView=_activityView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font=[UIFont systemFontOfSize:15];
        _refreshArrow=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowDown.png"]];
        [self addSubview:_refreshArrow];
        self.textAlignment=NSTextAlignmentCenter;
        _activityView=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        _activityView.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
        [self addSubview:_activityView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [_refreshArrow setFrame:CGRectMake(10, (self.bounds.size.height-44)/2.0, 22, 44)];
    [_activityView setFrame:CGRectMake(10, (self.bounds.size.height-20)/2.0, 20, 20)];
}

@end
