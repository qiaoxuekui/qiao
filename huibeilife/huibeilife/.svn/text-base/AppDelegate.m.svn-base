//
//  AppDelegate.m
//  huibeilife
//
//  Created by SettyBoBo on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomNavigationController.h"
#import "HPWalletViewController.h"
#import "HPStoreViewController.h"
#import "HPShopViewController.h"
#import "HPSetViewController.h"

@implementation AppDelegate

@synthesize tabBarController=_tabBarController;
@synthesize x_axis;
@synthesize y_axis;
@synthesize firstLogin;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    CLLocationCoordinate2D location=[newLocation coordinate];//当前经纬度
    NSLog(@"%f-------%f",location.latitude,location.longitude);
    self.x_axis=location.latitude;
    self.y_axis=location.longitude;
    
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog( @"CLLocationManager  Error!" );
    
    [locationManager stopUpdatingLocation];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    firstLogin=YES;
    
    locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        
        locationManager.delegate = self;
        locationManager.distanceFilter = 200;//设置距离筛选器
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置精度
        [locationManager startUpdatingLocation];
    } else {
        
    }
    
    UITabBarController *tab=[[UITabBarController alloc]init];
    
    HPShopViewController *shopvc=[[HPShopViewController alloc]init];
    CustomNavigationController *shopNav=[[CustomNavigationController alloc]initWithRootViewController:shopvc];
    
    HPStoreViewController *storevc=[[HPStoreViewController alloc]init];
    CustomNavigationController *storeNav=[[CustomNavigationController alloc]initWithRootViewController:storevc ];
    
    HPWalletViewController *walletvc=[[HPWalletViewController alloc]init];
    CustomNavigationController *walletNav=[[CustomNavigationController alloc]initWithRootViewController:walletvc];
    
    HPSetViewController *setvc=[[HPSetViewController alloc]init];
    CustomNavigationController *setNav=[[CustomNavigationController alloc]initWithRootViewController:setvc];
    
    tab.viewControllers=[NSArray arrayWithObjects:shopNav,storeNav,walletNav,setNav, nil];
    // bottombg
    [[tab tabBar] setBackgroundImage:[UIImage imageNamed:@""]];
    //设置tabbar的背景图片
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hp_tabbarbg"]];
    img.frame = CGRectMake(0, 0,tab.tabBar.frame.size.width,tab.tabBar.frame.size.height);
    img.contentMode = UIViewContentModeScaleToFill;
    //[tab.tabBar insertSubview:img atIndex:1];
    [tab.tabBar insertSubview:img atIndex:1];
    [img release];
    self.tabBarController=tab;
    self.window.rootViewController=_tabBarController;
    
    [tab release];
    
    [shopvc release];
    [storevc release];
    [walletvc release];
    [setvc release];
    
    [shopNav release];
    [storeNav release];
    [walletNav release];
    [setNav release];

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
