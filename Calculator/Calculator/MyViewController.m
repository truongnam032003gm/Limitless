//
//  MyViewController.m
//  Calculator
//
//  Created by Nam Truong on 2/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "MyViewController.h"
#import "CoreGUIController.h"

@implementation MyViewController

-(id)init {
    self = [super init];
    mainGUIController = [CoreGUIController shared];
    return self;
}

-(void)loadView {
    [super loadView];
    backGroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    if (![backGroundName isEqualToString:@""]) {
        backGroundView.image = [UIImage imageNamed:backGroundName];
    }
    [self.view addSubview:backGroundView];
    self.navigationController.navigationBarHidden = YES;
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    backGroundView.frame = self.view.bounds;

}

@end
