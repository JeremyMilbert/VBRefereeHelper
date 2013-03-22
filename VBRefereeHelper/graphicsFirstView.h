//
//  graphicsFirstView.h
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDot.h"
#import "Team.h"

@interface graphicsFirstView : UIView

{
    PlayerDot *playerBlue1;
    PlayerDot *playerBlue2;
    PlayerDot *playerBlue3;
    PlayerDot *playerBlue4;
    PlayerDot *playerBlue5;
    PlayerDot *playerBlue6;
    
    PlayerDot *playerRed1;
    PlayerDot *playerRed2;
    PlayerDot *playerRed3;
    PlayerDot *playerRed4;
    PlayerDot *playerRed5;
    PlayerDot *playerRed6;
}

@property (nonatomic, strong) Team *teamBlue;
@property (nonatomic, strong) Team *teamRed;

@end
