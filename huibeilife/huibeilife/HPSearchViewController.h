//
//  HPSearchViewController.h
//  huibeilife
//
//  Created by SettyBoBo on 13-9-4.
//  Copyright (c) 2013年 huiyingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPSearchViewController : UIViewController
{
    UILabel *titlecolour;
    UIButton *buttonleft;
    UIImageView *searchimage;
    UILabel *searchLabel;
    //灰色的label
    UILabel *garylabel;
    UITextField *mytextfield;
    NSMutableArray *categoryLabelArray;
}
-(id)initWithAreaID:(int)areaID;

@end
