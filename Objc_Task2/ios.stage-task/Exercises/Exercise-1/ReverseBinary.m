#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    UInt8 revNum = 0;
    
    for (NSInteger index = 0; index < 8; index++) {
        
        if (n % 2) {
            revNum += pow(2, 7 - index);
        }
        
        n /=2;
        
    }
    
    return revNum;
    
}
