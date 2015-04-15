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
    [self updateView];
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
    [self.calculator appendDot];
    [self updateView];
}

- (IBAction)clickPlus:(id)sender
{
    [self.calculator pressPlus];
    [self updateView];
}

- (IBAction)clickMinus:(id)sender
{
    [self.calculator pressMinus];
    [self updateView];
}

- (IBAction)clickMultiplied:(id)sender
{
    [self.calculator pressMultiplied];
    [self updateView];
}

- (IBAction)clickDivided:(id)sender
{
    [self.calculator pressDivided];
    [self updateView];
}

- (IBAction)clickEqual:(id)sender
{
    [self.calculator pressEqual];
    [self updateView];
}

- (IBAction)clickClean:(id)sender
{
    [self.calculator clean];
    [self updateView];
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
