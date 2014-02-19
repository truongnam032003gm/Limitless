//
//  PlayScreenViewController.h
//  Calculator
//
//  Created by Nam Truong on 2/19/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "MyViewController.h"
#import "UIFacetory.h"

@interface PlayScreenViewController : MyViewController {
    UILabel *question;
    UILabel *labelQuestion;
    UIButton *labelScreen;
    float totalNumberQuestion;
    float currentNumberQuestion;
    NSMutableArray *arrayQuestions;
    NSDictionary *currentDic;
    NSString *currentResult;
    int currentResultValue;
    UILabel *labelScreenText;
}

@end
