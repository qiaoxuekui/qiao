//
//  HPShopViewController.m
//  huipayV1.2
//
//  Created by SettyBoBo on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import "HPShopViewController.h"
#import "AllKindsOfEncapsulation.h"
#import "Utility.h"
#import "HPSearchViewController.h"

@interface HPShopViewController ()

@end

@implementation HPShopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)creatNav
{
    //
//    UIView *topview=[[UIView alloc]initWithFrame:CGRectMake(0, -5, 320,10)];
//    topview.backgroundColor=[UIColor colorWithRed:233.00/255.0 green:233.00/255.0 blue:233.00/255.0 alpha:1];
//    [self.view addSubview:topview];
    //title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.font=[UIFont systemFontOfSize:18.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text=@"汇贝生活";
    self.navigationItem.titleView=titleLabel;
    [titleLabel release];
    
    //城市
    UIButton *cityButton=[UIButton buttonWithType:UIButtonTypeCustom];
    cityButton.frame=CGRectMake(0, 8,73, 28);
    [cityButton setBackgroundImage:[UIImage imageNamed:@"hp_title_button"] forState:UIControlStateNormal];
    [cityButton setBackgroundImage:[UIImage imageNamed:@"hp_title_button"] forState:UIControlStateSelected];
    cityButton.titleLabel.font= [UIFont systemFontOfSize:15.0f];
    //默认城市
    [cityButton setTitle:@"北京" forState:UIControlStateNormal];
    [cityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [cityButton addTarget:self action:@selector(didClickedCityButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc]initWithCustomView:cityButton] autorelease];
    //地图
    mapimage=[UIButton buttonWithType:UIButtonTypeCustom];
    mapimage.frame =CGRectMake(225, 7, 45, 30);
    [mapimage setImage:[UIImage imageNamed:@"hp_map"] forState:UIControlStateNormal];
    [mapimage addTarget:self action:@selector(didClickMap) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:mapimage];
    //竖线
    lineimage =[[UIImageView alloc]initWithFrame:CGRectMake(274, 5, 2, 30)];
    lineimage.image=[UIImage imageNamed:@"line"];
    [self.navigationController.navigationBar addSubview:lineimage];
    //搜索
    searchButton =[UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame=CGRectMake(280, 7, 45, 30);
    [searchButton setImage:[UIImage imageNamed:@"hp_icon_seach"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(didClickedSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:searchButton];
    
}

- (void)didClickedCityButton
{
    
}

- (void)didClickedSearch
{
    HPSearchViewController *svc = [[HPSearchViewController alloc] init];
    mapimage.hidden=YES;
    lineimage.hidden=YES;
    searchButton.hidden=YES;
    svc.tabBarController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:svc animated:YES];
    [svc release];
}

- (void)didClickMap
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    mapimage.hidden=NO;
    lineimage.hidden=NO;
    searchButton.hidden=NO;
    [super viewWillAppear:YES];
}
#pragma mark--area--hot--prith

- (void)creatHeaderView
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, 40)];
    [self.view addSubview:headerView];
    [headerView release];
    
    //热门
    UIButton  *categoriesButton=[AllKindsOfEncapsulation creatButton:CGRectMake(0, 0, 107, 32) andTitle:@"全部" andNormalImage:@"hp_classification01" andSelector:@selector(didClickButtonCategories:) andTag:1000 andTarget:self];
    [categoriesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [categoriesButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [headerView addSubview:categoriesButton];
    
    UIImageView *hotimage=[[UIImageView alloc]init];
    hotimage.frame=CGRectMake(11,6,20, 20);
    hotimage.image=[UIImage imageNamed:@"hp_icon_Classification"];
    [categoriesButton addSubview:hotimage];
    [hotimage release];
    
    UIImageView *downArrow=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 8, 8)] ;
    downArrow.image=[UIImage imageNamed:@"hp_triangle"];
    [categoriesButton addSubview:downArrow];
    [downArrow release];
    
    //区域
    
    UIButton  *subAreaButton=[AllKindsOfEncapsulation creatButton:CGRectMake(107,0, 107, 32) andTitle:@"区域" andNormalImage:@"hp_classification01" andSelector:@selector(didClickButtonCategories:) andTag:2000 andTarget:self];
    [subAreaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [subAreaButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [headerView addSubview:subAreaButton];
    
    UIImageView *areaimage =[[UIImageView alloc]initWithFrame:CGRectMake(8, 6, 20, 20)];
    areaimage.image=[UIImage imageNamed:@"hp_icon_area"];
    [subAreaButton addSubview:areaimage];
    [areaimage release];
    
    //箭头
    UIImageView *downArrow1=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 8, 8)];
    downArrow1.image=[UIImage imageNamed:@"hp_triangle"];
    [subAreaButton addSubview:downArrow1];
    [downArrow1 release];
    
    
    //特权
    UIButton  *privilegeButton=[AllKindsOfEncapsulation creatButton:CGRectMake(214,0, 107, 32) andTitle:@"特权" andNormalImage:@"hp_classification02" andSelector:@selector(didClickButtonCategories:) andTag:3000 andTarget:self];
    [privilegeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [privilegeButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [headerView addSubview:privilegeButton];
    
    UIImageView *prerogativeimage=[[UIImageView alloc]initWithFrame:CGRectMake(5, 6, 20, 20)];
    prerogativeimage.image=[UIImage imageNamed:@"hp_privilege"];
    [privilegeButton addSubview:prerogativeimage];
    [prerogativeimage release];
    
    UIImageView *downArrow3=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 8, 8)];
    downArrow3.image=[UIImage imageNamed:@"hp_triangle"];
    [privilegeButton addSubview:downArrow3];
    [downArrow3 release];
    
    
}

- (void)didClickButtonCategories:(UIButton *)sender
{
    NSLog(@"点击点击");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatNav];
    [self creatHeaderView];
    //self.tableView.backgroundColor=[UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
