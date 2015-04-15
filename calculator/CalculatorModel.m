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
@property (strong, nonatomic) NSString* sign;
@property (strong, nonatomic) NSString* operation;
@property (strong, nonatomic) NSString* result;

@end

@implementation CalculatorModel

int maxResultLength = 18;

- (id)init
{
    self = [super init];
    [self clean];
    return self;
}

- (NSString*)getLastCharacter:(NSString*)string
{
    if ([string length] == 0) {
        return NULL;
    }
    else {
        unichar temp = [string characterAtIndex:[string length] - 1];
        return [NSString stringWithFormat:@"%C", temp];
    }
}

- (BOOL)isContainDot:(NSString*)string
{
    for (int i = 0; i < [string length]; i++) {
        if ([string characterAtIndex:i] == '.') {
            return true;
        }
    }
    return false;
}

- (NSString*)stringWithFormatNumber:(NSString*)string
{
    if ([string isEqual:@"nan"] || [string isEqual:@"inf"]) {
        return @"0";
    }

    if (![self isContainDot:string]) {
        return string;
    }

    int index = (int)[string length] - 1;
    while (index >= 0) {
        if ([string characterAtIndex:index] != '0' && [string characterAtIndex:index] != '.') {
            break;
        }
        if ([string characterAtIndex:index] == '.') {
            index--;
            break;
        }
        index--;
    }
    NSRange range = { 0, index + 1 };
    return [string substringWithRange:range];
}

- (NSString*)doubleToFormatNumber:(long double)number
{
    return [self stringWithFormatNumber:[NSString stringWithFormat:@"%.8Lf", number]];
}

- (void)checkNeedToClean
{
    if ([self.operation isEqual:@"="]) {
        [self clean];
    }
}

- (void)appendNumber:(NSString*)number
{
    [self checkNeedToClean];
    NSString* lastCharacter = [self getLastCharacter:self.result];
    if (lastCharacter == NULL || [self.result isEqual:@"0"]) {
        self.result = number;
    }
    else if ([self.result length] < maxResultLength) {
        self.result = [self.result stringByAppendingString:number];
    }
}

- (void)appendDot
{
    [self checkNeedToClean];
    if ([self.result isEqual:@""]) {
        self.result = @"0.";
    }
    else if ([self.result length] < maxResultLength - 1 && ![self isContainDot:self.result]) {
        self.result = [self.result stringByAppendingString:@"."];
    }
}

- (void)clean
{
    self.equation = @"";
    self.operation = @"";
    self.result = @"";
    self.sign = @"";
}

- (NSString*)calculateEquation
{
    NSString* equationResult = self.equation;

    self.result = [self stringWithFormatNumber:self.result];

    if (![self.result isEqual:@""]) {
        if (![self.sign isEqual:@""]) {
            self.result = [NSString stringWithFormat:@"-%@", self.result];
        }
        
        if (![self.operation isEqual:@""]) {
            long double firstNumber = [self.equation doubleValue];
            long double secondNumber = [self.result doubleValue];
            long double result = 0.0;

            if ([self.operation isEqual:@"+"]) {
                result = firstNumber + secondNumber;
            }
            else if ([self.operation isEqual:@"-"]) {
                result = firstNumber - secondNumber;
            }
            else if ([self.operation isEqual:@"×"]) {
                result = firstNumber * secondNumber;
            }
            else if ([self.operation isEqual:@"÷"]) {
                result = firstNumber / secondNumber;
            }

            equationResult = [self doubleToFormatNumber:result];
        }
        else {
            equationResult = [self.equation stringByAppendingString:self.result];
        }

        self.result = @"";
    }
    else if ([self.operation isEqual:@""]) {
        equationResult = @"0";
    }

    self.operation = @"";
    self.sign = @"";

    return equationResult;
}

- (void)pressPlus
{
    [self checkNeedToClean];
    self.equation = [self calculateEquation];
    self.operation = @"+";
}

- (void)pressMinus
{
    [self checkNeedToClean];
    self.equation = [self calculateEquation];
    self.operation = @"-";
}

- (void)pressMultiplied
{
    [self checkNeedToClean];
    self.equation = [self calculateEquation];
    self.operation = @"×";
}

- (void)pressDivided
{
    [self checkNeedToClean];
    self.equation = [self calculateEquation];
    self.operation = @"÷";
}

- (void)pressEqual
{
    if (![self.operation isEqual:@"="]) {
        NSString* tempEquation = [self getEquation];
        self.result = [self calculateEquation];
        self.equation = tempEquation;
        self.operation = @"=";
    }
}

- (void)pressSign
{
    [self checkNeedToClean];
    if ([[self result] isEqual:@""]) {
        self.result = @"0";
    }

    if ([self.sign isEqual:@""]) {
        self.sign = @"±";
    }
    else {
        self.sign = @"";
    }
}

- (NSString*)getEquation
{
    NSString* result = [[NSString alloc] initWithString:self.result];
    if ([self.operation isEqual:@"="]) {
        result = @"";
    }
    else if ([self.sign isEqual:@"±"]) {
        result = [NSString stringWithFormat:@"±(%@)", self.result];
    }
    return [NSString stringWithFormat:@"%@%@%@", self.equation, self.operation, result];
}

- (NSString*)getResult
{
    NSString* result = [[NSString alloc] initWithString:self.result];
    if ([[self result] isEqual:@""]) {
        return @"0";
    }
    if (![self.sign isEqual:@""]) {
        result = [NSString stringWithFormat:@"-%@", self.result];
    }
    return result;
}

@end
