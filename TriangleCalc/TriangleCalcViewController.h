//
//  TriangleCalcViewController.h
//  TriangleCalc
//
//  Created by Niedermann Fabian on 09.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TriangleCalcViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fieldA;
@property (weak, nonatomic) IBOutlet UITextField *fieldB;
@property (weak, nonatomic) IBOutlet UITextField *fieldC;
@property (weak, nonatomic) IBOutlet UITextField *fieldAlpha;
@property (weak, nonatomic) IBOutlet UITextField *fieldBeta;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


- (IBAction)solve;
- (IBAction)clear;

@end
