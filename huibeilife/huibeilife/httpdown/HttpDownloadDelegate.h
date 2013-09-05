//
//  HttpDownloadDelegate.h
//  XmlDemo
//
//  Created by 张清波 on 12-5-8.
//  Copyright (c) 2012年 . All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpDownload;
@protocol HttpDownloadDelegate <NSObject>

//下载完成
-(void)downloadComplete:(HttpDownload*)hd;
//下载失败
-(void)downloadFaild:(HttpDownload*)hd;
@end







