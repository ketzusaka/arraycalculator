//
//  ViewController.h
//  ArrayCalculator
//
//  Created by James Richard on 9/20/12.
//  Copyright (c) 2012 LucidCoding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *value1;
@property (strong, nonatomic) IBOutlet UITextField *value2;
@property (strong, nonatomic) IBOutlet UIButton *calculateUsingNSArraysBtn;
@property (strong, nonatomic) IBOutlet UILabel *arraySumResultLabel;
@property (strong, nonatomic) IBOutlet UITextView *arraySumResultDetailedView;
@property (strong, nonatomic) IBOutlet UILabel *sumValue1Label;
@property (strong, nonatomic) IBOutlet UILabel *sumValue2Label;

@end
