//
//  AppDelegate.h
//  huibeilife
//
//  Created by SettyBoBo on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>
{
    
    CLLocationManager  *locationManager;
    
}


@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UITabBarController *tabBarController;
@property (nonatomic,assign) float x_axis;
@property (nonatomic,assign) float y_axis;
@property (nonatomic,assign) BOOL  firstLogin;

@end
