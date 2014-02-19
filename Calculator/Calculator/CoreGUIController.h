//
//  CoreGUIController.h
//  Calculator
//
//  Created by Nam Truong on 2/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainScreenController.h"
#import "PlayScreenViewController.h"
#import "CountDownViewController.h"

typedef enum DeviceModel : NSUInteger {
    DeviceModeliPhone35,
    DeviceModeliPhone4,
    DeviceModeliPad
} DeviceModel;

@interface CoreGUIController : NSObject {
    UIWindow *window;
    MainScreenController *mainScreen;
    PlayScreenViewController *playScreen;
    CountDownViewController *countDownScreen;
    DeviceModel devideModel;
    
}

@property DeviceModel devideModel;

+(id)shared;
-(void)startUp;
-(void)processPlayScreen;
-(void)processFinishedCountDownView;

@end
