//
//  SerialSearch.h
//  cvCamTest
//
//  Created by 渡辺 圭介 on 2013/08/04.
//  Copyright (c) 2013年 渡辺 圭介. All rights reserved.
//



// IOKit.framework need to be loaded.

#import <Cocoa/Cocoa.h>

#import <sys/ioctl.h>

#import <IOKit/IOKitLib.h>
#import <IOKit/serial/IOSerialKeys.h>
#import <IOKit/IOBSD.h>
#import <IOKit/serial/ioss.h>

@interface SerialSearch : NSObject
{
}

@property ( nonatomic, retain )NSMutableArray* serialPathArray;


- (void)findSerial;

@end
