//
//  ViewController.m
//  calculator
//
//  Created by Keming on 2015/4/14.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel* equationLabel;
@property (weak, nonatomic) IBOutlet UILabel* resultLabel;

@property (strong, nonatomic) CalculatorModel* calculator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calculator = [[CalculatorModel alloc] init];
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickNumber:(id)sender
{
    UIButton* button = (UIButton*)sender;
    [self.calculator appendNumber:button.accessibilityHint];
    
    [self updateView];
}

- (IBAction)clickDot:(id)sender
{
}

- (IBAction)clickPlus:(id)sender
{
}

- (IBAction)clickMinus:(id)sender
{
}

- (IBAction)clickMultiplied:(id)sender
{
}

- (IBAction)clickDivided:(id)sender
{
}

- (IBAction)clickEqual:(id)sender
{
}

- (IBAction)clickClean:(id)sender
{
}

- (IBAction)clickPlusOrMinus:(id)sender
{
}

- (IBAction)clickPercent:(id)sender
{
}

- (void)updateView
{
    self.equationLabel.text = [self.calculator getEquation];
    self.resultLabel.text = [self.calculator getResult];
}

@end
