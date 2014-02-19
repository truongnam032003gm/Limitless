//
//  MyViewController.h
//  Calculator
//
//  Created by Nam Truong on 2/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreGUIController;


@interface MyViewController : UIViewController {
    CoreGUIController *mainGUIController;
    NSString *backGroundName;
    UIImageView *backGroundView;
}

@end
