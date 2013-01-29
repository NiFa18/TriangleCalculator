//
//  TriangleCalcViewController.m
//  TriangleCalc
//
//  Created by Niedermann Fabian on 09.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TriangleCalcViewController.h"
#include "math.h"

@interface TriangleCalcViewController ()

@end

@implementation TriangleCalcViewController

@synthesize fieldA = _fieldA;
@synthesize fieldB = _fieldB;
@synthesize fieldC = _fieldC;
@synthesize fieldAlpha = _fieldAlpha;
@synthesize fieldBeta = _fieldBeta;
@synthesize statusLabel = _statusLabel;

- (void)viewDidLoad
{
    self.statusLabel.text = [NSString stringWithFormat:@"Type in two values"];
}

- (IBAction)solveClear:(UIButton *)sender
{
    sender.selected = !sender.isSelected;

    if (!sender.isSelected)
    {
        self.fieldA.text = [NSString stringWithFormat:@""];
        self.fieldB.text = [NSString stringWithFormat:@""];
        self.fieldC.text = [NSString stringWithFormat:@""];
        self.fieldAlpha.text = [NSString stringWithFormat:@""];
        self.fieldBeta.text = [NSString stringWithFormat:@""];
        self.statusLabel.text = [NSString stringWithFormat:@"Type in two values"];

    } else{
        double a = [self.fieldA.text doubleValue];
        double b = [self.fieldB.text doubleValue];
        double c = [self.fieldC.text doubleValue];
        double alpha = [self.fieldAlpha.text doubleValue];
        double beta = [self.fieldBeta.text doubleValue];
        
        if (alpha != 0.0)
        {
            beta = 90.0 - alpha;
            
            if (c != 0.0)
            {
                a = c*sin(2*M_PI/360*alpha);
                b = c*cos(2*M_PI/360*alpha);
            } else if (b != 0.0)
            {
                c = b/(cos(2*M_PI/360*alpha));
                a = c*sin(2*M_PI/360*alpha);
            } else if (a != 0.0)
            {
                c = a/(sin(2*M_PI/360*alpha));
                b = c*cos(2*M_PI/360*alpha);
            }
        } else
        {
            if (c == 0.0)
            {
                c = sqrt(a*a+b*b);
                alpha = 360/(2*M_PI)*acos(b/c);
                beta = 90 - alpha;
            } else if (b == 0.0)
            {
                b = sqrt(c*c-a*a);
                alpha = 360/(2*M_PI)*acos(b/c);
                beta = 90 - alpha;
            } else if (a == 0.0)
            {
                a = sqrt(c*c-b*b);
                alpha = 360/(2*M_PI)*acos(b/c);
                beta = 90 - alpha;
            }
        }
        
        self.fieldA.text = [NSString stringWithFormat:@"a = %g", a];
        self.fieldB.text = [NSString stringWithFormat:@"b = %g", b];
        self.fieldC.text = [NSString stringWithFormat:@"c = %g", c];
        self.fieldAlpha.text = [NSString stringWithFormat:@"al = %g", alpha];
        self.fieldBeta.text = [NSString stringWithFormat:@"be = %g", beta];
        self.statusLabel.text = [NSString stringWithFormat:@"Result: "];        
        
    }
    
}
@end
