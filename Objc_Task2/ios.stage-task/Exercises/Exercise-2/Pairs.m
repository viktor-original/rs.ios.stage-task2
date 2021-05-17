#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    NSInteger buf = 0;
    NSInteger n = [number intValue];
    
    for(NSInteger i = 0; i<array.count; i++) {
        
        NSInteger a = [array[i] intValue];
        
        for (NSInteger j = 0; j < [array count]; j++) {
        
            NSInteger b = [array[j] intValue];
            
            if (a - b == n ) {
                buf += 1;
            }
            
        }
        
    }
    
    return buf;
    
}

@end
