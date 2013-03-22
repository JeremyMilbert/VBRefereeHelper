//
//  PlayerDot.h
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerDot : NSObject

@property int x;
@property int y;
@property int radius;
@property int currentRadius;
@property int number;
@property int animationTouched;

- (id) initWithX:(int)x Y:(int)y Radius:(int)radius Number:(int)number;
- (void) animateTouched;
- (void) startAnimationTouched;

@end
