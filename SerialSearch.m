//
//  SerialSearch.m
//  cvCamTest
//
//  Created by 渡辺 圭介 on 2013/08/04.
//  Copyright (c) 2013年 渡辺 圭介. All rights reserved.
//

#import "SerialSearch.h"

// G21 set unit to mm
// G28 homing
// G90 set to abs mode
// G92 set current position to ...

// M104 S... nozzle temp
// M140 S... bed temp

// M105 Get Nozzle temp



@implementation SerialSearch

- (id)init
{
    self = [super init];
    
    _serialPathArray = [[NSMutableArray alloc] init];
        
    return self;
}


- (void)awakeFromNib
{
    NSLog(@"SerialSearch AFN");
}



- (void)findSerial
{
    
    io_object_t serialPort;
    io_iterator_t serialPort_Iterator;
    
    // search all serial ports
    IOServiceGetMatchingServices(
                                 kIOMasterPortDefault,
                                 IOServiceMatching( kIOSerialBSDServiceValue),
                                 &serialPort_Iterator
                                 );
    
    
    // add serial path
    while ( ( serialPort = IOIteratorNext( serialPort_Iterator ) ) )
    {
        NSString* tempString = (NSString*)IORegistryEntryCreateCFProperty(
                                                                          serialPort,
                                                                          CFSTR(kIOCalloutDeviceKey),
                                                                          kCFAllocatorDefault, 0
                                                                          );
        
        [_serialPathArray addObject:tempString];
        
        IOObjectRelease( serialPort );
    }
    
    
    IOObjectRelease( serialPort_Iterator );
    
}
@end
