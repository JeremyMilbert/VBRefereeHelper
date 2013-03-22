//
//  VBRHFirstViewController.m
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import "VBRHFirstViewController.h"
#import "graphicsFirstView.h"

@interface VBRHFirstViewController ()

@end

@implementation VBRHFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(animationPlayerDotTouched) userInfo:nil repeats:YES];
    UIRotationGestureRecognizer *twoFingersRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersRotate:)];
    [[self view] addGestureRecognizer:twoFingersRotate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    int fingersCount = [allTouches count];
    UITouch *touch = [[allTouches allObjects]objectAtIndex:0];
    CGPoint point = [touch locationInView:self.view];
    if (fingersCount == 1) {
        for (PlayerDot * pl in ((graphicsFirstView*)self.view).teamBlue.players)
        {
            if (pow((point.x-pl.x),2)+pow((point.y-pl.y), 2) < pow(pl.radius,2)) {
                [pl startAnimationTouched];
                pl.number = (pl.number + 1)%19;
                [self.view setNeedsDisplay];
            }
        }
        for (PlayerDot * pl in ((graphicsFirstView*)self.view).teamRed.players)
        {
            if (pow((point.x-pl.x),2)+pow((point.y-pl.y), 2) < pow(pl.radius,2)) {
                [pl startAnimationTouched];
                pl.number = (pl.number + 1)%19;
                [self.view setNeedsDisplay];
            }
        }
    }
}

//Méthode pour l'animation

-(void) animationPlayerDotTouched
{
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    for (PlayerDot *player in firstView.teamBlue.players) {
        if (player.animationTouched > 0)
        {
            [player animateTouched];
        }
    }
    for (PlayerDot *player in firstView.teamRed.players) {
        if (player.animationTouched > 0)
        {
            [player animateTouched];
        }
    }
    [firstView setNeedsDisplay];
}

//Méthode pour la rotation
- (void)twoFingersRotate:(UIRotationGestureRecognizer *)recognizer
{
    // Convert the radian value to show the degree of rotation
    
    CGPoint location = [recognizer locationInView:nil];
    float angle = [recognizer rotation]*(180 / M_PI);
    if (lastAngle > angle)
        lastAngle = angle;
    if ( angle - lastAngle > 45) {
        lastAngle = angle;
        // Warning here : the coordinates system changes completely, the origin is in the top-right hand corner.
        //if (location.y > 514 + 50) {
        if (pow(location.x - 450, 2) + pow(location.y - (1024-330), 2) < pow(180, 2)) {
            if (((graphicsFirstView*)self.view).teamBlue.isOnTheLeft) {
                int numeroJoueur6 = ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[5]).number;
                int compteur;
                for (compteur = 5; compteur > 0; compteur--)
                {
                    ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[compteur]).number = ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[compteur - 1]).number;
                }
                ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[0]).number = numeroJoueur6;
                [self.view setNeedsDisplay];
            }
            else if (((graphicsFirstView*)self.view).teamRed.isOnTheLeft) {
                int numeroJoueur6 = ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[5]).number;
                int compteur;
                for (compteur = 5; compteur > 0; compteur--)
                {
                    ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[compteur]).number = ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[compteur - 1]).number;
                }
                ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[0]).number = numeroJoueur6;
                [self.view setNeedsDisplay];
            }
        };
        if (pow(location.x - 450, 2) + pow(location.y - (1024-690), 2) < pow(180, 2)) {
            if (((graphicsFirstView*)self.view).teamBlue.isOnTheLeft) {
                int numeroJoueur6 = ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[5]).number;
                int compteur;
                for (compteur = 5; compteur > 0; compteur--)
                {
                    ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[compteur]).number = ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[compteur - 1]).number;
                }
                ((PlayerDot*)((graphicsFirstView*)self.view).teamRed.players[0]).number = numeroJoueur6;
                [self.view setNeedsDisplay];
            }
            else if (((graphicsFirstView*)self.view).teamRed.isOnTheLeft) {
                int numeroJoueur6 = ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[5]).number;
                int compteur;
                for (compteur = 5; compteur > 0; compteur--)
                {
                    ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[compteur]).number = ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[compteur - 1]).number;
                }
                ((PlayerDot*)((graphicsFirstView*)self.view).teamBlue.players[0]).number = numeroJoueur6;
                [self.view setNeedsDisplay];
            }
        };
    };
}

- (IBAction)leftScoreButton:(id)sender {
    [self.leftScoreButton setTitle:[NSString stringWithFormat:@"%d", [self.leftScoreButton.titleLabel.text intValue]+1] forState:UIControlStateNormal];
}

