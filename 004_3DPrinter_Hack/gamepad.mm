#import "mainController.h"


@implementation mainController ( GAMEPAD )

- (void)findGamepad
{
    hidManager_OBJ = IOHIDManagerCreate(
                                        kCFAllocatorDefault,
                                        kIOHIDOptionsTypeNone
                                        );
    
    // Dictionary
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    [dict setObject:[NSNumber numberWithInt:kHIDPage_GenericDesktop] forKey:(NSString*)CFSTR(kIOHIDDeviceUsagePageKey)];

    [dict setObject:[NSNumber numberWithInt:kHIDUsage_GD_Joystick] forKey:(NSString*)CFSTR(kIOHIDDeviceUsageKey)];
    
    
    // set to manager
    IOHIDManagerSetDeviceMatching( hidManager_OBJ, (CFDictionaryRef)dict );
    
    
    
    // set callback
    IOHIDManagerRegisterDeviceMatchingCallback(
                                               hidManager_OBJ,
                                               HIDDeviceAdded,
                                               (void*)self
                                               );
    IOHIDManagerRegisterDeviceRemovalCallback(
                                              hidManager_OBJ,
                                              HIDDeviceRemoved,
                                              (void*)self
                                              );
    
    
    // add manager to runloop for continuous search
    IOHIDManagerScheduleWithRunLoop(
                                    hidManager_OBJ,
                                    CFRunLoopGetCurrent(),
                                    kCFRunLoopDefaultMode
                                    );
    
    
    // open manager
    IOReturn success = IOHIDManagerOpen( hidManager_OBJ, kIOHIDOptionsTypeNone );
    
    if( success == kIOReturnSuccess )
    {
        NSLog(@"HIDManager Open Success");
    }
    else
    {
        NSLog(@"HIDManager Open Fail");
    }
}


void HIDDeviceAdded( void* self_obj, IOReturn inResult, void* inSender, IOHIDDeviceRef device )
{
//    NSLog(@"game pad was added");
//    NSLog(@"Transport : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDTransportKey)) );
//    NSLog(@"VendorID : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDVendorIDKey) ));
//    NSLog(@"VendorIDSource : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDVendorIDSourceKey) ));
//    NSLog(@"ProductID : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDProductIDKey) ));
//    NSLog(@"VersionNumber : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDVersionNumberKey) ));
//    NSLog(@"Manufacturer : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDManufacturerKey) ));
//    NSLog(@"Product : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDProductKey) ));
//    NSLog(@"SerialNumber : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDSerialNumberKey) ));
//    NSLog(@"CountryCode : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDCountryCodeKey) ));
//    NSLog(@"StandardType : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDStandardTypeKey) ));
//    NSLog(@"DeviceKyeboardStandardType : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDDeviceKeyboardStandardTypeKey) ));
//    NSLog(@"LocationID : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDLocationIDKey) ));
//    NSLog(@"DeviceUsage : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDDeviceUsageKey) ));
//    NSLog(@"DeviceUsagePage : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDDeviceUsagePageKey) ));
//    NSLog(@"DeviceUsagePairs : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDDeviceUsagePairsKey) ));
//    NSLog(@"PrimaryUsage : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDPrimaryUsageKey) ));
//    NSLog(@"PrimaryUsagePage : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDPrimaryUsagePageKey) ));
//    NSLog(@"MaxInputReportSize : %@", IOHIDDeviceGetProperty( device, CFSTR( kIOHIDMaxInputReportSizeKey) ));

    // device open
    IOReturn success = IOHIDDeviceOpen(
                                       device,
                                       kIOHIDOptionsTypeNone
                                       );
    if( success == kIOReturnSuccess )
    { NSLog(@"HIDDevice Open Success ");}
    
    
    // set device to runloop
    IOHIDDeviceScheduleWithRunLoop(
                                   device,
                                   CFRunLoopGetCurrent(),
                                   kCFRunLoopDefaultMode
                                   );
    
    // set Input callback
    IOHIDDeviceRegisterInputValueCallback(
                                          device,
                                          HIDDevicePushed,
                                          self_obj
                                          );
}

void HIDDeviceRemoved( void* self_obj, IOReturn inResult, void* inSender, IOHIDDeviceRef device )
{
    IOReturn success = IOHIDDeviceClose(
                                        device,
                                        kIOHIDOptionsTypeNone
                                        );
    
    if( success == kIOReturnSuccess )
    { NSLog(@"HIDDevice Close Success"); }
    
    IOHIDDeviceUnscheduleFromRunLoop(
                                     device,
                                     CFRunLoopGetCurrent(),
                                     kCFRunLoopDefaultMode
                                     );
}





void HIDDevicePushed( void* self_obj, IOReturn inResult, void* inSender, IOHIDValueRef value )
{
    IOHIDElementRef element = IOHIDValueGetElement( value );
    long elementValue = IOHIDValueGetIntegerValue( value );
    IOHIDElementCookie cookie = IOHIDElementGetCookie(element);
    
    NSLog(@"%ld %d", elementValue, cookie );
    
    switch ( cookie )
    {
        case 19: // Up Down
            UD_Key = (int)elementValue;
            break;
        case 18: // Left Right
            LR_Key = (int)elementValue;
            break;
        case 7: // Button
            BT_Key = (int)elementValue;
            break;
        case 8: // Button
            BT_Key = (int)elementValue;
            break;
        default:
            break;
    }
}



@end