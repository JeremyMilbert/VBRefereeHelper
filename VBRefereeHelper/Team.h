//
//  Team.h
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property NSArray *players;
@property int numberOfTimeouts;
@property int numberOfChangeovers;
@property BOOL isOnTheLeft;

-(id)initWithPlayers:(NSArray*)players numberOfTimeouts:(int)numberOfTimeouts numberOfChangeovers:(int)numberOfChangovers isOnTheLeft:(BOOL)isOnTheLeft;

@end
