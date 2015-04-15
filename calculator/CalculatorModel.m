//
//  CalculatorModel.m
//  calculator
//
//  Created by Keming on 2015/4/14.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel ()

@property (strong, nonatomic) NSString* lastNumber;
@property (strong, nonatomic) NSString* result;

@end

@implementation CalculatorModel

int maxResultLength = 18;

- (id)init
{
    self = [super init];
    self.result = @"";
    self.lastNumber = @"";

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

- (NSString*)getEquation
{
    NSLog(@"test string to number %g", [self.result doubleValue]);
    return [NSString stringWithFormat:@"%@%@%@=", self.lastNumber, @"", self.result];
}

- (NSString*)getResult
{
    if ([[self result] isEqual:@""]) {
        return @"0";
    }
    return self.result;
}

@end
