
#import "mainController.h"

@implementation mainController ( SENDSERIAL )

- (void)sendData:(NSString *)str
{
    char* nullChar = (char*)malloc(64);
    memset( nullChar, '\n', 64 );
    
    
    if( serial_Descriptor != -1 )
    {
        long dataLength = [str length];
        
        write(
              serial_Descriptor,
              [str UTF8String],
              dataLength
              );
        
        write(
              serial_Descriptor,
              nullChar,
              63 - dataLength
              );
    }
    
    free(nullChar);
}

@end