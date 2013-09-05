//
//  HttpDownload.m
//  XmlDemo
//
//  Created by 张清波 on 12-5-8.
//  Copyright (c) 2012年 . All rights reserved.
//

#import "HttpDownload.h"

@implementation HttpDownload
@synthesize mData,delegate;
@synthesize type=_type;

-(void)downloadFromUrlWithASI:(NSString *)url dict:(NSDictionary *)dict
{
    if (!mData) {
        mData=[[NSMutableData alloc] initWithCapacity:0];
    }
    else{
        [mData setLength:0];
    }
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    request.delegate=self;
    //设置post请求的所有参数
    for (NSString *key in [dict allKeys]) {
        if ([[dict objectForKey:key] isKindOfClass:[NSData class]]) {//上传文件
            [request setData:[dict objectForKey:key] withFileName:@"temp.png" andContentType:nil forKey:key];
        }
        else{
            [request setPostValue:[dict objectForKey:key] forKey:key];
        }
        
        
    }
    [request startAsynchronous];
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    [mData setLength:0];
    [mData appendData:[request responseData]];
    
    [delegate downloadComplete:self];
}
-(void)downloadFromUrl:(NSString *)url
{
    if (!mData) {
        mData=[[NSMutableData alloc] initWithCapacity:0];
    }
    else{
        [mData setLength:0];
    }
    if (mConnection) {
        [mConnection release];
    }
    mConnection=[[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [mData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [mData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [delegate downloadComplete:self];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [delegate downloadFaild:self];
}
@end
