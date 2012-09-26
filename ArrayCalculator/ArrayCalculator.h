//
//  ArrayCalculator.h
//  ArrayCalculator
//
//  Created by James Richard on 9/20/12.
//  Copyright (c) 2012 LucidCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CFArray.h>

@interface ArrayCalculator : NSObject
+ (NSArray*) arrayFromString:(NSString*)aString error:(NSError**)error;
+ (NSArray*) sumArray:(NSArray*)a1 andArray:(NSArray*)a2;
+ (int) sumOfInt:(int)i1 andInt:(int)i2 withRemainder:(unsigned int*)remainder;
@end
