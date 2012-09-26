//
//  ArrayCalculatorTests.m
//  ArrayCalculatorTests
//
//  Created by James Richard on 9/20/12.
//  Copyright (c) 2012 LucidCoding. All rights reserved.
//

#import "ArrayCalculatorTests.h"
#import "ArrayCalculator.h"

@implementation ArrayCalculatorTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testStringToArray
{
    NSError *error;
    NSArray *array = [ArrayCalculator arrayFromString:@"123456789" error:&error];
    NSArray *compArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1], 
                          [NSNumber numberWithInt:2],
                          [NSNumber numberWithInt:3],
                          [NSNumber numberWithInt:4],
                          [NSNumber numberWithInt:5],
                          [NSNumber numberWithInt:6],
                          [NSNumber numberWithInt:7],
                          [NSNumber numberWithInt:8],
                          [NSNumber numberWithInt:9],
                          nil];
    STAssertTrue([array isEqualToArray:compArray], @"String did not convert properly");
}

- (void)testStringToArrayWithInvalidCharacter {
    NSError *error;
    [ArrayCalculator arrayFromString:@"123456789+" error:&error];
    STAssertNotNil(error, @"Error should not be nil");
}

- (void) testSumOfIntWithRemainder {
    unsigned int r = 1;
    STAssertTrue([ArrayCalculator sumOfInt:3 andInt:5 withRemainder:&r] == 9, @"Sum of integers should add the remainder");
}

- (void) testSumOfIntOverTenWithRemainder {
    unsigned int r = 1;
    STAssertTrue([ArrayCalculator sumOfInt:8 andInt:5 withRemainder:&r] == 4, @"Sum of integers with a value over ten and addition of remainder do not add up");
}

- (void) testSumOfInvalidFirstInt {
    unsigned int r;
    STAssertThrows([ArrayCalculator sumOfInt:10 andInt:5 withRemainder:&r], @"Invalid integer in first argument should throw an exception");
}

- (void) testSumOfInvalidSecondInt {
    unsigned int r;
    STAssertThrows([ArrayCalculator sumOfInt:5 andInt:15 withRemainder:&r], @"Invalid integer in second argument should throw an exception");
}

- (void) testSumOfWithInvalidRemainder {
    unsigned int r = 2;
    STAssertThrows([ArrayCalculator sumOfInt:5 andInt:3 withRemainder:&r], @"Invalid remainder value should throw an exception");
}

- (void) testSumOfArraysWithEqualSizes {
    // Lets start with a basic one; couple carryovers, but results in the same size as original
    NSArray *array1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5], 
                          [NSNumber numberWithInt:8],
                          [NSNumber numberWithInt:0],
                          [NSNumber numberWithInt:5],
                          nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1], 
                       [NSNumber numberWithInt:2],
                       [NSNumber numberWithInt:0],
                       [NSNumber numberWithInt:9],
                       nil];
    NSArray *summedArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:7], 
                            [NSNumber numberWithInt:0],
                            [NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:4],
                            nil];
    STAssertTrue([[ArrayCalculator sumArray:array1 andArray:array2] isEqualToArray:summedArray], @"Equal sized arrays did not sum properly");
    
    // Now lets make a result that is larger than the intial arrays
    array1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:7], 
                       [NSNumber numberWithInt:5],
                       [NSNumber numberWithInt:3],
                       [NSNumber numberWithInt:5],
                       nil];
    array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:9], 
                       [NSNumber numberWithInt:3],
                       [NSNumber numberWithInt:2],
                       [NSNumber numberWithInt:3],
                       nil];
    summedArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1], 
                            [NSNumber numberWithInt:6], 
                            [NSNumber numberWithInt:8],
                            [NSNumber numberWithInt:5],
                            [NSNumber numberWithInt:8],
                            nil];
    STAssertTrue([[ArrayCalculator sumArray:array1 andArray:array2] isEqualToArray:summedArray], @"Equal sized arrays did not sum properly when needing to carry remainder over");
}

- (void) testSumOfArraysWithLargerFirstArray {
    NSArray *array1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5], 
                       [NSNumber numberWithInt:2], 
                       [NSNumber numberWithInt:8],
                       [NSNumber numberWithInt:9],
                       [NSNumber numberWithInt:3],
                       nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:3], 
                       [NSNumber numberWithInt:5],
                       [NSNumber numberWithInt:0],
                       [NSNumber numberWithInt:0],
                       nil];
    NSArray *summedArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5], 
                            [NSNumber numberWithInt:6], 
                            [NSNumber numberWithInt:3],
                            [NSNumber numberWithInt:9],
                            [NSNumber numberWithInt:3],
                            nil];
    STAssertTrue([[ArrayCalculator sumArray:array1 andArray:array2] isEqualToArray:summedArray], @"Larger first array of arrays did not sum properly");
    
    array1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:7], 
              [NSNumber numberWithInt:5],
              [NSNumber numberWithInt:3],
              [NSNumber numberWithInt:5],
              nil];
    array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5],
              nil];
    summedArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:7], 
                   [NSNumber numberWithInt:5],
                   [NSNumber numberWithInt:4],
                   [NSNumber numberWithInt:0],
                   nil];
    STAssertTrue([[ArrayCalculator sumArray:array1 andArray:array2] isEqualToArray:summedArray], @"Larger first array of arrays did not sum properly");
}

- (void) testSumOfArraysWithLargerSecondArray {
    NSArray *array1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:2], 
                       [NSNumber numberWithInt:7],
                       nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:3], 
                       [NSNumber numberWithInt:5],
                       [NSNumber numberWithInt:1],
                       [NSNumber numberWithInt:3],
                       nil];
    NSArray *summedArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:3], 
                            [NSNumber numberWithInt:5],
                            [NSNumber numberWithInt:4],
                            [NSNumber numberWithInt:0],
                            nil];
    STAssertTrue([[ArrayCalculator sumArray:array1 andArray:array2] isEqualToArray:summedArray], @"Larger second array of arrays did not sum properly");
    
    array1 = [[NSArray alloc] init];
    array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5],
              [NSNumber numberWithInt:5],
              [NSNumber numberWithInt:3],
              [NSNumber numberWithInt:5],
              nil];
    summedArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:5], 
                   [NSNumber numberWithInt:5],
                   [NSNumber numberWithInt:3],
                   [NSNumber numberWithInt:5],
                   nil];
    
    STAssertTrue([[ArrayCalculator sumArray:array1 andArray:array2] isEqualToArray:summedArray], @"Sum of arrays with empty first array did not sum properly");
}

@end
