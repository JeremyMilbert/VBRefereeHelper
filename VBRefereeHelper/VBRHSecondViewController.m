//
//  VBRHSecondViewController.m
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import "VBRHSecondViewController.h"

@interface VBRHSecondViewController ()

@end

@implementation VBRHSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        rightScore = 0;
        leftScore = 0;
        rightSets = 0;
        leftSets = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)minusRightScore:(id)sender {
    if (rightScore > 0) {
        rightScore--;
        //[self.redScoreLabel setText: (@"%@", redScore)];
        [self.rightScoreLabel setText: [NSString stringWithFormat:@"%d", rightScore]];
    }
}

- (IBAction)plusRightScore:(id)sender {
    rightScore++;
    [self.rightScoreLabel setText: [NSString stringWithFormat:@"%d", rightScore]];
}

- (IBAction)minusLeftScore:(id)sender {
    if (leftScore > 0) {
        leftScore--;
        [self.leftScoreLabel setText: [NSString stringWithFormat:@"%d", leftScore]];
    }
}

- (IBAction)plusLeftScore:(id)sender {
    leftScore++;
    [self.leftScoreLabel setText: [NSString stringWithFormat:@"%d", leftScore]];
}

- (IBAction)leftSetsButton:(id)sender {
    leftSets = (leftSets + 1)%4;
    [self.leftSetsButton setTitle:[NSString stringWithFormat:@"%d", leftSets] forState:UIControlStateNormal];
}

- (IBAction)rightSetsButton:(id)sender {
    rightSets = (rightSets + 1)%4;
    [self.rightSetsButton setTitle:[NSString stringWithFormat:@"%d", rightSets] forState:UIControlStateNormal];
}

- (IBAction)resetButton:(id)sender {
    rightScore = 0;
    leftScore = 0;
    [self.rightScoreLabel setText: @"0"];
    [self.leftScoreLabel setText: @"0"];
}

- (IBAction)resetMatchButton:(id)sender {
    rightScore = 0;
    leftScore = 0;
    rightSets = 0;
    leftSets = 0;
    [self.rightScoreLabel setText: @"0"];
    [self.leftScoreLabel setText: @"0"];
    [self.rightSetsButton setTitle:@"0" forState:UIControlStateNormal];
    [self.leftSetsButton setTitle:@"0" forState:UIControlStateNormal];
}

- (IBAction)invertColors:(id)sender {
    UIColor *leftColor = self.leftScoreLabel.backgroundColor;
    UIColor *rightColor = self.rightScoreLabel.backgroundColor;
    [self.leftScoreLabel setBackgroundColor:rightColor];
    [self.rightScoreLabel setBackgroundColor:leftColor];
    [self.minusLeftScore setTitleColor:rightColor forState:0];
    [self.plusLeftScore setTitleColor:rightColor forState:0];
    [self.minusRightScore setTitleColor:leftColor forState:0];
    [self.plusRightScore setTitleColor:leftColor forState:0];
    [self.leftSetsButton setTitleColor:rightColor forState:0];
    [self.rightSetsButton setTitleColor:leftColor forState:0];
    
    int temp = rightScore;
    rightScore = leftScore;
    leftScore = temp;
    temp = rightSets;
    rightSets = leftSets;
    leftSets = temp;
    [self.leftScoreLabel setText: [NSString stringWithFormat:@"%d", leftScore]];
    [self.rightScoreLabel setText: [NSString stringWithFormat:@"%d", rightScore]];
    [self.leftSetsButton setTitle:[NSString stringWithFormat:@"%d", leftSets] forState:UIControlStateNormal];
    [self.rightSetsButton setTitle:[NSString stringWithFormat:@"%d", rightSets] forState:UIControlStateNormal];
    
}

@end
