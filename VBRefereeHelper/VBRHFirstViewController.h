//
//  VBRHFirstViewController.h
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
#import "PlayerDot.h"

@interface VBRHFirstViewController : UIViewController
{
    float lastAngle;
}
@property (weak, nonatomic) IBOutlet UIButton *leftNumberOfTimeouts;
@property (weak, nonatomic) IBOutlet UIButton *rightNumberOfTimeouts;
@property (weak, nonatomic) IBOutlet UIButton *leftNumberOfChangeovers;
@property (weak, nonatomic) IBOutlet UIButton *rightNumberOfChangeovers;
@property (weak, nonatomic) IBOutlet UIButton *leftSetsButton;
@property (weak, nonatomic) IBOutlet UIButton *leftMinusScore;
@property (weak, nonatomic) IBOutlet UIButton *leftScoreButton;
@property (weak, nonatomic) IBOutlet UIButton *rightSetsButton;
@property (weak, nonatomic) IBOutlet UIButton *rightMinusScore;
@property (weak, nonatomic) IBOutlet UIButton *rightScoreButton;

- (IBAction)leftNumberOfTimeouts:(id)sender;
- (IBAction)rightNumberOfTimeouts:(id)sender;
- (IBAction)leftNumberOfChangeovers:(id)sender;
- (IBAction)rightNumberOfChangeovers:(id)sender;

- (IBAction)leftSetsButton:(id)sender;
- (IBAction)leftMinusScore:(id)sender;
- (IBAction)leftScoreButton:(id)sender;
- (IBAction)rightSetsButton:(id)sender;
- (IBAction)rightMinusScore:(id)sender;
- (IBAction)rightScoreButton:(id)sender;

- (IBAction)resetScores:(id)sender;
- (IBAction)resetTimeouts:(id)sender;
- (IBAction)resetChangeovers:(id)sender;

- (IBAction)invertColorsButton:(id)sender;

@end
