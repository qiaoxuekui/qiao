//
//  CategoriesViewCell.m
//  HuiShengHuo
//
//  Created by invent on 13-4-26.
//  Copyright (c) 2013年 iit. All rights reserved.
//

#import "CategoriesViewCell.h"

@implementation CategoriesViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        UIView *selectedBg=[[UIView alloc]initWithFrame:self.frame];
        selectedBg.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        self.selectedBackgroundView=selectedBg;
        [selectedBg release];
        self.selectedTextColor=[UIColor blackColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect textLabelFrame=self.textLabel.frame;
    [self.textLabel setFrame:CGRectMake(40, textLabelFrame.origin.y, textLabelFrame.size.width, textLabelFrame.size.height)];
    [self.imageView setFrame:CGRectMake(5, 5, 20, 20)];
}
@end
