//
//  RefreshFooterView.h
//  HuiBei
//
//  Created by invent on 13-6-4.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "RefreshTableViewController.h"

#define DEFAULT_HEIGHT_OFFSET 52.0f

@implementation RefreshTableViewController

@synthesize tableView;
@synthesize headerView;
@synthesize footerView;

@synthesize isDragging;
@synthesize isRefreshing;
@synthesize isLoadingMore;

@synthesize canLoadMore;

@synthesize pullToRefreshEnabled;

@synthesize clearsSelectionOnViewWillAppear;
//初始化
- (void) initialize
{
    pullToRefreshEnabled = YES;
    
    canLoadMore = YES;
    
    clearsSelectionOnViewWillAppear = YES;
}

- (id) init
{
    if ((self = [super init]))
        [self initialize];
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
        [self initialize];
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[[UITableView alloc] init] autorelease];
    tableView.frame = self.view.bounds;
    tableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //是否清空已经选择的cell
    if (clearsSelectionOnViewWillAppear) {
        NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
        if (selected)
            [self.tableView deselectRowAtIndexPath:selected animated:animated];
    }
}


#pragma mark - Pull to Refresh

- (void) setHeaderView:(UIView *)aView
{
    if (!tableView)
        return;
    
    if (headerView && [headerView isDescendantOfView:tableView])
        [headerView removeFromSuperview];
    [headerView release]; headerView = nil;
    
    if (aView) {
        headerView = [aView retain];
        
        CGRect f = headerView.frame;
        headerView.frame = CGRectMake(f.origin.x, 0 - f.size.height, f.size.width, f.size.height);
        headerViewFrame = headerView.frame;
        
        [tableView addSubview:headerView];
    }
}
//header高度
- (CGFloat) headerRefreshHeight
{
    if (!CGRectIsEmpty(headerViewFrame))
        return headerViewFrame.size.height;
    else
        return DEFAULT_HEIGHT_OFFSET;
}
//固定header
- (void) pinHeaderView
{
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.tableView.contentInset = UIEdgeInsetsMake([self headerRefreshHeight], 0, 0, 0);
    }];
}
//释放header
- (void) unpinHeaderView
{
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.tableView.contentInset = UIEdgeInsetsZero;
    }];
}
//将要刷新
- (void) willBeginRefresh
{
    if (pullToRefreshEnabled)
        [self pinHeaderView];
}
//将要显示header
- (void) willShowHeaderView:(UIScrollView *)scrollView
{
    
}

- (void) headerViewDidScroll:(BOOL)willRefreshOnRelease scrollView:(UIScrollView *)scrollView
{
    
}
//开始刷新
- (BOOL) refresh
{
    if (isRefreshing)
        return NO;
    
    [self willBeginRefresh];
    isRefreshing = YES;
    return YES;
}
//刷新结束
- (void) refreshCompleted
{
    isRefreshing = NO;
    
    if (pullToRefreshEnabled)
        [self unpinHeaderView];
}


#pragma mark - Load More

- (void) setFooterView:(UIView *)aView
{
    if (!tableView)
        return;
    
    tableView.tableFooterView = nil;
    [footerView release]; footerView = nil;
    
    if (aView) {
        footerView = [aView retain];
        
        tableView.tableFooterView = footerView;
    }
}
//固定footer
- (void) pinFooterView
{
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.tableView.contentInset = UIEdgeInsetsZero;
    }];
}
//释放footer
- (void)unpinFooterView
{
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.tableView.contentInset = UIEdgeInsetsZero;
    }];
}
//
- (void) willBeginLoadingMore
{
    [self pinFooterView];
    
}

- (void) footerViewDidScroll:(BOOL)willLoadMoreOnRelease scrollView:(UIScrollView *)scrollView
{
    
}
//加载结束
- (void) loadMoreCompleted
{
    isLoadingMore = NO;
    [self unpinFooterView];
}
//开始加载更多
- (BOOL) loadMore
{
    if (isLoadingMore)
        return NO;
    
    [self willBeginLoadingMore];
    isLoadingMore = YES;
    return YES;
}
//footer高度
- (CGFloat) footerLoadMoreHeight
{
    if (footerView)
        return footerView.frame.size.height;
    else
        return DEFAULT_HEIGHT_OFFSET;
}
//是否可见
- (void) setFooterViewVisibility:(BOOL)visible
{
    if (visible && self.tableView.tableFooterView != footerView)
        self.tableView.tableFooterView = footerView;
    else if (!visible)
        self.tableView.tableFooterView = nil;
}


#pragma mark -
//全部结束
- (void) allLoadingCompleted
{
    if (isRefreshing)
        [self refreshCompleted];
    if (isLoadingMore)
        [self loadMoreCompleted];
}
//下面的都是scrollView的代理
#pragma mark - UIScrollViewDelegate

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (isRefreshing)
        return;
    isDragging = YES;
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    //往下拉
    if (!isRefreshing && isDragging && scrollView.contentOffset.y < 0) {
        
        [self headerViewDidScroll:scrollView.contentOffset.y < 0 - [self headerRefreshHeight]
                       scrollView:scrollView];
    } else if (!isLoadingMore && !isRefreshing && isDragging && canLoadMore &&scrollView.contentOffset.y > 0) {
        //往上拉
        CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y;
        [self footerViewDidScroll:scrollPosition < -20 scrollView:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (isRefreshing)
        return;
    
    isDragging = NO;
    //往下拉
    if (scrollView.contentOffset.y <= 0 - [self headerRefreshHeight]) {
        if (pullToRefreshEnabled)
            [self refresh];
    }
    //往上拉
    CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y;
    if (scrollView.contentOffset.y>0&&scrollPosition < -20) {
        [self loadMore];
    }
}

#pragma mark - UITableViewDelegate

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark -

- (void) releaseViewComponents
{
    [headerView release]; headerView = nil;
    [footerView release]; footerView = nil;
    [tableView release]; tableView = nil;
}

- (void) dealloc
{
    [self releaseViewComponents];
    [super dealloc];
}

- (void) viewDidUnload
{
    [self releaseViewComponents];
    [super viewDidUnload];
}

@end

