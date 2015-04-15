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

- (void)appendNumber:(NSString*)number
{
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
}

- (void)putResultToEquation
{
    self.result = [self stringWithFormatNumber:self.result];
    if (![self.result isEqual:@""]) {
        if (![self.operation isEqual:@""]) {
            long double firstNumber = [self.equation doubleValue];
            long double secondNumber = [self.result doubleValue];
            long double result = 0.0;

            if ([self.operation isEqual:@"+"]) {
                result = firstNumber + secondNumber;
            }
            if ([self.operation isEqual:@"-"]) {
                result = firstNumber - secondNumber;
            }
            if ([self.operation isEqual:@"×"]) {
                result = firstNumber * secondNumber;
            }
            if ([self.operation isEqual:@"÷"]) {
                result = firstNumber / secondNumber;
            }

            self.equation = [self stringWithFormatNumber:[NSString stringWithFormat:@"%.8Lf", result]];
            self.operation = @"";
        }
        else {
            self.equation = [self.equation stringByAppendingString:self.result];
        }

        self.result = @"";
    }
    else if ([self.operation isEqual:@""]) {
        self.equation = @"0";
    }
}

- (void)pressPlus
{
    [self putResultToEquation];
    self.operation = @"+";
}

- (void)pressMinus
{
    [self putResultToEquation];
    self.operation = @"-";
}

- (void)pressMultiplied
{
    [self putResultToEquation];
    self.operation = @"×";
}

- (void)pressDivided
{
    [self putResultToEquation];
    self.operation = @"÷";
}

- (NSString*)getEquation
{
    return [NSString stringWithFormat:@"%@%@%@", self.equation, self.operation, self.result];
}

- (NSString*)getResult
{
    if ([[self result] isEqual:@""]) {
        return @"0";
    }
    return self.result;
}

@end