- (IBAction)leftSetsButton:(id)sender {
    [self.leftSetsButton setTitle:[NSString stringWithFormat:@"%d", ([self.leftSetsButton.titleLabel.text intValue]+1)%4] forState:UIControlStateNormal];
}

- (IBAction)leftMinusScore:(id)sender {
    NSString *temp = self.leftScoreButton.titleLabel.text;
    if ([temp intValue] > 0) {
        [self.leftScoreButton setTitle:[NSString stringWithFormat:@"%d", [temp intValue]-1] forState:UIControlStateNormal];
    }
}

- (IBAction)rightSetsButton:(id)sender {
    [self.rightSetsButton setTitle:[NSString stringWithFormat:@"%d", ([self.rightSetsButton.titleLabel.text intValue]+1)%4] forState:UIControlStateNormal];
}

- (IBAction)rightMinusScore:(id)sender {
    NSString *temp = self.rightScoreButton.titleLabel.text;
    if ([temp intValue] > 0) {
        [self.rightScoreButton setTitle:[NSString stringWithFormat:@"%d", [temp intValue]-1] forState:UIControlStateNormal];
    }
}

- (IBAction)rightScoreButton:(id)sender {
    [self.rightScoreButton setTitle:[NSString stringWithFormat:@"%d", [self.rightScoreButton.titleLabel.text intValue]+1] forState:UIControlStateNormal];
}

- (IBAction)resetScores:(id)sender {
    [self.leftScoreButton setTitle:@"0" forState:UIControlStateNormal];
    [self.rightScoreButton setTitle:@"0" forState:UIControlStateNormal];
}

- (IBAction)resetTimeouts:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    firstView.teamBlue.numberOfTimeouts = 0;
    firstView.teamRed.numberOfTimeouts = 0;
    [self.leftNumberOfTimeouts setTitle:@"0" forState:UIControlStateNormal];
    [self.rightNumberOfTimeouts setTitle:@"0" forState:UIControlStateNormal];
}

- (IBAction)resetChangeovers:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    firstView.teamBlue.numberOfChangeovers = 0;
    firstView.teamRed.numberOfChangeovers = 0;
    [self.leftNumberOfChangeovers setTitle:@"0" forState:UIControlStateNormal];
    [self.rightNumberOfChangeovers setTitle:@"0" forState:UIControlStateNormal];
}

- (IBAction)leftNumberOfTimeouts:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    if (firstView.teamBlue.isOnTheLeft) {
        firstView.teamBlue.numberOfTimeouts = (firstView.teamBlue.numberOfTimeouts + 1)%3;
        [self.leftNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfTimeouts] forState:UIControlStateNormal];
    }
    else if (firstView.teamRed.isOnTheLeft){
        firstView.teamRed.numberOfTimeouts = (firstView.teamRed.numberOfTimeouts + 1)%3;
        [self.leftNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfTimeouts] forState:UIControlStateNormal];
    }
}

- (IBAction)rightNumberOfTimeouts:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    if (firstView.teamBlue.isOnTheLeft) {
        firstView.teamRed.numberOfTimeouts = (firstView.teamRed.numberOfTimeouts + 1)%3;
        [self.rightNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfTimeouts] forState:UIControlStateNormal];
    }
    else if (firstView.teamRed.isOnTheLeft){
        firstView.teamBlue.numberOfTimeouts = (firstView.teamBlue.numberOfTimeouts + 1)%3;
        [self.rightNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfTimeouts] forState:UIControlStateNormal];
    }
}

- (IBAction)leftNumberOfChangeovers:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    if (firstView.teamBlue.isOnTheLeft) {
        firstView.teamBlue.numberOfChangeovers = (firstView.teamBlue.numberOfChangeovers + 1)%7;
        [self.leftNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfChangeovers] forState:UIControlStateNormal];
    }
    else if (firstView.teamRed.isOnTheLeft){
        firstView.teamRed.numberOfChangeovers = (firstView.teamRed.numberOfChangeovers + 1)%7;
        [self.leftNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfChangeovers] forState:UIControlStateNormal];
    }
}

- (IBAction)rightNumberOfChangeovers:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    if (firstView.teamBlue.isOnTheLeft) {
        firstView.teamRed.numberOfChangeovers = (firstView.teamRed.numberOfChangeovers + 1)%7;
        [self.rightNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfChangeovers] forState:UIControlStateNormal];
    }
    else if (firstView.teamRed.isOnTheLeft){
        firstView.teamBlue.numberOfChangeovers = (firstView.teamBlue.numberOfChangeovers + 1)%7;
        [self.rightNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfChangeovers] forState:UIControlStateNormal];
    }
}

