//
//  PlayScreenViewController.m
//  Calculator
//
//  Created by Nam Truong on 2/19/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "PlayScreenViewController.h"
#import "CoreGUIController.h"


@implementation PlayScreenViewController

-(id)init {
    self = [super init];
    backGroundName = @"bg_calculator.jpg";
    return self;
}

-(void)loadView {
    [super loadView];
    totalNumberQuestion = 2;
    labelScreen = [UIFacetory createButtonWithImage:@"entry.png"];
    labelScreen.userInteractionEnabled = NO;
    float padding = 5;
    [self.view addSubview:labelScreen];
    float topPadding = [[UIApplication sharedApplication] statusBarFrame].size.height;
    if (mainGUIController.devideModel == DeviceModeliPhone4) {
        topPadding += 50;
    } else if (mainGUIController.devideModel == DeviceModeliPhone35) {

    } else if (mainGUIController.devideModel == DeviceModeliPad) {
        topPadding += 100;
    }
    labelQuestion = [[UILabel alloc] initWithFrame:CGRectMake(0,topPadding +padding, self.view.frame.size.width, labelScreen.frame.size.height)];
    labelQuestion.backgroundColor = [UIColor clearColor];
    labelQuestion.font = [UIFont boldSystemFontOfSize:labelQuestion.frame.size.height*0.75f];
    labelQuestion.text = @"12 + 13";
    labelQuestion.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelQuestion];
    labelScreen.center = CGPointMake(labelQuestion.center.x, labelQuestion.center.y+labelQuestion.frame.size.height+padding);
    CGPoint startPoint = CGPointMake(labelScreen.frame.origin.x, labelScreen.frame.origin.y+labelScreen.frame.size.height+4*padding);
    float padddingX=0;
    float paddingY=0;
    NSMutableArray *arrayFileName = [[NSMutableArray alloc]init];
    [arrayFileName addObject:@"7.png"];
    [arrayFileName addObject:@"8.png"];
    [arrayFileName addObject:@"9.png"];
    [arrayFileName addObject:@"4.png"];
    [arrayFileName addObject:@"5.png"];
    [arrayFileName addObject:@"6.png"];
    [arrayFileName addObject:@"1.png"];
    [arrayFileName addObject:@"2.png"];
    [arrayFileName addObject:@"3.png"];
    [arrayFileName addObject:@"11.png"];
    [arrayFileName addObject:@"0.png"];
    [arrayFileName addObject:@"10.png"];
    for (int i=0; i<arrayFileName.count; i++) {
        NSString *fileName = [arrayFileName objectAtIndex:i];
        UIButton *number = nil;
        number = [UIFacetory createButtonWithImage:fileName];
        number.frame = CGRectMake(startPoint.x, startPoint.y, number.frame.size.width, number.frame.size.height);
        number.tag = [[[fileName componentsSeparatedByString:@"."] objectAtIndex:0] integerValue];
        [self.view addSubview:number];
        if (i==0) {
            padddingX = (labelScreen.frame.size.width-3*number.frame.size.width)/2;
            paddingY =2*padding+number.frame.size.height;
        }
        startPoint.x+=padddingX+number.frame.size.width;
        if ((i+1)%3==0) {
            startPoint.x = labelScreen.frame.origin.x;
            startPoint.y+= paddingY;
        }
        [number addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton *buttonClear = [UIFacetory createButtonWithImage:@"clear.png"];
    buttonClear.tag = 12;
    buttonClear.frame = CGRectMake(labelScreen.frame.origin.x, startPoint.y+2*padding, buttonClear.frame.size.width, buttonClear.frame.size.height);
    [self.view addSubview:buttonClear];
    [buttonClear addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    currentNumberQuestion = -1;
    arrayQuestions = [[NSMutableArray alloc]init];
    labelScreenText = [[UILabel alloc] initWithFrame:labelScreen.frame];
    [self.view addSubview:labelScreenText];
    labelScreenText.backgroundColor = [UIColor clearColor];
    labelScreenText.font = [UIFont boldSystemFontOfSize:labelScreenText.frame.size.height*0.75];
    labelScreenText.text = @"";
    labelScreenText.textAlignment = NSTextAlignmentRight;
    float textPadding = 10;
    labelScreenText.frame = CGRectMake(labelScreenText.frame.origin.x+textPadding, labelScreenText.frame.origin.y, labelScreenText.frame.size.width-2*textPadding, labelScreenText.frame.size.height);
    [self doStartQuest];
}

-(void)doStartQuest {
    currentNumberQuestion = -1;
    [arrayQuestions removeAllObjects];
    [self nextQuestion];
    
}

-(void)nextQuestion {
    currentNumberQuestion++;
    currentDic = [self doGenerateQuestion];
    labelQuestion.text = [currentDic valueForKey:@"QUEST"];
    currentResult = [currentDic valueForKey:@"RESULT"];
    currentResultValue = [currentResult intValue];
    labelScreenText.text = @"";
}

-(NSDictionary*)doGenerateQuestion {
    NSMutableDictionary *reuturnDic = [[NSMutableDictionary alloc]init];
    BOOL isOK = false;
    int count = 0;
    while (!isOK) {
        count++;
        int numA = arc4random()%100;
        numA -= 25;
        int numB = arc4random()%75;
        int operaton = arc4random()%2;
        int retultNum;
        if (operaton>0)
            operaton = 1;
        NSString *genQuestion;
        if (operaton==0) {
            genQuestion = [[NSString alloc]initWithFormat:@"%d + %d", numA, numB];
            retultNum = numA + numB;
        }
        else {
            genQuestion = [[NSString alloc]initWithFormat:@"%d - %d", numA, numB];
            retultNum = numA - numB;
        }
        BOOL isFound = NO;
        for (NSString *questionAlready in arrayQuestions) {
            if ([questionAlready isEqualToString:genQuestion]) {
                isFound = YES;
                break;
            }
        }
        if (!isFound) {
            isOK=YES;
            [arrayQuestions addObject:genQuestion];
            [reuturnDic setValue:genQuestion forKey:@"QUEST"];
            [reuturnDic setValue:[[NSString alloc] initWithFormat:@"%d", retultNum] forKey:@"RESULT"];
        }
    }
    return reuturnDic;
}

-(void)btnPressed:(UIButton*)sender {
    NSString *textInputed=@"";
    if (sender.tag<10) {
        textInputed = [[NSString alloc]initWithFormat:@"%d", sender.tag];
        labelScreenText.text = [labelScreenText.text stringByAppendingString:textInputed];
    } else if (sender.tag==10) {
        // back button
        if (labelScreenText.text.length>0) {
            labelScreenText.text = [labelScreenText.text substringToIndex:labelScreenText.text.length-1];
        }
    } else if (sender.tag==11) {
        // cong tru button
        if ([labelScreenText.text rangeOfString:@"-"].location==NSNotFound)
            labelScreenText.text = [NSString stringWithFormat:@"-%@", labelScreenText.text];
        else
            labelScreenText.text = [labelScreenText.text substringFromIndex:1];
    } else if (sender.tag==12) {
        // clear button
        labelScreenText.text = @"";
    }
    NSString *compareChar = [currentResult substringWithRange:NSMakeRange(labelScreenText.text.length-1, 1)];
    
    [self processFialed];
}


-(void)processFialed {
    self.view.userInteractionEnabled = NO;
    labelScreenText.textColor = [UIColor redColor];
    [self performSelector:@selector(processFailed02) withObject:nil afterDelay:0.5];
}

-(void)processFailed02 {
    self.view.userInteractionEnabled = YES;
    labelScreenText.text = @"";
    labelScreenText.textColor = [UIColor blackColor];
}

@end
