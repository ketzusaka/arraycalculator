//
//  ArrayCalculator.m
//  ArrayCalculator
//
//  Created by James Richard on 9/20/12.
//  Copyright (c) 2012 LucidCoding. All rights reserved.
//

#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSArray*) arrayFromString:(NSString*)aString error:(NSError**)error {
    NSMutableArray *arr = [[NSMutableArray alloc] init];

    for (int i = 0; i != aString.length; i++) {
        unichar charCode = [aString characterAtIndex:i];
        if (charCode >= 48 && charCode < 58) {
            [arr addObject:[NSNumber numberWithInt:charCode-48]];            
        } else {
            *error = [NSError errorWithDomain:@"InvalidIntegerString" code:0 userInfo:nil];
            return nil;
        }
    }
    
    return [NSArray arrayWithArray:arr];
}

+ (NSArray*) sumArray:(NSArray*)a1 andArray:(NSArray*)a2 {
    // Setup the arrays so we are always summing the smaller length onto the larger length
    NSArray *sum1, *sum2;
    if (a1.count >= a2.count) {
        sum1 = a1;
        sum2 = a2;
    } else { 
        sum1 = a2;
        sum2 = a1;
    }
    
    // This holds the newly summed arrays
    NSMutableArray *summed = [NSMutableArray array];
    unsigned int remainder = 0;
    
    // Loop through the larger array and calculate the sum of each value
    for (int i = 0; i != sum1.count; i++) {
        int sum1Index = sum1.count-1-i;
        int sum2Index = sum2.count-1-i;
        
        int sum1Value = [[sum1 objectAtIndex:sum1Index] integerValue];
        int sum2Value = 0;
        if (sum2Index >= 0)
            sum2Value = [[sum2 objectAtIndex:sum2Index] integerValue];
        
        int sum = [ArrayCalculator sumOfInt:sum1Value andInt:sum2Value withRemainder:&remainder];
        [summed insertObject:[NSNumber numberWithInt:sum] atIndex:0];
    }
    
    // If the last summing left a remainder we need to insert that into the summed array
    if (remainder == 1)
        [summed insertObject:[NSNumber numberWithInt:1] atIndex:0];
    
    return [NSArray arrayWithArray:summed];
}


// This method does the actual addition and sets the remainder
+ (int) sumOfInt:(int)i1 andInt:(int)i2 withRemainder:(unsigned int*)remainder {
    if (i1 >= 10 || i2 >= 10)
        [NSException raise:@"InvalidArgumentException" format:@"i1 and i2 must be less than 10"];
    
    if (*remainder > 1)
        [NSException raise:@"InvalidArgumentException" format:@"remainder must be either 0 or 1"];
    int sum = i1 + i2 + *remainder;
    
    if (sum >= 10) {
        *remainder = 1;
        return sum-10;
    } else {
        *remainder = 0;
        return sum;
    }
}
@end
