//
//  graphicsFirstView.m
//  VBRefereeHelper
//
//  Created by Pierre MILBERT on 22/03/13.
//  Copyright (c) 2013 Jérémy MILBERT. All rights reserved.
//

#import "graphicsFirstView.h"

@implementation graphicsFirstView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(void) awakeFromNib
{
    playerBlue1 = [[PlayerDot alloc] initWithX:225 Y:450 Radius:25 Number:0];
    playerBlue2 = [[PlayerDot alloc] initWithX:275 Y:335 Radius:25 Number:0];
    playerBlue3 = [[PlayerDot alloc] initWithX:455 Y:335 Radius:25 Number:0];
    playerBlue4 = [[PlayerDot alloc] initWithX:455 Y:450 Radius:25 Number:0];
    playerBlue5 = [[PlayerDot alloc] initWithX:455 Y:565 Radius:25 Number:0];
    playerBlue6 = [[PlayerDot alloc] initWithX:275 Y:565 Radius:25 Number:0];
    
    self.teamBlue = [[Team alloc] initWithPlayers:[NSArray arrayWithObjects:playerBlue1, playerBlue2, playerBlue3, playerBlue4, playerBlue5, playerBlue6, nil] numberOfTimeouts:0 numberOfChangeovers:0 isOnTheLeft:YES];
    
    playerRed1 = [[PlayerDot alloc] initWithX:790 Y:450 Radius:25 Number:0];
    playerRed2 = [[PlayerDot alloc] initWithX:750 Y:565 Radius:25 Number:0];
    playerRed3 = [[PlayerDot alloc] initWithX:570 Y:565 Radius:25 Number:0];
    playerRed4 = [[PlayerDot alloc] initWithX:570 Y:450 Radius:25 Number:0];
    playerRed5 = [[PlayerDot alloc] initWithX:570 Y:335 Radius:25 Number:0];
    playerRed6 = [[PlayerDot alloc] initWithX:750 Y:335 Radius:25 Number:0];
    
    self.teamRed = [[Team alloc] initWithPlayers:[NSArray arrayWithObjects:playerRed1, playerRed2, playerRed3, playerRed4, playerRed5, playerRed6, nil] numberOfTimeouts:0 numberOfChangeovers:0 isOnTheLeft:NO];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rectangle = CGRectMake(150, 270, 720, 360);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetShadow(context, CGSizeMake(5, 5), 1.0f);
    CGContextFillRect(context, rectangle);
    
    CGContextSetShadow(context, CGSizeMake(0, 0), 1.0f);
    CGContextSetFillColorWithColor(context, [[UIColor orangeColor] CGColor]);
    rectangle = CGRectMake(150 + 5, 270 + 5, 240 - 5, 360 - 2*5);
    CGContextFillRect(context, rectangle);
    
    rectangle = CGRectMake(390 + 5, 270 + 5, 120 - 2*5, 360 - 2*5);
    CGContextFillRect(context, rectangle);
    
    rectangle = CGRectMake(510 + 5, 270 + 5, 120 - 2*5, 360 - 2*5);
    CGContextFillRect(context, rectangle);
    
    rectangle = CGRectMake(630, 270 + 5, 240 - 5, 360 - 2*5);
    CGContextFillRect(context, rectangle);
    
    for (PlayerDot* pl in self.teamBlue.players) {
        CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
        rectangle = CGRectMake(pl.x - pl.currentRadius-3, pl.y - pl.currentRadius-3, 2*pl.currentRadius+6, 2*pl.currentRadius+6);
        CGContextSetShadow(context, CGSizeMake(5, 5), 1.0f);
        CGContextFillEllipseInRect(context, rectangle);
        CGContextSetShadow(context, CGSizeMake(0, 0), 1.0f);
        
        rectangle = CGRectMake(pl.x - pl.currentRadius, pl.y - pl.currentRadius, 2*pl.currentRadius, 2*pl.currentRadius);
        CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
        CGContextFillEllipseInRect(context, rectangle);
        rectangle = CGRectMake(pl.x - pl.currentRadius, pl.y - pl.currentRadius, 2*pl.currentRadius, 2*pl.currentRadius);
        CGContextFillEllipseInRect(context, rectangle);
        NSString *number = [NSString stringWithFormat:@"%d", pl.number];
        if (![number isEqualToString:@"0"]) {
            rectangle = CGRectMake(pl.x - pl.currentRadius, pl.y - pl.radius/1.5, 2*pl.currentRadius, 2*pl.currentRadius);
            CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
            UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:pl.radius];
            [number drawInRect:rectangle withFont:font lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
        }
        
    }
    for (PlayerDot* pl in self.teamRed.players) {
        CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
        rectangle = CGRectMake(pl.x - pl.currentRadius-3, pl.y - pl.currentRadius-3, 2*pl.currentRadius+6, 2*pl.currentRadius+6);
        CGContextSetShadow(context, CGSizeMake(5, 5), 1.0f);
        CGContextFillEllipseInRect(context, rectangle);
        CGContextSetShadow(context, CGSizeMake(0, 0), 1.0f);
        
        CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
        rectangle = CGRectMake(pl.x - pl.currentRadius, pl.y - pl.currentRadius, 2*pl.currentRadius, 2*pl.currentRadius);
        CGContextFillEllipseInRect(context, rectangle);
        NSString *number = [NSString stringWithFormat:@"%d", pl.number];
        if (![number isEqualToString:@"0"]) {
            rectangle = CGRectMake(pl.x - pl.currentRadius, pl.y - pl.radius/1.5, 2*pl.currentRadius, 2*pl.currentRadius);
            CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
            UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:pl.radius];
            [number drawInRect:rectangle withFont:font lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
        }
    }
    
}

@end
