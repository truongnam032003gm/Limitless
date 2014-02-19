//
//  MainScreenController.m
//  Calculator
//
//  Created by Nam Truong on 2/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "MainScreenController.h"
#import "CoreGUIController.h"

@implementation MainScreenController

-(id)init {
    self = [super init];
    backGroundName = @"Mental-Math-Background.jpg";
    return self;
}

-(void)loadView {
    [super loadView];

    labelMain = [[UILabel alloc]initWithFrame:CGRectZero];
    labelMain.backgroundColor = [UIColor clearColor];
    labelMain.textAlignment = NSTextAlignmentCenter;
    labelMain.text = @"Your Limit is: 30";
    [self.view addSubview:labelMain];
    
    buttonPlay = [UIFacetory createButtonWithImage:@"Math-Master.png"];
    [self.view addSubview:buttonPlay];
    [buttonPlay addTarget:self action:@selector(buttonPlayPressed:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)buttonPlayPressed :(id)sender {
    [mainGUIController processPlayScreen];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    float sizeText = self.view.frame.size.height/10;
    labelMain.font = [UIFont boldSystemFontOfSize:sizeText/2];
    labelMain.frame = CGRectMake(0, self.view.frame.size.height/2-sizeText, self.view.frame.size.width, sizeText);
    
    buttonPlay.center = CGPointMake(labelMain.center.x, labelMain.center.y+labelMain.frame.size.height+10);
}

@end
