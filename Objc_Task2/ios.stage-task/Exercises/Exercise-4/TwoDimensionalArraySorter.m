#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray* numArray = [NSMutableArray new];
    NSMutableArray* strArray = [NSMutableArray new];
    
    if ([array isEqualToArray:@[]] || array == nil || ![array[0] isKindOfClass:[NSArray class]])  {
            return @[];
        }
    
    
    for (NSArray* lilArray in array) {
        for (id unknown in lilArray) {
            if ([unknown isKindOfClass:[NSNumber class]]) {
                [numArray addObject:unknown];
            } else {
                [strArray addObject:unknown];
            }
        }
        
    }
    
    if ([strArray count] == 0) {
        
        [numArray sortUsingDescriptors:
        [NSArray arrayWithObject:
        [NSSortDescriptor sortDescriptorWithKey:@"self"
                                      ascending:YES]]];
        
        return numArray;
        
    }
    
    if ([numArray count] == 0) {
        
        [strArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        return strArray;
        
    }
    
    [strArray sortUsingDescriptors:
     [NSArray arrayWithObject:
      [NSSortDescriptor sortDescriptorWithKey:nil
                                    ascending:NO
                                     selector:@selector(localizedCaseInsensitiveCompare:)]]];
    
    [numArray sortUsingDescriptors:
     [NSArray arrayWithObjects:
      [NSSortDescriptor sortDescriptorWithKey:nil
                                    ascending:YES], nil]];
    
    return [NSArray arrayWithObjects:numArray, strArray, nil];
    
}

@end