- (IBAction)invertColorsButton:(id)sender {
    graphicsFirstView* firstView = (graphicsFirstView*) self.view;
    NSArray *tempArray = [[NSArray alloc]init];
    tempArray = firstView.teamRed.players;
    firstView.teamRed.players = firstView.teamBlue.players;
    firstView.teamBlue.players = tempArray;
    int compteur;
    int tempNumber;
    for (compteur = 0; compteur < 6; compteur++)
    {
        tempNumber = ((PlayerDot*)firstView.teamRed.players[compteur]).number;
        ((PlayerDot*)firstView.teamRed.players[compteur]).number = ((PlayerDot*)firstView.teamBlue.players[compteur]).number;
        ((PlayerDot*)firstView.teamBlue.players[compteur]).number = tempNumber;
    }
    firstView.teamBlue.isOnTheLeft = !firstView.teamBlue.isOnTheLeft;
    firstView.teamRed.isOnTheLeft = !firstView.teamRed.isOnTheLeft;
    if (firstView.teamBlue.isOnTheLeft) {
        [self.leftNumberOfTimeouts setTitleColor:[UIColor blueColor] forState:0];
        [self.rightNumberOfTimeouts setTitleColor:[UIColor redColor] forState:0];
        [self.leftNumberOfChangeovers setTitleColor:[UIColor blueColor] forState:0];
        [self.rightNumberOfChangeovers setTitleColor:[UIColor redColor] forState:0];
        
        [self.leftSetsButton setTitleColor:[UIColor blueColor] forState:0];
        [self.leftScoreButton setTitleColor:[UIColor blueColor] forState:0];
        [self.leftMinusScore setTitleColor:[UIColor blueColor] forState:0];
        
        [self.rightSetsButton setTitleColor:[UIColor redColor] forState:0];
        [self.rightScoreButton setTitleColor:[UIColor redColor] forState:0];
        [self.rightMinusScore setTitleColor:[UIColor redColor] forState:0];
        
        [self.leftNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfTimeouts] forState:UIControlStateNormal];
        [self.rightNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfTimeouts] forState:UIControlStateNormal];
        [self.leftNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfChangeovers] forState:UIControlStateNormal];
        [self.rightNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfChangeovers] forState:UIControlStateNormal];
    }
    else if (firstView.teamRed.isOnTheLeft) {
        [self.leftNumberOfTimeouts setTitleColor:[UIColor redColor] forState:0];
        [self.rightNumberOfTimeouts setTitleColor:[UIColor blueColor] forState:0];
        [self.leftNumberOfChangeovers setTitleColor:[UIColor redColor] forState:0];
        [self.rightNumberOfChangeovers setTitleColor:[UIColor blueColor] forState:0];
        
        [self.leftSetsButton setTitleColor:[UIColor redColor] forState:0];
        [self.leftScoreButton setTitleColor:[UIColor redColor] forState:0];
        [self.leftMinusScore setTitleColor:[UIColor redColor] forState:0];
        
        [self.rightSetsButton setTitleColor:[UIColor blueColor] forState:0];
        [self.rightScoreButton setTitleColor:[UIColor blueColor] forState:0];
        [self.rightMinusScore setTitleColor:[UIColor blueColor] forState:0];
        
        [self.leftNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfTimeouts] forState:UIControlStateNormal];
        [self.rightNumberOfTimeouts setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfTimeouts] forState:UIControlStateNormal];
        [self.leftNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamRed.numberOfChangeovers] forState:UIControlStateNormal];
        [self.rightNumberOfChangeovers setTitle:[NSString stringWithFormat:@"%d", firstView.teamBlue.numberOfChangeovers] forState:UIControlStateNormal];
    }
    NSString *temp = self.rightScoreButton.titleLabel.text;
    [self.rightScoreButton setTitle:self.leftScoreButton.titleLabel.text forState:UIControlStateNormal];
    [self.leftScoreButton setTitle:temp forState:UIControlStateNormal];
    temp = self.rightSetsButton.titleLabel.text;
    [self.rightSetsButton setTitle:self.leftSetsButton.titleLabel.text forState:UIControlStateNormal];
    [self.leftSetsButton setTitle:temp forState:UIControlStateNormal];
    
    [self.view setNeedsDisplay];
}


@end
