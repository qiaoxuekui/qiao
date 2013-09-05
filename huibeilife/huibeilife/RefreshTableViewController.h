//
//  RefreshTableViewController.h
//  HuiBei
//
//  Created by invent on 13-6-5.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
@protected
    
    BOOL isDragging;
    BOOL isRefreshing;
    BOOL isLoadingMore;
    
    CGRect headerViewFrame;
}

@property (nonatomic, retain) UIView *headerView;

@property (nonatomic, retain) UIView *footerView;

@property (nonatomic, retain) UITableView *tableView;
@property (readonly) BOOL isDragging;
@property (readonly) BOOL isRefreshing;
@property (readonly) BOOL isLoadingMore;
@property (nonatomic) BOOL canLoadMore;

@property (nonatomic) BOOL pullToRefreshEnabled;

@property (nonatomic) BOOL clearsSelectionOnViewWillAppear;

- (void) initialize;

#pragma mark - 刷新

- (CGFloat) headerRefreshHeight;
- (void) willShowHeaderView:(UIScrollView *)scrollView;
- (void) headerViewDidScroll:(BOOL)willRefreshOnRelease scrollView:(UIScrollView *)scrollView;
- (void) pinHeaderView;
- (void) unpinHeaderView;
- (void) willBeginRefresh;
- (BOOL) refresh;
- (void) refreshCompleted;

#pragma mark - 加载更多

- (CGFloat) footerLoadMoreHeight;
- (BOOL) loadMore;
- (void) willBeginLoadingMore;
- (void) loadMoreCompleted;
- (void) pinFooterView;
- (void) unpinFooterView;
- (void) setFooterViewVisibility:(BOOL)visible;

- (void) footerViewDidScroll:(BOOL)willLoadMoreOnRelease scrollView:(UIScrollView *)scrollView;
#pragma mark - allLoadingCompleted

- (void) allLoadingCompleted;

#pragma mark - releaseViewComponents

- (void) releaseViewComponents;

@end
