//
//  AllKindsOfEncapsulation.m
//  huibeishenghuo
//
//  Created by SettyBoBo on 13-5-15.
//  Copyright (c) 2013年 SettyBoBo. All rights reserved.
//

#import "AllKindsOfEncapsulation.h"

@implementation AllKindsOfEncapsulation
static AllKindsOfEncapsulation *myView=nil;

+ (AllKindsOfEncapsulation *)shared
{
    if (myView==nil) {
        myView = [[self alloc] init];
    }
    return myView;
}
/*
- (NSString*)replaceCharactersInRange:(NSMutableString*)string num:(int)num{

    [string replaceCharactersInRange:NSMakeRange([string length]-6, num) withString:@"****"];
    return string;

}
 */
+(NSString*)encrypt:(NSMutableString*)string num:(int)num;
{
//    NSRange rangeTest=NSMakeRange(5, 8);
//    NSString *mystring=[string substringWithRange:rangeTest];
    if ([string length]<6) {
        return string;
    }else{
    [string replaceCharactersInRange:NSMakeRange([string length]-6, num) withString:@"****"];
        return string;
    }
}


+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    
    UIGraphicsBeginImageContext(size);
    //size 为CGSize类型，即所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 8, size.width-5, size.height-8)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return scaledImage;   //返回的就是已经改变的图片
}
+ (UILabel *)creatLabel:(CGRect)frame andText:(NSString *)labelText andFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = labelText;
    label.font = font;
    return [label autorelease];
}

+ (UIView *)getView:(NSString *)briefImage andIcon:(NSString *)iconImage andName:(NSString *)name andColor:(UIColor *)color andFatherName:(NSString *)fatherName
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 132, 65)];
    imageView.image = [UIImage imageNamed:briefImage];
    [bgView addSubview:imageView];
    [imageView release];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(8, 71, 17, 15)];
    imageView2.image = [UIImage imageNamed:iconImage];
    [bgView addSubview:imageView2];
    [imageView2 release];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(119, 71, 12, 14)];
    imageView3.image = [UIImage imageNamed:@"jiantou.png"];
    [bgView addSubview:imageView3];
    [imageView3 release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(27, 71, 73, 16)];
    label.text = name;
    label.font = [UIFont systemFontOfSize:13];
    [bgView addSubview:label];
    [label release];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 89, 137, 3)];
    label1.backgroundColor = color;
    [bgView addSubview:label1];
    [label1 release];
    
    if (fatherName!=nil || [fatherName length]!=0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(3, 3, 132, 65)];
        UILabel *labelText = [self creatLabel:CGRectMake(75, 6, 80, 16) andText:fatherName andFont:[UIFont systemFontOfSize:14]];
        labelText.textColor = color;
        labelText.backgroundColor = [UIColor clearColor];
        [view addSubview:labelText];
        UILabel *labelKuai = [self creatLabel:CGRectMake(labelText.frame.origin.x-10, 10, 10, 10) andText:nil andFont:nil];
        labelKuai.backgroundColor = color;
        [view addSubview:labelKuai];
        
        view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        [bgView addSubview:view];
        [view release];
    }
    
    
    return [bgView autorelease];
}

+ (UIButton *)creatButton:(CGRect)frame andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andHighlightedImage:(NSString *)highlightedImage andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}
+ (UIButton *)creatButton:(CGRect)frame andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}

+ (UIButton *)creatButton:(CGRect)frame andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andHighlightedImage:(NSString *)highlightedImage andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target andleftCapWidth:(NSInteger)leftCapWidth andTopCapWidth:(NSInteger)topCapWidth
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[[UIImage imageNamed:normalImage] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapWidth] forState:UIControlStateNormal];
    [button setBackgroundImage:[[UIImage imageNamed:highlightedImage]stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapWidth] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}

+ (UIImageView *)creatImageView:(CGRect)frame andImage:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    return [imageView autorelease];
}

+ (UILabel *)creatNavigationBarWithBackGroundImage:(NSString *)imageName andTitle:(NSString *)title andLeftButton:(UIButton *)leftButton andRightbutton:(UIButton *)rightButton
{
    UILabel *navigationBar=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navigationBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:imageName]]];
    if (title!=nil&&[title length]!=0)
    {
        navigationBar.text=title;
        navigationBar.textAlignment=NSTextAlignmentCenter;
        navigationBar.font=[UIFont boldSystemFontOfSize:22];
        navigationBar.textColor=[UIColor whiteColor];
    }
    if (leftButton!=nil)
    {
        navigationBar.userInteractionEnabled=YES;
        [navigationBar addSubview:leftButton];
    }
    if (rightButton!=nil)
    {
        navigationBar.userInteractionEnabled=YES;
        [navigationBar addSubview:rightButton];
    }
    
    return [navigationBar autorelease];
}
+(void)removeAllViewFrom:(UIView*)View
{
    NSArray *subViews = [View subviews];
    
    if([subViews count] != 0) {
        
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
    }
    
}
+ (UIButton *)creatButton:(CGRect)frame  andNormalImage:(NSString *)normalImage  andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button ;
}

//+ (UIView *)creatMessageView:(CGRect)frame andName:(NSString *)name andImage:(NSString *)imageName andDate:(NSString *)date andMessage:(NSString *)message andMessageFrame:(CGRect)messageFrame
//{
//    UIImage *image = [UIImage imageNamed:imageName];
//    
//    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:image];
//    bgImageView.frame = frame;
//    [bgImageView setContentStretch:CGRectMake(0.2, 0.8, 0.1, 0.01)];
//    
//    UILabel *label1 = [self creatLabel:CGRectMake(5, 2, 30, 30) andText:name andFont:[UIFont systemFontOfSize:12]];
//    label1.backgroundColor = [UIColor clearColor];
//    [bgImageView addSubview:label1];
//    UILabel *label2 = [self creatLabel:CGRectMake(25, 2, 125, 30) andText:date andFont:[UIFont systemFontOfSize:12]];
//    label2.backgroundColor = [UIColor clearColor];
//    [bgImageView addSubview:label2];
//    
//    UILabel *label3 = [self creatLabel:messageFrame andText:message andFont:[UIFont boldSystemFontOfSize:15]];
//    label3.numberOfLines = 0;
//    label3.backgroundColor = [UIColor clearColor];
//    [bgImageView addSubview:label3];
//    
//    return [bgImageView autorelease];
//}

+(UIButton *)creatButtonWithFrame:(CGRect)ButtonFrame andNormalImage:(NSString *)NormalImage andSelectImage:(NSString *)selectImage andRightImage:(NSString *)RightImage  andLeftImage:(NSString *)LeftImage   andSelector:(SEL)selector andTag:(NSInteger)tag andTarget:(id)target
{
    UIButton * order = [UIButton buttonWithType:UIButtonTypeCustom];
    order.frame = ButtonFrame;
    [order setBackgroundImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    [order setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [order addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    order.tag=tag;
    UIImageView * cateView = [[UIImageView alloc]init];
    [cateView setImage:[UIImage imageNamed:LeftImage]];
    cateView.frame = CGRectMake(10, 10, 15, 15);
    [order addSubview:cateView];
    [cateView release];
    UIImageView * dropdownImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:RightImage]];
    dropdownImageView.frame = CGRectMake(90, 17, 8, 8);
    [order addSubview:dropdownImageView];
    [dropdownImageView release];
    order.adjustsImageWhenHighlighted = NO;
    return order;
}


@end
