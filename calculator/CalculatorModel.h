//
//  CalculatorModel.h
//  calculator
//
//  Created by Keming on 2015/4/14.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

- (void)appendNumber:(NSString*)number;
- (void)appendDot;

- (NSString*)getEquation;
- (NSString*)getResult;

@end
