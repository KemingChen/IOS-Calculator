//
//  ViewController.m
//  calculator
//
//  Created by Keming on 2015/4/14.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickNumber:(id)sender
{
    UIButton* button = (UIButton*)sender;
    NSLog(@"%@", button.accessibilityHint);
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

- (IBAction)clickMultipy:(id)sender
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

@end
