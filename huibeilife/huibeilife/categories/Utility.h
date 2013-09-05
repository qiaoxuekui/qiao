//
//  Utility.h
//  huibeishenghuo
//
//  Created by SettyBoBo on 13-5-16.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

@end
#pragma mark -
#pragma mark - 获取客户端信息
@interface ClientInfo: NSObject
+(void)nslog:(NSDictionary *)my;
+(void)nslogarrays:(NSArray *)myarray;
+(void)nslogstring:(NSString *)string;
+(long )  getClientIdentification;
+(NSString *) getClientScrect;
+(NSString *) getHuipayUrlPrefix;
+(BOOL)  isNetworkEnable;
@end

#pragma mark -
#pragma mark - 获取用户信息类
@interface UserInfo : NSObject
+(void) saveUserInfo:(id )info ForKey:(NSString *)key;
+(id) getUserInfoForKey:(NSString *)key;
+(BOOL) isUserLogIn;
+(void) setUserLogInState:(BOOL)b;
@end