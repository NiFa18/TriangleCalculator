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
@property (nonatomic) BOOL angle;       // 0=deg / 1=rad
@end

@implementation TriangleCalcViewController

- (void)viewDidLoad
{
    self.statusLabel.text = [NSString stringWithFormat:@"Type in two values"];
}

- (IBAction)angleMode:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    if (sender.isSelected)
    {
        self.angle = YES;
    } else
    {
        self.angle = NO;
    }
}

- (IBAction)solveClear:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    self.fieldA.enabled = !self.fieldA.isEnabled;
    self.fieldB.enabled = !self.fieldB.isEnabled;
    self.fieldC.enabled = !self.fieldC.isEnabled;
    self.fieldAlpha.enabled = !self.fieldAlpha.isEnabled;
    
    double ang;
    
    if (self.angle) {
        ang = 1.0;
    } else
    {
        ang = 2*M_PI/360;
    }

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
        double beta=0;
        if (alpha != 0.0)
        {
            beta = M_PI/(2*ang) - alpha;
            
            if (c != 0.0)
            {
                a = c*sin(ang*alpha);
                b = c*cos(ang*alpha);
            } else if (b != 0.0)
            {
                c = b/(cos(ang*alpha));
                a = c*sin(ang*alpha);
            } else if (a != 0.0)
            {
                c = a/(sin(ang*alpha));
                b = c*cos(ang*alpha);
            }
        } else
        {
            if (c == 0.0)
            {
                c = sqrt(a*a+b*b);
                alpha = acos(b/c)/ang;
                beta = M_PI/(2*ang) - alpha;
            } else if (b == 0.0)
            {
                b = sqrt(c*c-a*a);
                alpha = acos(b/c)/ang;
                beta = M_PI/(2*ang) - alpha;
            } else if (a == 0.0)
            {
                a = sqrt(c*c-b*b);
                alpha = acos(b/c)/ang;
                beta = M_PI/(2*ang) - alpha;
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
