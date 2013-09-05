//
//  CustomNavigationController.m
//  HuiShengHuo
//
//  Created by invent on 13-4-17.
//  Copyright (c) 2013年 iit. All rights reserved.
//

#import "CustomNavigationController.h"
#define TAG_NAVBARIMAGE  1000
@interface CustomNavigationController ()

@end

@implementation CustomNavigationController
-(id)init
{
    self=[super init];
    if(self)
    {
        UINavigationBar *navBar=[self navigationBar];
        if([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
        {
            [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"mybg_image"] forBarMetrics:UIBarMetricsDefault];
        }
        else
        {
            UIImageView *imgView=(UIImageView*)[navBar viewWithTag:TAG_NAVBARIMAGE];
            if(imgView==nil)
            {
                imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,navBar.frame.size.width, navBar.frame.size.height)];
                [imgView setImage:[UIImage imageNamed:@"mybg_image"]];
                [navBar insertSubview:imgView atIndex:0];
                [imgView release];
            }
        }
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationBar *navBar=[self navigationBar];
        if([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
        {
            [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"mybg_image"] forBarMetrics:UIBarMetricsDefault];
        }
        else
        {
            UIImageView *imgView=(UIImageView*)[navBar viewWithTag:TAG_NAVBARIMAGE];
            if(imgView==nil)
            {
                imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,navBar.frame.size.width, navBar.frame.size.height)];
                [imgView setImage:[UIImage imageNamed:@"mybg_image"]];
                [navBar insertSubview:imgView atIndex:0];
                [imgView release];
            }
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
