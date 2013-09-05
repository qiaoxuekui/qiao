//
//  HttpDownload.h
//  XmlDemo
//
//  Created by 张清波 on 12-5-8.
//  Copyright (c) 2012年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpDownloadDelegate.h"
#import "ASIFormDataRequest.h"
@interface HttpDownload : NSObject<NSURLConnectionDataDelegate,ASIHTTPRequestDelegate>
{
    id<HttpDownloadDelegate> delegate;
    NSMutableData *mData;
    NSURLConnection *mConnection;
}
@property (nonatomic,readonly) NSMutableData *mData;
@property (nonatomic,assign) id delegate;
@property (nonatomic,assign) NSInteger type;
//从指定网址下载数据

-(void)downloadFromUrl:(NSString*)url;
-(void)downloadFromUrlWithASI:(NSString*)url dict:(NSDictionary*)dict;
@end



