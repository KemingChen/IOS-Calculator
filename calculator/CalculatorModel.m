//
//  CalculatorModel.m
//  calculator
//
//  Created by Keming on 2015/4/14.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel ()

@property (strong, nonatomic) NSString* equation;
@property (strong, nonatomic) NSString* result;

@end

@implementation CalculatorModel

- (id)init
{
    self = [super init];
    self.result = @"";
    self.equation = @"";

    return self;
}

- (void)appendNumber:(NSString*)number
{
    NSLog(@"append number %@", number);

    self.result = [self.result stringByAppendingString:number];
}

- (void)appendDot
{
}

- (NSString*)getEquation
{
    return [NSString stringWithFormat:@"%@%@%@=", self.equation, @"", self.result];
}

- (NSString*)getResult
{
    NSLog(@"result %@!", [self result]);
    if ([[self result] isEqual:@""]) {
        return @"0";
    }
    return self.result;
}

@end
