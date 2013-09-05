//
//  UnderLineLabel.h
//  CustomLabelWithUnderLine
//
//  Created by liuweizhen on 13-4-17.
//  Copyright (c) 2013年 WeiZhen_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnderLineLabel : UILabel
{
    UIControl *_actionView;
    UIColor *_highlightedColor;
}

@property (nonatomic, retain) UIColor *highlightedColor;

- (void)setText:(NSString *)text andCenter:(CGPoint)center;
- (void)addTarget:(id)target action:(SEL)action;
@end
 