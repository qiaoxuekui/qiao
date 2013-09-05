//
//  Utility.m
//  huibeishenghuo
//
//  Created by SettyBoBo on 13-5-16.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//
#import "Utility.h"
#import "Reachability.h"
#define HSH_TEST
#define NSLOG(x) NSLog(@"%@",x);
@implementation Utility

@end

#pragma mark -
#pragma mark - 获取客户端信息
@implementation ClientInfo
+(void)nslog:(NSDictionary *)my
{
    NSLOG(my);
}
+(void)nslogarrays:(NSArray *)myarrays
{
    NSLOG(myarrays);
}
+(void)nslogstring:(NSString *)string
{
    NSLOG(string);
}
+(NSString *) getClientScrect
{
    return @"46ab9fb63353419eb331ab28da18380e";
}

+(NSString *) getHuipayUrlPrefix
{
#ifdef HSH_TEST
    return @"http://www.huipay.com/huipaycrm/";
    //return @"http://192.168.1.201:8080/huipaycrm/";
    //return @"http://114.251.53.22/huipaycrm/";
   //  return @"http://114.251.53.14/huipaycrm/";
   // return @"http://192.168.1.90/huipaycrm/" ;
   //return @"http://192.168.137.1:8080/huipaycrm/";
 // return @"http://192.168.2.1:8080/huipaycrm/";
#else
    return @"http://www.huipay.com/huipaycrm/";
    // return @"http://114.251.53.22/huipaycrm/";
     // return @"http://114.251.53.14/huipaycrm/";
    //return @"http://192.168.1.90/huipaycrm/" ;
#endif
}
+(long) getClientIdentification
{
    return 164153;
}
+(BOOL)  isNetworkEnable
{
    return (([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable)&&(([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] == NotReachable)))?NO:YES;
}
@end





#pragma mark -
#pragma mark - 获取用户信息类
@implementation UserInfo
+(void) saveUserInfo:(id )info ForKey:(NSString *)key
{
    NSUserDefaults *saveInfo=[NSUserDefaults standardUserDefaults];
    [saveInfo setObject:info forKey:key];
    [saveInfo synchronize];
}
+(id) getUserInfoForKey:(NSString *)key
{
    NSUserDefaults *savedInfo=[NSUserDefaults standardUserDefaults];
    return [savedInfo objectForKey:key];
}
+(BOOL) isUserLogIn
{
    NSUserDefaults *savedInfo=[NSUserDefaults standardUserDefaults];
    if ([savedInfo objectForKey:@"kIsUserLogIn"]==nil) {
        return NO;
    }
    return [[savedInfo objectForKey:@"kIsUserLogIn"]boolValue];
}
+(void) setUserLogInState:(BOOL)b
{
    NSUserDefaults *saveInfo=[NSUserDefaults standardUserDefaults];
    [saveInfo setObject:[NSNumber numberWithBool:b] forKey:@"kIsUserLogIn"];
    [saveInfo synchronize];
}
@end