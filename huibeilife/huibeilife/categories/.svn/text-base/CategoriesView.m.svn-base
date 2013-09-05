//
//  CategoriesView.m
//  HuiShengHuo
//
//  Created by invent on 13-4-18.
//  Copyright (c) 2013年 iit. All rights reserved.
//

#import "CategoriesView.h"
#import "UIImageView+WebCache.h"
#import "CategoriesViewCell.h"
#import "Utility.h"
#import <QuartzCore/QuartzCore.h>
#define kCategories @"categories"
#define kCategoriesID @"id"
#define kCategoriesName @"name"
#define kCategoriesLabel @"label"
#define kCategoriesLogo @"logo"

#define kChild_Categories @"child_categories"
#define kChild_CategoriesID @"id"
#define kChild_CategoriesName @"name"
#define kChild_CategoriesLabel @"label"

@implementation CategoriesView
@synthesize delegate=_delegate;
@synthesize tableView=_tableView;
-(void)dealloc
{
    [_tableView release];
    [_subTableView release];
    _delegate=nil;
    [categoriesArray release];
    [super dealloc];
}
-(NSString*) categoriesPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesPath=[paths objectAtIndex:0];
    return [cachesPath stringByAppendingPathComponent:@"setup.txt"];
}

-(void) resetcategoriesArray
{
    if(categoriesArray!=nil)
    {
        [categoriesArray removeAllObjects];
        [categoriesArray release];
        categoriesArray=nil;
    }
    categoriesArray=[[NSMutableArray alloc]initWithCapacity:0];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        categoriesArray =[[NSMutableArray alloc]initWithContentsOfFile:[self categoriesPath]];
        if (![categoriesArray count]) {
            [self resetcategoriesArray];
            [self startClassificationRequest];
        }else
        {
            [self setupContentViews];
        }
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // [_tableV setFrame:self.frame];
}

-(void) setupContentViews
{
    UIView *tempView=[[UIView alloc]initWithFrame:self.frame];
    CALayer *en=[tempView layer];
    //是否设置边框以及是否可见
    [en setMasksToBounds:YES];
    //设置边框圆角的弧度
    [en setCornerRadius:3];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClassView)];
    [tempView addGestureRecognizer:tap];
    [tap release];
    [self addSubview:tempView];
    [tempView release];
    //
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/2.0, self.frame.size.height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    CALayer *en1=[_tableView layer];
    //是否设置边框以及是否可见
    [en1 setMasksToBounds:YES];
    //设置边框圆角的弧度
    [en1 setCornerRadius:3];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    //
    _subTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, 0, self.frame.size.width/2.0, self.frame.size.height)];
    _subTableView.delegate=self;
    _subTableView.dataSource=self;
    _tableView.backgroundColor=[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1];
    _subTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self addSubview:_subTableView];
    [_subTableView setHidden:YES];
}
-(void) popCategoriesViewFromViewController:(UIViewController *)vc  Animated:(BOOL)animated
{
    if (animated)
    {
        self.alpha=0.5f;
        [vc.view addSubview: self];
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha=1.0f;
        }];
    }
    else
    {
        [vc.view addSubview: self];
    }
    
}
-(void) dismissCategoriesViewAnimated:(BOOL)animated
{
    if ([self superview])
    {
        if (animated)
        {
            [UIView animateWithDuration:0.3 animations:^{
                [self removeFromSuperview];
            }];
        }
        else
            [self removeFromSuperview];
    }
}
/*
 当一级菜单显示，二级菜单没有显示，同时点击二级菜单背景部分时调用次方法
 */
