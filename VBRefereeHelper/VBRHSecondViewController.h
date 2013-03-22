//
//  VBRHSecondViewController.h
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBRHSecondViewController : UIViewController
{
    int rightScore;
    int leftScore;
    int rightSets ;
    int leftSets ;
}

@property (weak, nonatomic) IBOutlet UILabel *rightScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *minusLeftScore;
@property (weak, nonatomic) IBOutlet UIButton *plusLeftScore;
@property (weak, nonatomic) IBOutlet UIButton *minusRightScore;
@property (weak, nonatomic) IBOutlet UIButton *plusRightScore;
@property (weak, nonatomic) IBOutlet UIButton *leftSetsButton;
@property (weak, nonatomic) IBOutlet UIButton *rightSetsButton;


- (IBAction)minusRightScore:(id)sender;
- (IBAction)plusRightScore:(id)sender;

- (IBAction)minusLeftScore:(id)sender;
- (IBAction)plusLeftScore:(id)sender;

- (IBAction)leftSetsButton:(id)sender;
- (IBAction)rightSetsButton:(id)sender;

- (IBAction)resetButton:(id)sender;
- (IBAction)resetMatchButton:(id)sender;

- (IBAction)invertColors:(id)sender;

@end
