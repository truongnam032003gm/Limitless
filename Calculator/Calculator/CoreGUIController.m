//
//  CoreGUIController.m
//  Calculator
//
//  Created by Nam Truong on 2/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "CoreGUIController.h"

@implementation CoreGUIController

@synthesize devideModel;

+(id)shared {
    static CoreGUIController *instace;
    if (instace==nil)
        instace = [[self alloc]init];
    return instace;
}

-(id)init {
    self = [super init];
    window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    if ([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound) {
        devideModel = DeviceModeliPad;
    } else {
        if (window.frame.size.width>480 || window.frame.size.height>480) {
            devideModel = DeviceModeliPhone4;
        } else {
            devideModel = DeviceModeliPhone35;
        }
    }
    return self;
}

-(void)startUp {
    window.backgroundColor = [UIColor greenColor];
    if (mainScreen==nil) {
        mainScreen = [[MainScreenController alloc]init];
        [window setRootViewController:[[UINavigationController alloc]initWithRootViewController:mainScreen]];
    }
    [self processFinishedCountDownView];
}

-(void)processPlayScreen {
    if (countDownScreen == nil)
        countDownScreen = [[CountDownViewController alloc]init];
    [(UINavigationController*)[window rootViewController] pushViewController:countDownScreen animated:YES];
    [countDownScreen startCountDown];
}

-(void)processFinishedCountDownView {
    if (playScreen==nil)
        playScreen = [[PlayScreenViewController alloc]init];
    [(UINavigationController*)[window rootViewController] pushViewController:playScreen animated:NO];
}

@end
