//
//  CustomView.m
//  Animation
//
//  Created by Patrick Madden on 1/26/17.
//  Copyright © 2017 Binghamton CSD. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
@synthesize contents, subimage, label;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder // coming from an interface builder
{
    self = [super initWithCoder:aDecoder]; // initialization
    
    if (self)
    {
        UINib *nib = [UINib nibWithNibName:@"custom" bundle:nil]; // wiring up the internal stuff
        [nib instantiateWithOwner:self options:nil];

        
        // Now get things to auto stretch nicely!
        [contents setTranslatesAutoresizingMaskIntoConstraints:NO]; //Always keep NO for proper re-sizing and layout
        [self addSubview:contents]; //
        
        NSLayoutConstraint *c;
        // Top
        c = [NSLayoutConstraint constraintWithItem:contents attribute:NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];0
        [self addConstraint:c]; // create new layout constraint | for top | constant = xero [ join it together] | multiplier for scaling
        
        // Left
        c = [NSLayoutConstraint constraintWithItem:contents attribute:NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        [self addConstraint:c];

        // Right
        c = [NSLayoutConstraint constraintWithItem:contents attribute:NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        [self addConstraint:c];
        
        // Bottom
        c = [NSLayoutConstraint constraintWithItem:contents attribute:NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [self addConstraint:c];
        
        counter = 0;
    }
    return self;
}

-(IBAction)changeImage:(id)sender
{
    switch (counter % 3)
    {
        case 0:
            [subimage setImage:[UIImage imageNamed:@"image1"]];
            break;
        case 1:
            [subimage setImage:[UIImage imageNamed:@"image2"]];
            break;
        case 2:
            [subimage setImage:[UIImage imageNamed:@"image3"]];
            break;
    }
    [label setText:[NSString stringWithFormat:@"Image %d", (counter % 3) + 1]];
    ++counter;
}

@end