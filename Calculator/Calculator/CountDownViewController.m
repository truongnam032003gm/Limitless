//
//  CountDownViewController.m
//  Calculator
//
//  Created by Nam Truong on 2/19/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "CountDownViewController.h"



@implementation CountDownViewController

-(id)init {
    self = [super init];
    backGroundName = @"bg_playscreen.jpg";
    return self;
}

-(void)loadView {
    [super loadView];
    float countLabelHeit = self.view.frame.size.height/2;
    coundDownLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, countLabelHeit)];
    coundDownLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:coundDownLabel];
    coundDownLabel.font = [UIFont boldSystemFontOfSize:countLabelHeit/2];
    coundDownLabel.text = @"";
    coundDownLabel.textColor = [UIColor colorWithRed:0 green:126.0/255.0 blue:146.0/255.0 alpha:1];
    coundDownLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)startCountDown {
    countDown = 4;
    [self countDown];
}

-(void)countDown {
    [self updateLabel];
    if (countDown>0) {
        countDown--;
        [self performSelector:@selector(countDown) withObject:nil afterDelay:1];
    } else {
        [mainGUIController processFinishedCountDownView];
    }
}

-(void)updateLabel {
    if (countDown>0)
        coundDownLabel.text = [NSString stringWithFormat:@"%d", countDown];
    else
        coundDownLabel.text = @"Go";
}



@end