-(void) tapClassView
{
    if ([self.delegate respondsToSelector:@selector(didClickedCategoriesView:)]) {
        [self.delegate didClickedCategoriesView:self];
    }
}
#pragma mark -
#pragma mark UITableView Delegate/DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_tableView) {
        return [categoriesArray count]+1;
    }
    
    if (tableView==_subTableView) {
        NSDictionary *categoriesItem=[categoriesArray objectAtIndex:selectedCategoriesRow];
        NSArray *childCategoriesArray=[categoriesItem objectForKey:kChild_Categories];
        return [childCategoriesArray count];
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_tableView) {
        static NSString *CellID=@"My Cell";
        CategoriesViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell==nil) {
            cell=[[[CategoriesViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID]autorelease];
            //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
          cell.selectionStyle=UITableViewCellSelectionStyleNone; 
            cell.textLabel.font=[UIFont systemFontOfSize:15];
            cell.textLabel.textColor=[UIColor whiteColor];
            //
        }
        if (indexPath.row==0) {
            [cell.imageView setImageWithURL:[NSURL URLWithString:@"nil"] placeholderImage:[UIImage imageNamed:@"category_all.png"]];
            cell.textLabel.text=@"全部";
            return cell;
        }
        
        NSDictionary *categoriesItem=[categoriesArray objectAtIndex:indexPath.row-1];
        cell.textLabel.text=[categoriesItem objectForKey:kCategoriesLabel];
        [cell.imageView setImageWithURL:[NSURL URLWithString:[categoriesItem objectForKey: kCategoriesLogo]] placeholderImage:[UIImage imageNamed:@"category_all.png"]];
        return cell;
    }
    else if (tableView==_subTableView) {
        static NSString *SubCellID=@"My SubCell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:SubCellID];
        if (cell==nil) {
            cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SubCellID]autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.textLabel.textAlignment=NSTextAlignmentCenter;
            cell.textLabel.font=[UIFont systemFontOfSize:15];
        }
        NSDictionary *selectedCategoriesItem=[categoriesArray objectAtIndex:selectedCategoriesRow];
        NSArray *childCategoriesArray=[selectedCategoriesItem objectForKey:kChild_Categories];
        NSDictionary *childCategoriedItem=[childCategoriesArray objectAtIndex:indexPath.row];
        cell.textLabel.text=[childCategoriedItem objectForKey:kChild_CategoriesLabel];
        return cell;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_tableView) {
        if (indexPath.row!=0) {
            [_subTableView setHidden:YES];
            selectedCategoriesRow=indexPath.row-1;
            NSDictionary *diction=[categoriesArray objectAtIndex:selectedCategoriesRow];
            NSInteger pid=[[diction objectForKey:@"id"]integerValue];
            NSString *name=[diction objectForKey:@"label"];
           // NSString *logo=[diction objectForKey:@"logo"];
            [_delegate didClickedSubCategoriesViewWithCategoriesID:pid Name:name];
            
            [_subTableView reloadData];
//            NSDictionary *categoriesItem=[categoriesArray objectAtIndex:indexPath.row-1];
//            selectedCategoriesString=[categoriesItem objectForKey:kCategoriesLabel];
        }else
        {
            if ([_delegate respondsToSelector:@selector(didClickedCategoriesViewAllCategories)]) {
                [_delegate didClickedCategoriesViewAllCategories];
            }
            [_subTableView setHidden:YES];
        }
        
    }
    if (tableView==_subTableView) {
        [_subTableView setHidden:YES];
        [_tableView selectRowAtIndexPath:nil animated:NO scrollPosition:UITableViewScrollPositionNone];
        if ([self.delegate respondsToSelector:@selector(didClickedSubCategoriesViewWithCategoriesID:)]||[_delegate respondsToSelector:@selector(didClickedSubCategoriesViewWithCategoriesID:Name:)]) {
            NSDictionary *selectedCategoriesItem=[categoriesArray objectAtIndex:selectedCategoriesRow];
            NSArray *childCategoriesArray=[selectedCategoriesItem objectForKey:kChild_Categories];
            NSDictionary *selectedChildCategoriedItem=[childCategoriesArray objectAtIndex:indexPath.row];
            NSNumber *childCategoriesID=[selectedChildCategoriedItem objectForKey:kChild_CategoriesID];
            if([_delegate respondsToSelector:@selector(didClickedSubCategoriesViewWithCategoriesID:)])
                [self.delegate didClickedSubCategoriesViewWithCategoriesID:[childCategoriesID integerValue]];

            if ([_delegate respondsToSelector:@selector(didClickedSubCategoriesViewWithCategoriesID:Name:)]) {
                if (indexPath.row!=0) {
                    [self.delegate didClickedSubCategoriesViewWithCategoriesID:[childCategoriesID integerValue] Name:[selectedChildCategoriedItem objectForKey:kChild_CategoriesLabel]];
                }else
                {
                    [self.delegate didClickedSubCategoriesViewWithCategoriesID:[childCategoriesID integerValue] Name:selectedCategoriesString];
                }
            }
        }
    }
}

