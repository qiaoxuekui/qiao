//
//  PopAlertView.m
//  huibeishenghuo
//
//  Created by invent on 13-5-26.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "PopAlertView.h"
#import <QuartzCore/QuartzCore.h>

@interface PopAlertView()
{
    UIImageView *_bgImageView;
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UILabel *_subContentLabel;
    UIView *_maskView;
    UIButton *mybutton;
    UILabel *mylabel;
}
@end
@implementation PopAlertView
//验证码背景.png
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithTitle:(NSString *)title Content:(NSString *)content subContent:(NSString *)subContent
{
    self = [super init];
    if (self) {
        // Initialization code
        //mask View
        _maskView=[[UIView alloc]initWithFrame:CGRectZero];
        _maskView.backgroundColor=[UIColor blackColor];
        _maskView.alpha=0.7;
        //
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissPopAlertView)];
        [_maskView addGestureRecognizer:tap];
        [tap release];
        [self addSubview:_maskView];
        
        
        _bgImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImageView.image=[UIImage imageNamed:@"ticket_buy_pop.png"];
        
        
        
        //title
        _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 300, 33)];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setText:title];
        [_bgImageView addSubview:_titleLabel];
        //content
        _contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 43, 250, 60)];
        _contentLabel.backgroundColor=[UIColor clearColor];
        _contentLabel.textAlignment=NSTextAlignmentCenter;
        [_contentLabel setTextColor:[UIColor colorWithRed:211/255.0 green:0 blue:5/255.0 alpha:1]];
        [_contentLabel setText:content];
        [_contentLabel setFont:[UIFont boldSystemFontOfSize:28]];
        _contentLabel.numberOfLines=0;
        [_bgImageView addSubview:_contentLabel];
        
        //subcontent
        _subContentLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 180, 33)];
        _subContentLabel.numberOfLines=0;
        _subContentLabel.backgroundColor=[UIColor clearColor];
        _subContentLabel.textAlignment=NSTextAlignmentCenter;
        [_subContentLabel setTextColor:[UIColor colorWithRed:176/255.0 green:171/255.0 blue:192/255.0 alpha:1.0]];
        [_subContentLabel setText:subContent];
        [_subContentLabel setFont:[UIFont systemFontOfSize:12]];
        [_bgImageView addSubview:_subContentLabel];
        [self addSubview:_bgImageView];
        
        mybutton =[UIButton buttonWithType:UIButtonTypeCustom];
        [mybutton setImage:[UIImage imageNamed:@"ticket_buy_button.png"] forState:UIControlStateNormal];
        [mybutton addTarget:self action:@selector(dismissPopAlertView) forControlEvents:UIControlEventTouchUpInside];
        mybutton.frame=CGRectMake(60, 260, 220, 30);
        [self addSubview:mybutton];
        
        mylabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 220, 20)];
        mylabel.textAlignment=UITextAlignmentCenter;
        mylabel.backgroundColor=[UIColor clearColor];
        mylabel.textColor=[UIColor whiteColor];
        mylabel.text=@"知道了";
        [mybutton addSubview:mylabel];
    
        

    }
    return self;
}
-(void)showPopAlertView
{
    UIApplication *app=[UIApplication sharedApplication];
    UIWindow *window=[app.windows objectAtIndex:0];
    //
    [window addSubview:self];
}
-(void)dismissPopAlertView
{
    [self removeFromSuperview];
    if ([_delegate respondsToSelector:@selector(popAlertViewDidDismiss)]) {
        [_delegate popAlertViewDidDismiss];
    }
}
-(void)layoutSubviews
{
    [self setFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
    //
    [_maskView setFrame:self.frame];
    //
    [_bgImageView setFrame:CGRectMake(40, 160, 260, 150)];
}
-(void)dealloc
{
    [_bgImageView release];
    [_titleLabel release];
    [_contentLabel release];
    [_subContentLabel release];
    [_maskView release];
    [mylabel release];
    [super dealloc];
}

@end
