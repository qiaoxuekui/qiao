//
//  BuyItViewPopView.m
//  HuiBei
//
//  Created by SettyBoBo on 13-7-7.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "BuyItViewPopView.h"
#import "ASIFormDataRequest.h"
#import "Utility.h"
//#import "BuyResultViewController.h"
#import "SBJson.h"
#import <QuartzCore/QuartzCore.h>

@interface BuyItViewPopView()<ASIHTTPRequestDelegate>
{
    UIImageView *_bgImageView;
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UILabel *_subContentLabel;
    UIView *_maskView;
    UIButton *mybutton;
    UILabel *mylabel;
    UIButton *myletterbutton;
    UILabel *myletterlabel;
    ASIFormDataRequest *buyRequest;
   // BuyResultViewController *BuyResultViewController;
}

@end
@implementation BuyItViewPopView

//验证码背景.png
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//-(id)initWithTitle:(NSString *)title Content:(NSString *)content subContent:(NSString *)subContent shopId:(int)shopid
-(id)initWithTitle:(NSString *)title Content:(NSString *)content subContent:(NSString *)subContent shopsell:(SEL)buttonsel targrt:(id)target
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
        //
        _bgImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImageView.image=[UIImage imageNamed:@"ticket_buy_pop.png"];
       
        
//        //title
        _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, 260, 33)];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [_titleLabel setTextColor:[UIColor colorWithRed:137/255.0 green:0 blue:4/255.0 alpha:1]];
        [_titleLabel setText:title];
        [_bgImageView addSubview:_titleLabel];
        //content

//        //subcontent
//        _subContentLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 10, 180, 33)];
//        _subContentLabel.numberOfLines=0;
//        _subContentLabel.backgroundColor=[UIColor clearColor];
//        _subContentLabel.textAlignment=NSTextAlignmentCenter;
//        [_subContentLabel setTextColor:[UIColor colorWithRed:176/255.0 green:171/255.0 blue:192/255.0 alpha:1.0]];
//        [_subContentLabel setText:subContent];
//        [_subContentLabel setFont:[UIFont systemFontOfSize:12]];
//        [_bgImageView addSubview:_subContentLabel];
        [self addSubview:_bgImageView];
        
        //取消按钮
        mybutton =[UIButton buttonWithType:UIButtonTypeCustom];
        [mybutton setImage:[UIImage imageNamed:@"ticket_buy_pop_button"] forState:UIControlStateNormal];
        [mybutton addTarget:self action:@selector(dismissPopAlertView) forControlEvents:UIControlEventTouchUpInside];
        mybutton.frame=CGRectMake(200, 260, 69, 24);
        [self addSubview:mybutton];
        //取消按钮文字
        mylabel =[[UILabel alloc]initWithFrame:CGRectMake(4, 2, 61, 20)];
        mylabel.font=[UIFont systemFontOfSize:14];
        mylabel.textAlignment=NSTextAlignmentCenter;
        mylabel.backgroundColor=[UIColor clearColor];
        mylabel.textColor=[UIColor whiteColor];
        mylabel.text=subContent;
        [mybutton addSubview:mylabel];
        
        //确定按钮
        myletterbutton=[UIButton buttonWithType:UIButtonTypeCustom];
        myletterbutton.frame=CGRectMake(70, 260, 69, 24);
       [myletterbutton setImage:[UIImage imageNamed:@"ticket_buy_pop_button"] forState:UIControlStateNormal];
        [self addSubview:myletterbutton];
        
        //确定按钮文字
        [myletterbutton addTarget:target action:buttonsel forControlEvents:UIControlEventTouchUpInside];
        myletterlabel=[[UILabel alloc]initWithFrame:CGRectMake(4,2, 61, 20)];
//        self.selfid=shopid;
        myletterlabel.font=[UIFont systemFontOfSize:14];
        myletterlabel.textColor=[UIColor whiteColor];
        myletterlabel.backgroundColor=[UIColor clearColor];
        myletterlabel.text=content;
         myletterlabel.textAlignment=NSTextAlignmentCenter;
        [myletterbutton addSubview:myletterlabel];
        
        
    }
    return self;
}

-(void)setSureButtonSel:(SEL)sel target:(id)target
{
    [myletterbutton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)setlabel:(NSString *)title buttontile:(NSString *)buttontitle subbuttontiele:(NSString *)subbuttontitle
{
    
    if ([buttontitle isEqualToString:@""])
    {
        title = @"您的汇币余额不足";
        myletterbutton.hidden=YES;
        mybutton.frame = CGRectMake(135, 260, 69, 24);
        return;
    }
    _titleLabel.text=title;
    myletterlabel.text=buttontitle;
    mylabel .text=subbuttontitle;
}

-(void)setTitle:(NSString *)str
{
    _titleLabel.text=str;
    
}

-(void)surebuy
{
    buyRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@1/voucher/buy.json",[ClientInfo getHuipayUrlPrefix]]]];
    buyRequest.delegate=self;
    buyRequest.timeOutSeconds=60;
    [buyRequest setPostValue:[UserInfo getUserInfoForKey:@"access_token"] forKey:@"access_token"];
    [buyRequest setPostValue:[NSNumber numberWithInt:self.selfid] forKey:@"product_id"];
    [buyRequest startAsynchronous];
}
-(void)settargrt:(id)target click:(SEL)buttonsell
{
    [mybutton addTarget:target action:buttonsell forControlEvents:UIControlEventTouchUpInside];
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *dic=[NSDictionary dictionary];
    if (request.responseData) {
        dic=[request.responseData JSONValue];
    }
     if ([dic objectForKey:@"error"])
     {
         [self removeFromSuperview];
     }
    if ([[dic objectForKey:@"result"] integerValue]==1)
    {
      
    }

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
        [_delegate BuyItViewPopViewDidDismiss];
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
    [_contentLabel release];
    [_subContentLabel release];
    [_maskView release];
    [mylabel release];
    [myletterlabel release];
    [super dealloc];
}
@end