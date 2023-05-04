//
//  mainController.h
//  004_3DPrinter_Hack
//
//  Created by 渡辺 圭介 on 2013/08/04.
//  Copyright (c) 2013年 渡辺 圭介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialSearch.h"

#import <IOKit/hid/IOHIDLib.h>

#define BED_WIDTH 150.0
#define BED_HEIGHT 150.0
#define TIME_RESOLUTION 0.05

int UD_Key;
int LR_Key;
int BT_Key;

@interface mainController : NSObject
{
    SerialSearch* SerialSearch_OBJ;
    NSTimer* Nozzle_Check_timer;
    
    
    // for gamepad
    BOOL isActiveGamePad;
    IOHIDManagerRef hidManager_OBJ;
    
    // GUI Outlet
    IBOutlet NSPopUpButton* popup_OBJ;
    IBOutlet NSButton* homeButton_OBJ;
    IBOutlet NSButton* padButton_OBJ;
    IBOutlet NSTextField* logField_OBJ;
    IBOutlet NSTextField* numberField_OBJ;
    IBOutlet NSButton* demoButton_OBJ;
    
    // Variables for serial port
    int serial_Descriptor;
    struct termios gOriginalTTYAttrs;
    
    
    // check pad state
    NSTimer* checkTimer_OBJ;
    int NOZZLE_COUNTER;
    int COUNT_DOWN;
    BOOL isInGame;
    
    // for Headmove control
    double ACCEL_X;
    double ACCEL_Y;
    double ACCEL_E;
    
    double VEL_X;
    double VEL_Y;
    double VEL_E;
    
    double POS_X;
    double POS_Y;
    double POS_E;
    
    double FUJITSU[86][2];
    
    int demoCounter;
    NSTimer* demoTimer;
}

- (IBAction)openButton:(NSButton*)bt;
- (IBAction)homeButton:(NSButton*)bt;
- (IBAction)startButton:(NSButton*)bt;
- (IBAction)padButton:(NSButton*)bt;
- (IBAction)textField:(NSTextField*)tField;
- (IBAction)heatButton:(NSButton*)bt;
- (IBAction)demoButton:(NSButton*)bt;
@end



@interface mainController ( GAMEPAD )
- (void)findGamepad;
@end


@interface mainController ( SENDSERIAL )
- (void)sendData:(NSString*)str;
@end