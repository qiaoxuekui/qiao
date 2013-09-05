//
//  BuyItViewPopView.h
//  HuiBei
//
//  Created by SettyBoBo on 13-7-7.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BuyItViewPopViewDelegate <NSObject>
@optional
-(void)BuyItViewPopViewDidDismiss;

@end
@interface BuyItViewPopView : UIView
{
    id <BuyItViewPopViewDelegate>_delegate;
    
    
}
@property (nonatomic,assign)int selfid;
@property (assign,nonatomic)id <BuyItViewPopViewDelegate>delegate;

//-(id)initWithTitle:(NSString *)title Content:(NSString *)content subContent:(NSString *)subContent shopId:(int)shopid;


-(id)initWithTitle:(NSString *)title Content:(NSString *)content subContent:(NSString *)subContent shopsell:(SEL)buttonsel targrt:(id)target;

-(void)setSureButtonSel:(SEL)sel target:(id)target;
-(void)dismissPopAlertView;
-(void)setTitle:(NSString *)str;

-(void)showPopAlertView;
-(void)setlabel:(NSString *)title buttontile:(NSString *)buttontitle subbuttontiele:(NSString *)subbuttontitle;
-(void)settargrt:(id)target click:(SEL)buttonsell;
@end
