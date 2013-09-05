//
//  HPSearchViewController.m
//  huibeilife
//
//  Created by SettyBoBo on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import "HPSearchViewController.h"
#import "HPSearchResultViewController.h"

@interface HPSearchViewController ()
{
    HPSearchResultViewController *_searchResultViewController;
    int currentAreaID;
}
@end

@implementation HPSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithAreaID:(int)areaID
{
    self=[super init];
    if (self) {
        currentAreaID=areaID;
    }
    return self;
}
-(void)dealloc
{
    [titlecolour release];
    [searchimage release];
    [super dealloc];
}
-(void)didClickButtonleft
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)creatNav
{
    //顶部间隙填补
    UIView *topview=[[UIView alloc]initWithFrame:CGRectMake(0, -5, 320, 40)];
    topview.backgroundColor=[UIColor colorWithRed:233.00/255.0 green:233.00/255.0 blue:233.00/255.0 alpha:1];
    [self.view addSubview:topview];
    
    //title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.font=[UIFont systemFontOfSize:18.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text=@"搜索";
    self.navigationItem.titleView=titleLabel;
    [titleLabel release];
    
    //左边导航
    buttonleft=[UIButton buttonWithType:UIButtonTypeCustom];
    buttonleft.frame=CGRectMake(0, 0, 45, 30);
    [buttonleft setImage:[UIImage imageNamed:@"button2"] forState:UIControlStateNormal];
    [buttonleft addTarget:self action:@selector(didClickButtonleft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:buttonleft]autorelease];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self creatNav];
    
    self.view.backgroundColor=[UIColor colorWithRed:233.00/255.0 green:233.00/255.0 blue:233.00/255.0 alpha:1];
    
    //首页搜索点击后搜索图片
    searchimage =[[UIImageView alloc]initWithFrame:CGRectMake(15, 35, 290, 27)];
    UIImage * image=[UIImage imageNamed:@"hp_search_input"];
    searchimage.image = image;
    searchimage.userInteractionEnabled=YES;
    [self.view addSubview:searchimage];
    
    mytextfield=[[UITextField alloc]initWithFrame:CGRectMake(5,2, 265, 50)];
    mytextfield.placeholder = @"请输入商户名称";
    mytextfield.font=[UIFont systemFontOfSize:18];
    [searchimage addSubview:mytextfield];
    [mytextfield release];
    
    UIButton *mybutton=[UIButton buttonWithType:UIButtonTypeCustom];
    mybutton.frame=CGRectMake(265,5,16, 16);
    [mybutton addTarget:self action:@selector(searchresult) forControlEvents:UIControlEventTouchUpInside];
    [mybutton setBackgroundImage:[UIImage imageNamed:@"hp_search"] forState:UIControlStateNormal];
    [searchimage addSubview:mybutton];
    
    
    //灰色的label
    garylabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 95, 40, 30)];
    garylabel.text=@"分类:";
    garylabel.backgroundColor=[UIColor clearColor];
    garylabel.textColor=[UIColor darkGrayColor];
    [self.view addSubview:garylabel];
    
    
    
    categoryLabelArray=[[NSMutableArray alloc]initWithObjects:@"热门",@"美食",@"休闲",@"娱乐",@"生活",@"汽车",@"购物",@"旅行",@"健康",@"全部",@" ",@" ",nil];
    //搜索热门
    int column=4;
    int row=[categoryLabelArray count]/4;
    int more=[categoryLabelArray count]%4;
    if (more>0) {
        row=row+1;
    }
    for (int rowNum=0; rowNum<row; rowNum++)
    {
        for(int columnNum=0;columnNum<column;columnNum++)
        {
            {
                UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
                button.frame=CGRectMake(columnNum*80, rowNum*32+125, 80, 32);
                [button addTarget:self action:@selector(didClickButtonCategory:) forControlEvents:
                 UIControlEventTouchUpInside];
                [button setImage:[UIImage imageNamed:@"hp_search_frame"] forState:UIControlStateNormal];
                button.tag=[self buttonTagForIndex:rowNum*column+columnNum];
                [self.view addSubview:button];
                UILabel *labelCategory=[[UILabel alloc]initWithFrame:CGRectMake(15,8,50, 20)];
                labelCategory.text=[categoryLabelArray objectAtIndex:rowNum*column+columnNum];
                labelCategory.textColor=[UIColor colorWithRed:244/255.0 green:144/255.0 blue:56/255.0 alpha:1];
                labelCategory.backgroundColor=[UIColor clearColor];
                labelCategory.textAlignment=NSTextAlignmentCenter;
                [button addSubview:labelCategory];
                [labelCategory release];
            }
            
        }
        
        
        
    }
    
}
-(void)searchresult
{
    [mytextfield resignFirstResponder];
    
    mytextfield.text = [mytextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mytextfield.text.length == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入您要搜索的商户名称" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
    }else{
        
//        _searchResultViewController=[[HPSearchResultViewController alloc]initWithSearchString:mytextfield.text AreaID:currentAreaID];
//        [self.navigationController pushViewController:_searchResultViewController animated:YES];
    }
    mytextfield.text=@"";
}
-(int)buttonTagForIndex:(int)index
{
    switch (index) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 9:
            return 1;
            break;
        default:
            return 8+index;
            break;
    }
}
-(void)didClickButtonCategory:(UIButton *)sender
{
//    _searchResultViewController=[[HPSearchResultViewController alloc]initWithSearchID:sender.tag AreaID:currentAreaID];
//    _searchResultViewController.searchStr = [(UILabel *)[[sender subviews] objectAtIndex:1] text];
//    NSLog(@"searchcategorytag=%d",sender.tag);
//    [self.navigationController pushViewController:_searchResultViewController animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
