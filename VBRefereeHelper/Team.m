//
//  Team.m
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import "Team.h"

@implementation Team

-(id)initWithPlayers:(NSArray *)players numberOfTimeouts:(int)numberOfTimeouts numberOfChangeovers:(int)numberOfChangovers isOnTheLeft:(BOOL)isOnTheLeft
{
    self = [super init];
    if (!self)
        return self;
    
    self.players = players;
    self.numberOfTimeouts = numberOfTimeouts;
    self.numberOfChangeovers = numberOfChangovers;
    self.isOnTheLeft = isOnTheLeft;
    
    return self;
}

@end
