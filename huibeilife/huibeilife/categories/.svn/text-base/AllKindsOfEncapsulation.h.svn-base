//
//  AllKindsOfEncapsulation.h
//  huibeishenghuo
//
//  Created by SettyBoBo on 13-5-15.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllKindsOfEncapsulation : NSObject
{
    BOOL isClick;
}
+(NSString*)encrypt:(NSMutableString*)string num:(int)num;
+ (AllKindsOfEncapsulation *)shared;
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
//+ (UIView *)creatMessageView:(CGRect)frame andName:(NSString *)name andImage:(NSString *)imageName andDate:(NSString *)date andMessage:(NSString *)message andMessageFrame:(CGRect)messageFrame;

+ (UIView *)getView:(NSString *)briefImage andIcon:(NSString *)iconImage andName:(NSString *)name andColor:(UIColor *)color andFatherName:(NSString *)fatherName;

+ (UILabel *)creatLabel:(CGRect)frame andText:(NSString *)labelText andFont:(UIFont *)font;

+ (UIButton *)creatButton:(CGRect)frame andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andHighlightedImage:(NSString *)highlightedImage andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target;

+ (UIButton *)creatButton:(CGRect)frame andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target;


+ (UIButton *)creatButton:(CGRect)frame andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andHighlightedImage:(NSString *)highlightedImage andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target andleftCapWidth:(NSInteger)leftCapWidth andTopCapWidth:(NSInteger)topCapWidth;

+ (UIImageView *)creatImageView:(CGRect)frame andImage:(NSString *)image;

+ (UILabel *)creatNavigationBarWithBackGroundImage:(NSString *)imageName andTitle:(NSString *)title andLeftButton:(UIButton *)leftButton andRightbutton:(UIButton *)rightButton;

+ (UIButton *)creatButton:(CGRect)frame  andNormalImage:(NSString *)normalImage  andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target ;

+(UIButton *)creatButtonWithFrame:(CGRect)ButtonFrame andNormalImage:(NSString *)NormalImage andSelectImage:(NSString *)selectImage andRightImage:(NSString *)RightImage  andLeftImage:(NSString *)LeftImage   andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target;
+(void)removeAllViewFrom:(UIView*)View;
@end
