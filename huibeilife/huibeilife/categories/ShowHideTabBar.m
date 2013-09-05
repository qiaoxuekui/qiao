//
//  ShowHideTabBar.m
//  huibeishenghuo
//
//  Created by invent on 13-5-28.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "ShowHideTabBar.h"
static BOOL tabBarShown=YES;
@implementation ShowHideTabBar
+(void)hideTabBar:(UITabBarController*) tabbarcontroller forWindow:(UIWindow*)window  {

    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.2];
            [view setFrame:CGRectMake(view.frame.origin.x,window.bounds.size.height, view.frame.size.width, view.frame.size.height)];
            [UIView commitAnimations]; 
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,window.bounds.size.height)];
        }
    }
    
    
}

+(void)showTabBar:(UITabBarController*) tabbarcontroller forWindow:(UIWindow*)window {
    
    for(UIView*view in tabbarcontroller.view.subviews)
    {
        
        if([view isKindOfClass:[UITabBar class]])
        {
            //[UIView beginAnimations:nil context:NULL];
           // [UIView setAnimationDuration:0.2];
            [view setFrame:CGRectMake(view.frame.origin.x,window.bounds.size.height-49, view.frame.size.width, view.frame.size.height)];
            //[UIView commitAnimations];
        }
        else
        {
//            NSLog(@" class %@",[view class]);
//            for(UIView *v in [v.subviews ])
//            {
//                
//            }
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,window.bounds.size.height-49)];
        }
    }
    
}
+(void)showTabBar:(BOOL)show
{
    UIApplication *app=[UIApplication sharedApplication];
    AppDelegate *appDelegate=app.delegate;
    if (show) {
        //显示tabbar
        [self showTabBar:appDelegate.tabBarController forWindow:appDelegate.window];
        tabBarShown=YES;
    }else
    {
        //隐藏tabbar
        [self hideTabBar:appDelegate.tabBarController forWindow:appDelegate.window];
        tabBarShown=NO;
    }
}
+(BOOL)isTabBarShown
{
    return tabBarShown;
}
@end
