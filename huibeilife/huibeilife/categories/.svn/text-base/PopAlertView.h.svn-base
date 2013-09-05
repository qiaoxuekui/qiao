//
//  PopAlertView.h
//  huibeishenghuo
//
//  Created by invent on 13-5-26.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PopAlertViewDelegate <NSObject>
@optional
-(void)popAlertViewDidDismiss;

@end

@interface PopAlertView : UIView
{
    id <PopAlertViewDelegate>_delegate;
}
@property (assign,nonatomic)id <PopAlertViewDelegate>delegate;
-(id)initWithTitle:(NSString *)title Content:(NSString *)content subContent:(NSString *)subContent;
-(void)showPopAlertView;
@end
