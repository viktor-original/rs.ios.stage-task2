#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSString* finalString = @"";
    
    NSMutableString* mutableString = [numbersArray componentsJoinedByString:@"."];
    
    NSInteger numberCount = 0;
    
    BOOL arrayCheck = YES;
    
    if (numbersArray == nil) {
        numbersArray = @[];
        return finalString;
    }
    
    for (NSInteger index=0; index<numbersArray.count; index++) {
        
        NSInteger numberAtIndex = [numbersArray[index] intValue];
        
        if (255>=numberAtIndex && numberAtIndex>=0 && numberCount <= 4) {
            numberCount += 1;
            arrayCheck = YES;
            
            if (numbersArray.count < 4) {
                
                for (NSInteger appendCount = 0; appendCount < 4 - numbersArray.count; appendCount++) {
                    [mutableString appendString:@".0"];
                }
                
                finalString = mutableString;
                return finalString;
                arrayCheck = NO;
            }
            
        } else if (numberAtIndex > 255) {
            return finalString = @"The numbers in the input array can be in the range from 0 to 255.";
            arrayCheck = NO;
            
        } else if (numberAtIndex < 0) {
            return finalString = @"Negative numbers are not valid for input.";
            arrayCheck = NO;
            
        } else if (numberCount > 4) {
            return finalString = @"";
            arrayCheck = NO;
        }
        
        (arrayCheck)?(finalString = [numbersArray componentsJoinedByString:@"."]):(finalString);
        
    }
    
    return finalString;
    
}

@end
