//
//  CategoriesView.h
//  HuiShengHuo
//
//  Created by invent on 13-4-18.
//  Copyright (c) 2013年 iit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "SBJson.h"
@class CategoriesView;
@protocol CategoriesViewDelegate <NSObject>
@optional
/*
 当点击CategoriesView，需要做某些事情的时候调用
 */
-(void) didClickedCategoriesView:(CategoriesView*)cv;

/*
 index传出的数值是ID的数值，如果需要ID，只需要传入index即可。
 */
-(void) didClickedSubCategoriesViewWithCategoriesID:(NSInteger)categoriesID;
-(void) didClickedcategeoriesVieWithID:(NSInteger)cateId;
-(void) didClickedSubCategoriesViewWithCategoriesID:(NSInteger)categoriesID Name:(NSString*)name;
/*
 点击全部分类调用
 */
-(void) didClickedCategoriesViewAllCategories;
@end

@interface CategoriesView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UITableView *_subTableView;
    id<CategoriesViewDelegate> _delegate;
    //
    ASIHTTPRequest *categoriesRequest;
    NSMutableArray *categoriesArray;
    int selectedCategoriesRow;
    NSString *selectedCategoriesString;
    NSMutableArray *idArray;
}
@property (nonatomic,assign) id<CategoriesViewDelegate> delegate;
@property (nonatomic,assign) UITableView *tableView;
-(void) popCategoriesViewFromViewController:(UIViewController *)vc  Animated:(BOOL)animated;
-(void) dismissCategoriesViewAnimated:(BOOL)animated;
- (id)initWithFrame:(CGRect)frame ;
@end
