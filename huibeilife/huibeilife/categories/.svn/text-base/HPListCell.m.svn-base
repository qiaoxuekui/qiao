//
//  HPListCell.m
//  huibeilife
//
//  Created by invent on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import "HPListCell.h"

@implementation HPListCell

@synthesize listText=_listText;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _listText=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _listText.backgroundColor=[UIColor clearColor];
        _listText.textColor=[UIColor whiteColor];
        _listText.textAlignment=NSTextAlignmentCenter;
        
        [self addSubview:_listText];
        [_listText release];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
