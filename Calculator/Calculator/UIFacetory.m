//
//  UIFacetory.m
//  Calculator
//
//  Created by Nam Truong on 2/19/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "UIFacetory.h"
#import "CoreGUIController.h"

@implementation UIFacetory

+(UIButton*)createButtonWithImage:(NSString*)imageNamed {
    UIImage *image = nil;
    
    if ([[CoreGUIController shared] devideModel]==DeviceModeliPad) {
        image = [UIImage imageNamed:[imageNamed stringByReplacingOccurrencesOfString:@"." withString:@"@2x."]];
    } else {
        image = [UIImage imageNamed:imageNamed];
    }
    UIButton *buttonReturn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [buttonReturn setImage:image forState:UIControlStateNormal];
    return buttonReturn;
    
}

@end
