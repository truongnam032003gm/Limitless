//
//  CountDownViewController.h
//  Calculator
//
//  Created by Nam Truong on 2/19/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "MyViewController.h"

@interface CountDownViewController : MyViewController {
    UILabel *coundDownLabel;
    int countDown;
}

-(void)startCountDown;

@end
