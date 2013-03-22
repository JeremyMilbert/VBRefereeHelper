//
//  PlayerDot.m
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import "PlayerDot.h"

@implementation PlayerDot

-(id) initWithX:(int)x Y:(int)y Radius:(int)radius Number:(int)number
{
    self = [super init];
    if (!self)
        return self;
    
    self.x = x;
    self.y = y;
    self.radius = radius;
    self.number= number;
    self.currentRadius = radius;
    
    return self;
}

- (void) animateTouched {
    if (self.animationTouched > 10) {
        self.animationTouched--;
        self.currentRadius = 45 - self.animationTouched;
    }
    else if (self.animationTouched > 0 & self.animationTouched <11) {
        self.animationTouched--;
        self.currentRadius = self.radius + self.animationTouched;
    }
    else
        self.currentRadius = self.radius;
}

- (void) startAnimationTouched {
    self.animationTouched = 20;
}

@end