#pragma mark -
#pragma mark ASIHttp methods
-(void)startClassificationRequest
{
    categoriesRequest=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@1/category/categories.json",[ClientInfo getHuipayUrlPrefix]]]];
    categoriesRequest.delegate=self;
    [categoriesRequest setRequestMethod:@"GET"];
    [categoriesRequest startAsynchronous];
}


-(void)requestFailed:(ASIHTTPRequest *)request
{
    //NSLog(@"error");
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    //
    NSDictionary *d=[NSDictionary dictionary];
    SBJsonParser *jsonParser=[[SBJsonParser alloc]init];
    if (request.responseData)
    {
        d=[jsonParser objectWithData:request.responseData];
    }
    //NSLog(@"d is %@",d);
    //////////////////////////////////////////////////////////////
    if (request==categoriesRequest)
    {
        //
        if ([categoriesArray count])
        {
            [categoriesArray removeAllObjects];
        }
        NSArray *categoriesTempArray = [d objectForKey:kCategories];
        for (NSDictionary *dic in categoriesTempArray) {
            //NSLog(@"dic %@",dic);
            //categoriesItemDic
            NSMutableDictionary *categoriesItemDic=[NSMutableDictionary dictionaryWithCapacity:0];
            if([dic objectForKey:kCategoriesLabel])
                [categoriesItemDic setObject:[dic objectForKey:kCategoriesLabel] forKey:kCategoriesLabel];
            if([dic objectForKey:kCategoriesName])
                [categoriesItemDic setObject:[dic objectForKey:kCategoriesName] forKey:kCategoriesName];
            if ([dic objectForKey:kCategoriesID])
            {
                [categoriesItemDic setObject:[dic objectForKey:kCategoriesID] forKey:kCategoriesID];
            }
            if([dic objectForKey:kCategoriesLogo])
            {
                [categoriesItemDic setObject:[dic objectForKey:kCategoriesLogo] forKey:kCategoriesLogo];
                UIImageView *imageView=[[UIImageView alloc]init];
                [imageView setImageWithURL:[NSURL URLWithString:[dic objectForKey:kCategoriesLogo]]];
                [imageView release];
            }
            
            //
            if([dic objectForKey:kChild_Categories])
            {
                //childCategories
                NSArray *childCategoriedTempArray= [dic objectForKey:kChild_Categories];
                NSMutableArray *childCategoriesArray=[NSMutableArray arrayWithCapacity:0];
                [childCategoriesArray removeAllObjects];
                for (NSDictionary *subDic in childCategoriedTempArray)
                {
                    NSMutableDictionary *childCategoriesItemDic=[NSMutableDictionary dictionaryWithCapacity:0];
                    if([subDic objectForKey:kChild_CategoriesID])
                        [childCategoriesItemDic setObject:[subDic objectForKey:kChild_CategoriesID] forKey:kChild_CategoriesID];
                    if([subDic objectForKey:kChild_CategoriesLabel])
                        [childCategoriesItemDic setObject:[subDic objectForKey:kChild_CategoriesLabel] forKey:kChild_CategoriesLabel];
                    if([subDic objectForKey:kChild_CategoriesName])
                        [childCategoriesItemDic setObject:[subDic objectForKey:kChild_CategoriesName] forKey:kChild_CategoriesName];
                    
                    [childCategoriesArray addObject:childCategoriesItemDic];
                }
                if([childCategoriesArray count])
                {
                    [categoriesItemDic setObject:childCategoriesArray forKey:kChild_Categories];
                }
            }
            //
            [categoriesArray addObject:categoriesItemDic];
        }
        [self setupContentViews];
        [categoriesArray writeToFile:[self categoriesPath] atomically:YES];
        [_tableView reloadData];
        [_subTableView reloadData];
        
    }
    [jsonParser release];
}

@end
