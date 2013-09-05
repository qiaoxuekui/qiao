//
//  HPStoreViewController.m
//  huipayV1.2
//
//  Created by SettyBoBo on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import "HPStoreViewController.h"

@interface HPStoreViewController ()

@end

@implementation HPStoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)didClickButtonleft
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)creatNav
{
    //顶部间隙填补
    UIView *topview=[[UIView alloc]initWithFrame:CGRectMake(0, -5, 320, 3)];
    topview.backgroundColor=[UIColor colorWithRed:233.00/255.0 green:233.00/255.0 blue:233.00/255.0 alpha:1];
    [self.view addSubview:topview];
    
    //title
    
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text=@"返券商城";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLabel;
    [titleLabel release];
    
    //左边导航
//    UIButton *buttonleft=[UIButton buttonWithType:UIButtonTypeCustom];
//    buttonleft.frame=CGRectMake(0, 0, 45, 30);
//    [buttonleft setImage:[UIImage imageNamed:@"button2"] forState:UIControlStateNormal];
//    [buttonleft addTarget:self action:@selector(didClickButtonleft) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem= [[[UIBarButtonItem alloc] initWithCustomView:buttonleft]autorelease];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self creatNav];//初始化导航条
    [self chooseList];//初始化分类选择
    [self listArrays];//初始化list的数组
    
    //测试git................
	// Do any additional setup after loading the view.
}

-(void)chooseList{
    
    //热门
    UIButton  *categoriesButton=[AllKindsOfEncapsulation creatButton:CGRectMake(0, 0, 107, 28) andTitle:@"分类" andNormalImage:@"hp_classification01" andSelector:@selector(categoriesButtonClick:) andTag:1000 andTarget:self];
    [categoriesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [categoriesButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    categoriesButton.tag=0;
    [self.view addSubview:categoriesButton];
    
    UIImageView *downArrow=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 8, 8)] ;
    downArrow.image=[UIImage imageNamed:@"hp_triangle"];
    [categoriesButton addSubview:downArrow];
    [downArrow release];
    
    //区域
    
    UIButton  *subAreaButton=[AllKindsOfEncapsulation creatButton:CGRectMake(107,0, 107, 28) andTitle:@"区域" andNormalImage:@"hp_classification01" andSelector:@selector(subAreaButtonClick:) andTag:2000 andTarget:self];
    [subAreaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [subAreaButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    subAreaButton.tag=1;
    [self.view addSubview:subAreaButton];
    
    UIImageView *downArrow1=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 8, 8)];
    downArrow1.image=[UIImage imageNamed:@"hp_triangle"];
    [subAreaButton addSubview:downArrow1];
    [downArrow1 release];
    
    
    //特权
    UIButton  *privilegeButton=[AllKindsOfEncapsulation creatButton:CGRectMake(214,0, 107, 28) andTitle:@"排序" andNormalImage:@"hp_classification02" andSelector:@selector(privilegeButtonClick:) andTag:3000 andTarget:self];
    [privilegeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [privilegeButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    privilegeButton.tag=2;
    [self.view addSubview:privilegeButton];
    
    UIImageView *downArrow3=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 8, 8)];
    downArrow3.image=[UIImage imageNamed:@"hp_triangle"];
    [privilegeButton addSubview:downArrow3];
    [downArrow3 release];
    
}

-(void)listArrays{
    
    _tableArray=[[NSMutableArray alloc] initWithCapacity:0];
    
    _allArr=[[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray *arr1=[[NSArray alloc] initWithObjects:@"全部",@"美食",@"休闲",@"娱乐",@"生活",@"汽车",@"购物",@"旅行",@"健康", nil];
    NSArray *arr2=[[NSArray alloc] initWithObjects:@"金水区",@"中原区",@"二七区",@"管城回族区",@"惠济区", nil];
    NSArray *arr3=[[NSArray alloc] initWithObjects:@"最新返券",@"热门返券",@"离我最近", nil];
    
    [_allArr addObject:arr1];
    [_allArr addObject:arr2];
    [_allArr addObject:arr3];
    
}

#pragma mark -
#pragma mark Button selectors

-(void)categoriesButtonClick:(UIButton *)sender{     //分类按钮点击方法
    
    _tableArray=[_allArr objectAtIndex:sender.tag];
    CGRect rect=CGRectMake(0, 28, 100, 35*[_tableArray count]);
    
    [self popViewWithRect:rect];
    
    
}

-(void)subAreaButtonClick:(UIButton *)sender{        //区域按钮点击方法
    
    _tableArray=[_allArr objectAtIndex:sender.tag];
    CGRect rect=CGRectMake(107, 28, 100, 35*[_tableArray count]);
    
    [self popViewWithRect:rect];
    
}

-(void)privilegeButtonClick:(UIButton *)sender{      //排序按钮点击方法
    
    _tableArray=[_allArr objectAtIndex:sender.tag];
    CGRect rect=CGRectMake(214, 28, 100, 35*[_tableArray count]);
    
    [self popViewWithRect:rect];
}

#pragma mark -

-(void)popViewWithRect:(CGRect)rect{                              //创建弹出view
    
    _bgView=[[UIView alloc] initWithFrame:self.view.bounds];//透明遮罩view
    _bgView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_bgView];
    
    [_bgView release];
    
    _popTable=[[UITableView alloc] initWithFrame:rect];
    _popTable.delegate=self;
    _popTable.dataSource=self;
    _popTable.backgroundColor=[UIColor clearColor];
    _popTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _popTable.layer.cornerRadius=4;
    
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(rect.origin.x+3, rect.origin.y, rect.size.width, rect.size.height)];//为了让cell字不透明加的view
    view1.backgroundColor=[UIColor blackColor];
    view1.alpha=0.5;
    view1.layer.cornerRadius=4;
    [_bgView addSubview:view1];
    [view1 release];
    
    [_bgView addSubview:_popTable];//在主view上先加载透明的view  再加载不透明缺没有背景色的table
    [_popTable release];
    
    UITapGestureRecognizer*singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapFrom:)];
    singleRecognizer.numberOfTouchesRequired = 1; // 单击
    [_bgView addGestureRecognizer:singleRecognizer];
    [singleRecognizer release];
    
    
}


- (void)handleSingleTapFrom:(UISwipeGestureRecognizer*)recognizer {
    // 触发手勢事件后，让list消失
    // 底下是刪除手势的方法
    [_bgView removeGestureRecognizer:recognizer];
    [_bgView removeFromSuperview];
    
    
}


#pragma mark -
#pragma mark UITableViewDataSource,UITableViewDelegate
//返回有多少个Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 35;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    HPListCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[[HPListCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:showUserInfoCellIdentifier]
                autorelease];
    }
    
    cell.listText.text=[_tableArray objectAtIndex:indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
