//
//  ViewController.m
//  ArrayCalculator
//
//  Created by James Richard on 9/20/12.
//  Copyright (c) 2012 LucidCoding. All rights reserved.
//

#import "ViewController.h"
#import "ArrayCalculator.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize value1 = _value1;
@synthesize value2 = _value2;
@synthesize calculateUsingNSArraysBtn = _calculateUsingNSArraysBtn;
@synthesize arraySumResultLabel = _arraySumResultLabel;
@synthesize arraySumResultDetailedView = _arraySumResultDetailedView;
@synthesize sumValue1Label = _sumValue1Label;
@synthesize sumValue2Label = _sumValue2Label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setValue1:nil];
    [self setValue2:nil];
    [self setCalculateUsingNSArraysBtn:nil];
    [self setArraySumResultLabel:nil];
    [self setArraySumResultDetailedView:nil];
    [self setSumValue1Label:nil];
    [self setSumValue2Label:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (IBAction)sumArrays:(id)sender {
    NSString *stringToArray1 = self.value1.text;
    NSString *stringToArray2 = self.value2.text;
    
    NSError *error;
    NSArray *array1 = [ArrayCalculator arrayFromString:stringToArray1 error:&error];
    if (error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"The input in value 1 must be an integer" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
        return;
    }
    
    NSArray *array2 = [ArrayCalculator arrayFromString:stringToArray2 error:&error];
    if (error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"The input in value 2 must be an integer" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
        return;
    }
    
    self.sumValue1Label.text = stringToArray1;
    self.sumValue2Label.text = stringToArray2;
    NSArray *sumResult = [ArrayCalculator sumArray:array1 andArray:array2];
    self.arraySumResultLabel.text = [sumResult componentsJoinedByString:@""];
    self.arraySumResultDetailedView.text = sumResult.description;
}

@end
