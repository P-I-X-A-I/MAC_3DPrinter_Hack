//
//  mainController.m
//  004_3DPrinter_Hack
//
//  Created by 渡辺 圭介 on 2013/08/04.
//  Copyright (c) 2013年 渡辺 圭介. All rights reserved.
//

#import "mainController.h"

@implementation mainController


- (id)init
{
    self = [super init];
    
    SerialSearch_OBJ = [[SerialSearch alloc] init];
    [SerialSearch_OBJ findSerial];
    
    serial_Descriptor = -1;
    
    isActiveGamePad = NO;
    
    checkTimer_OBJ = nil;
    Nozzle_Check_timer = nil;
    
    UD_Key = 127;
    LR_Key = 127;
    BT_Key = 0;
    
    
    ACCEL_X = 0.0;
    ACCEL_Y = 0.0;
    ACCEL_E = 0.0;
    
    VEL_X = 0.0;
    VEL_Y = 0.0;
    VEL_E = 0.0;
    
    POS_X = 0.0;
    POS_Y = 0.0;
    POS_E = 0.0;
    
    NOZZLE_COUNTER = 0;
    COUNT_DOWN = 0;
    
    isInGame = NO;
    
    
    demoCounter = 0;
    demoTimer = nil;
    
    //F
    FUJITSU[0][0] = 1.0;    FUJITSU[0][1] = 0.0;
    FUJITSU[1][0] = 0.0;    FUJITSU[1][1] = 0.0;
    FUJITSU[2][0] = 0.0;    FUJITSU[2][1] = 5.0;
    FUJITSU[3][0] = 3.0;    FUJITSU[3][1] = 5.0;
    FUJITSU[4][0] = 3.0;    FUJITSU[4][1] = 4.0;
    FUJITSU[5][0] = 1.0;    FUJITSU[5][1] = 4.0;
    FUJITSU[6][0] = 1.0;    FUJITSU[6][1] = 3.0;
    FUJITSU[7][0] = 3.0;    FUJITSU[7][1] = 3.0;
    FUJITSU[8][0] = 3.0;    FUJITSU[8][1] = 2.0;
    FUJITSU[9][0] = 1.0;    FUJITSU[9][1] = 2.0;
    FUJITSU[10][0] = 1.0;    FUJITSU[10][1] = 0.0;
    
    //U
    FUJITSU[11][0] = 6.0;    FUJITSU[11][1] = 0.0;
    FUJITSU[12][0] = 5.0;    FUJITSU[12][1] = 0.0;
    FUJITSU[13][0] = 4.0;    FUJITSU[13][1] = 1.0;
    FUJITSU[14][0] = 4.0;    FUJITSU[14][1] = 5.0;
    FUJITSU[15][0] = 5.0;    FUJITSU[15][1] = 5.0;
    FUJITSU[16][0] = 5.0;    FUJITSU[16][1] = 1.0;
    FUJITSU[17][0] = 6.0;    FUJITSU[17][1] = 1.0;
    FUJITSU[18][0] = 6.0;    FUJITSU[18][1] = 5.0;
    FUJITSU[19][0] = 7.0;    FUJITSU[19][1] = 5.0;
    FUJITSU[20][0] = 7.0;    FUJITSU[20][1] = 1.0;
    FUJITSU[21][0] = 6.0;    FUJITSU[21][1] = 0.0;
    
    //J
    FUJITSU[22][0] = 10.0;    FUJITSU[22][1] = 0.0;
    FUJITSU[23][0] = 9.0;    FUJITSU[23][1] = 0.0;
    FUJITSU[24][0] = 8.0;    FUJITSU[24][1] = 1.0;
    FUJITSU[25][0] = 8.0;    FUJITSU[25][1] = 2.0;
    FUJITSU[26][0] = 9.0;    FUJITSU[26][1] = 2.0;
    FUJITSU[27][0] = 9.0;    FUJITSU[27][1] = 1.0;
    FUJITSU[28][0] = 10.0;    FUJITSU[28][1] = 1.0;
    FUJITSU[29][0] = 10.0;    FUJITSU[29][1] = 4.0;
    FUJITSU[30][0] = 8.0;    FUJITSU[30][1] = 4.0;
    FUJITSU[31][0] = 8.0;    FUJITSU[31][1] = 5.0;
    FUJITSU[32][0] = 11.0;    FUJITSU[32][1] = 5.0;
    FUJITSU[33][0] = 11.0;    FUJITSU[33][1] = 1.0;
    FUJITSU[34][0] = 10.0;    FUJITSU[34][1] = 0.0;
    
    //I
    FUJITSU[35][0] = 15.0;    FUJITSU[35][1] = 0.0;
    FUJITSU[36][0] = 12.0;    FUJITSU[36][1] = 0.0;
    FUJITSU[37][0] = 12.0;    FUJITSU[37][1] = 1.0;
    FUJITSU[38][0] = 13.0;    FUJITSU[38][1] = 1.0;
    FUJITSU[39][0] = 13.0;    FUJITSU[39][1] = 4.0;
    FUJITSU[40][0] = 12.0;    FUJITSU[40][1] = 4.0;
    FUJITSU[41][0] = 12.0;    FUJITSU[41][1] = 5.0;
    FUJITSU[42][0] = 15.0;    FUJITSU[42][1] = 5.0;
    FUJITSU[43][0] = 15.0;    FUJITSU[43][1] = 4.0;
    FUJITSU[44][0] = 14.0;    FUJITSU[44][1] = 4.0;
    FUJITSU[45][0] = 14.0;    FUJITSU[45][1] = 1.0;
    FUJITSU[46][0] = 15.0;    FUJITSU[46][1] = 1.0;
    FUJITSU[47][0] = 15.0;    FUJITSU[47][1] = 0.0;
    
    //T
    FUJITSU[48][0] = 18.0;    FUJITSU[48][1] = 0.0;
    FUJITSU[49][0] = 17.0;    FUJITSU[49][1] = 0.0;
    FUJITSU[50][0] = 17.0;    FUJITSU[50][1] = 4.0;
    FUJITSU[51][0] = 16.0;    FUJITSU[51][1] = 4.0;
    FUJITSU[52][0] = 16.0;    FUJITSU[52][1] = 5.0;
    FUJITSU[53][0] = 19.0;    FUJITSU[53][1] = 5.0;
    FUJITSU[54][0] = 19.0;    FUJITSU[54][1] = 4.0;
    FUJITSU[55][0] = 18.0;    FUJITSU[55][1] = 4.0;
    FUJITSU[56][0] = 18.0;    FUJITSU[56][1] = 0.0;

    //S
    FUJITSU[57][0] = 23.0;    FUJITSU[57][1] = 0.0;
    FUJITSU[58][0] = 20.0;    FUJITSU[58][1] = 0.0;
    FUJITSU[59][0] = 20.0;    FUJITSU[59][1] = 1.0;
    FUJITSU[60][0] = 22.0;    FUJITSU[60][1] = 1.0;
    FUJITSU[61][0] = 22.0;    FUJITSU[61][1] = 2.0;
    FUJITSU[62][0] = 20.0;    FUJITSU[62][1] = 2.0;
    FUJITSU[63][0] = 20.0;    FUJITSU[63][1] = 5.0;
    FUJITSU[64][0] = 23.0;    FUJITSU[64][1] = 5.0;
    FUJITSU[65][0] = 23.0;    FUJITSU[65][1] = 4.0;
    FUJITSU[66][0] = 21.0;    FUJITSU[66][1] = 4.0;
    FUJITSU[67][0] = 21.0;    FUJITSU[67][1] = 3.0;
    FUJITSU[68][0] = 23.0;    FUJITSU[68][1] = 3.0;
    FUJITSU[69][0] = 23.0;    FUJITSU[69][1] = 0.0;
    
    //U
    FUJITSU[70][0] = 26.0;    FUJITSU[70][1] = 0.0;
    FUJITSU[71][0] = 25.0;    FUJITSU[71][1] = 0.0;
    FUJITSU[72][0] = 24.0;    FUJITSU[72][1] = 1.0;
    FUJITSU[73][0] = 24.0;    FUJITSU[73][1] = 5.0;
    FUJITSU[74][0] = 25.0;    FUJITSU[74][1] = 5.0;
    FUJITSU[75][0] = 25.0;    FUJITSU[75][1] = 1.0;
    FUJITSU[76][0] = 26.0;    FUJITSU[76][1] = 1.0;
    FUJITSU[77][0] = 26.0;    FUJITSU[77][1] = 5.0;
    FUJITSU[78][0] = 27.0;    FUJITSU[78][1] = 5.0;
    FUJITSU[79][0] = 27.0;    FUJITSU[79][1] = 1.0;
    FUJITSU[80][0] = 26.0;    FUJITSU[80][1] = 0.0;
    FUJITSU[81][0] = 1.0;    FUJITSU[81][1] = 0.0;
    FUJITSU[82][0] = 1.0;    FUJITSU[82][1] = 0.0;
    FUJITSU[83][0] = 1.0;    FUJITSU[83][1] = 0.0;
    FUJITSU[84][0] = 1.0;    FUJITSU[84][1] = 0.0;
    FUJITSU[85][0] = 1.0;    FUJITSU[85][1] = 0.0;

    
    return self;
}


- (void)awakeFromNib
{
    NSLog(@"mainController AFN");
    [self findGamepad];
    
    [logField_OBJ setStringValue:@"Nozzle :"];
    
    [popup_OBJ removeAllItems];
    [popup_OBJ addItemsWithTitles:SerialSearch_OBJ.serialPathArray];
}


- (IBAction)textField:(NSTextField*)tField
{
    [self sendData:tField.stringValue];
}




- (IBAction)openButton:(NSButton*)bt
{
    NSString* tempString = [popup_OBJ titleOfSelectedItem];
    const char* path_CString = [tempString cStringUsingEncoding:NSUTF8StringEncoding];
    
    // if port is already open, close port.
    if( serial_Descriptor != -1 )
    {
        close( serial_Descriptor );
        serial_Descriptor = -1;
        sleep(0.5);
    }
    
    
    // variables
    struct termios options;
    unsigned long mics = 3;
    int success;
    
    // open port
    serial_Descriptor = open( path_CString, O_RDWR | O_NOCTTY | O_SYNC | O_NONBLOCK );
    
    if( serial_Descriptor == -1 )
    {
        NSLog(@"Error:open()");
    }
    else //1
    {
        // TIOCEXCL causes blocking of non-root processeds on serial port
        success = ioctl( serial_Descriptor, TIOCEXCL );
        success = fcntl( serial_Descriptor, F_SETFL, 0 );
        
        if( success == -1 )
        {
            NSLog(@"Error:2");
        }
        else//2
        {
            // get current options
            success = tcgetattr( serial_Descriptor, &gOriginalTTYAttrs );
            
            if( success == -1 )
            {
                NSLog(@"Error:3");
            }
            else//3
            {
                // copy original attrs and set all I/O flags invalid
                options = gOriginalTTYAttrs;
                cfmakeraw( &options );
                
                // set tty attrib
                success = tcsetattr( serial_Descriptor, TCSANOW, &options);
                
                if( success == -1 )
                {
                    NSLog(@"Error:4");
                }
                else//4
                {
                    // set baud rate
                    speed_t baudRate = 250000;
                    success = ioctl( serial_Descriptor, IOSSIOSPEED, &baudRate );
                    
                    if( success == -1 )
                    {
                        NSLog(@"Error:5");
                    }
                    else//5
                    {
                        success = ioctl( serial_Descriptor, IOSSDATALAT, &mics );
                        
                        if( success == -1 )
                        {
                            NSLog(@"Error:6");
                        }
                        else
                        {
                            // set callback to serial port
                            [self performSelectorInBackground:@selector(incommingData:) withObject:[NSThread currentThread]];
                        }
                    }//5
                }//4
            }//3
        }//2
    }//1
    
    
    
    NSLog(@"");
}




- (IBAction)homeButton:(NSButton*)bt
{
    NSLog(@"homing");
    isActiveGamePad = NO;

    [padButton_OBJ setTitle:@"Pad is unactive"];
    
    
    if(checkTimer_OBJ != nil)
    {
        [checkTimer_OBJ invalidate];
        checkTimer_OBJ = nil;
    }
    
    if( Nozzle_Check_timer != nil )
    {
        [Nozzle_Check_timer invalidate];
        Nozzle_Check_timer = nil;
    }
    
    [self sendData:@"G21"]; // set unit to mm
    [self sendData:@"G1 Z20"]; //
    [self sendData:@"G28 Y0"]; //homing
    [self sendData:@"G28 X0"]; //homing
    [self sendData:@"G28 Z0"]; //homing
    [self sendData:@"G90"]; // set to abs mode
    [self sendData:@"G92 X150 Y150 E0"];
    
    POS_X = POS_Y = 150.0;
    POS_E = 0.0;
    ACCEL_X = ACCEL_Y = ACCEL_E = 0.0;
    VEL_X = VEL_Y = VEL_E = 0.0;
    
    
    Nozzle_Check_timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:self
                                                        selector:@selector( nozzleCheck: )
                                                        userInfo:nil
                                                         repeats:YES];
}



- (void)nozzleCheck:(NSTimer*)timer
{
    [self sendData:@"M104 S200"];
    [self sendData:@"M140 S100"];
    [self sendData:@"M105"];
}

- (IBAction)startButton:(NSButton*)bt
{
    [self sendData:@"G92 E0"];
    [self sendData:@"G1 X140 Y140 Z3.0 F1000"];
    [self sendData:@"M104 S200"];
    [self sendData:@"M105"];
    POS_X = 140.0;
    POS_Y = 140.0;
    
    COUNT_DOWN = 4;
    
    isInGame = NO;
    
    NSTimer* tempTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                          target:self
                                                        selector:@selector(countDown:)
                                                        userInfo:nil
                                                         repeats:YES];
    
    
    [padButton_OBJ performClick:nil];
}


- (void)countDown:(NSTimer*)timer
{
    NSString* tempString;
    
    COUNT_DOWN--;
    
    if( !isInGame )
        {
            if( COUNT_DOWN > 0)
            {
                tempString = [NSString stringWithFormat:@"%d", COUNT_DOWN ];
            }
            else
            {
                tempString = @"START!";
                COUNT_DOWN = 61;
                isInGame = YES;
            }
            
    }
    else if( isInGame )
    {
        if( COUNT_DOWN != 0 )
        {
            tempString = [NSString stringWithFormat:@"%d", COUNT_DOWN];
        }
        else if( COUNT_DOWN == 0 )
        {
            tempString = @"Time's up!!";
            [timer invalidate];
            [homeButton_OBJ performClick:nil];
        }
    }
    
    [numberField_OBJ setStringValue:tempString];

}


- (IBAction)padButton:(NSButton*)bt
{
    if( isActiveGamePad == NO )
    {
        isActiveGamePad = YES;
        [padButton_OBJ setTitle:@"Pad is active"];
    
        if( checkTimer_OBJ != nil)
        {
            [checkTimer_OBJ invalidate];
        }
    
        checkTimer_OBJ = [NSTimer scheduledTimerWithTimeInterval:TIME_RESOLUTION
                                                          target:self
                                                        selector:@selector(checkPadState:)
                                                        userInfo:nil
                                                         repeats:YES];
    }
    else
    {
        isActiveGamePad = NO;
        [padButton_OBJ setTitle:@"Pad is Unactive"];
        
        [checkTimer_OBJ invalidate];
    }
}


- (void)incommingData:(NSThread*)thread
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    const int bufSize = 64;
    char buffer[bufSize];
    long numBytes = 0;
    NSString* inText;
    
    
    while ( TRUE )
    {
        numBytes = read( serial_Descriptor, buffer, bufSize );
        
        if( numBytes > 0 )
        {
            inText = [[NSString alloc] initWithCString:buffer encoding:NSUTF8StringEncoding];
            
            NSArray* tempArray = [inText componentsSeparatedByString:@"\n"];
            
            for( int i = 0 ; i < [tempArray count] ; i++ )
            {
                NSString* tempString = [tempArray objectAtIndex:i];
                NSLog(@"%@", tempString);
            }
            
            
            // find nozzle T
            NSRange tempRange = [inText rangeOfString:@"T:"];
            int location = (int)tempRange.location;
            
            if( location != -1 )
            {
                NSRange TRange = NSMakeRange( tempRange.location + 2, 3);
                NSString* TString = [inText substringWithRange:TRange];
                [logField_OBJ setStringValue:[NSString stringWithFormat:@"Nozzle : %@", TString]];
            }
            
            [inText release];
        }
        else
        {
            break;
        }
    }
    
    if( serial_Descriptor != -1 )
    {
        close( serial_Descriptor );
        serial_Descriptor = -1;
    }
    
    
    [pool release];
}


- (void)checkPadState:(NSTimer*)timer
{
    switch ( UD_Key )
    {
        case 0: // up
            
            if( VEL_Y >= 0.0 )
            {
                ACCEL_Y = 0.5;
            }
            else if( VEL_Y < 0.0 )
            {
                ACCEL_Y = 1.5;
            }
            break;
            
        case 127: // neutral
            VEL_Y = 0.0;
            ACCEL_Y = 0.0;
            break;
            
        case 255: // down
            
            if( VEL_Y >= 0.0 )
            {
                ACCEL_Y = -1.5;
            }
            else if( VEL_Y < 0.0 )
            {
                ACCEL_Y = -0.5;
            }
            break;
    }
    
    switch ( LR_Key ) {
        case 0: // left
            
            if( VEL_X >= 0.0 )
            {
                ACCEL_X = -1.5;
            }
            else if( VEL_X < 0.0 )
            {
                ACCEL_X = -0.5;
            }
            
            break;
        case 127: // neutral
            ACCEL_X = 0.0;
            VEL_X = 0.0;
            break;
        case 255: // right
            
            if( VEL_X >= 0.0)
            {
                ACCEL_X = 0.5;
            }
            else if( VEL_X < 0.0 )
            {
                ACCEL_X = 1.5;
            }
            break;
    }
    
    if( BT_Key == 1 )// on
    {
        ACCEL_E = 0.01;
    }
    else// off
    {
        ACCEL_E = 0.0;
        VEL_E = 0.0;
    }
    
    
   // VELOCITY
    VEL_X += ACCEL_X;
    VEL_Y += ACCEL_Y;
    VEL_E += ACCEL_E;
    
    double MAX_V = 1.5;
    
    if( VEL_X > MAX_V )
    { VEL_X = MAX_V; }
    else if( VEL_X < -MAX_V )
    { VEL_X = -MAX_V; }
    
    if( VEL_Y > MAX_V )
    { VEL_Y = MAX_V; }
    else if( VEL_Y < -MAX_V )
    { VEL_Y = -MAX_V; }
    
    if( VEL_E > 0.1 )
    { VEL_E = 0.1; }
    
    
    // POSITION
    POS_X += VEL_X;
    POS_Y += VEL_Y;
    POS_E += VEL_E;
    
    if( POS_X < 10.0 )
    { POS_X = 10.0; }
    else if( POS_X > BED_WIDTH-10.0 )
    { POS_X = BED_WIDTH-10.0; }
    
    if( POS_Y < 10.0 )
    { POS_Y = 10.0; }
    else if( POS_Y > BED_HEIGHT-10.0 )
    { POS_Y = BED_HEIGHT-10.0; }
    
    
    double distance = sqrt( VEL_Y*VEL_Y + VEL_X*VEL_X );
    double FEEDRATE = distance * (1.0/TIME_RESOLUTION) * 60.0;
    
    
    
    NSString* sendString = [[NSString alloc] initWithFormat:@"G1 X%1.4f Y%1.4f E%1.4f F%1.4f", POS_X, POS_Y, POS_E, FEEDRATE];
    
    if( BT_Key == 1 || FEEDRATE > 0.0 )
    {
        [self sendData:sendString];
    }
    
    NOZZLE_COUNTER++;
    if( NOZZLE_COUNTER == 50 )
    {
        NOZZLE_COUNTER = 0;
        [self sendData:@"M105"];
    }
    
    //NSLog(@"X:%1.3f Y:%1.3f E:%1.3f F:%1.5f", POS_X, POS_Y, POS_E, FEEDRATE );
    [sendString release];
}



- (IBAction)demoButton:(NSButton*)bt
{
    demoTimer = [NSTimer scheduledTimerWithTimeInterval:0.65 target:self selector:@selector(demoMethod:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:demoTimer forMode:NSDefaultRunLoopMode];
    
    [bt setEnabled:NO];
}


- (void)demoMethod:(NSTimer*)timer
{
    
    double scale = 4.0;
    double shiftX = 30.0;
    double shiftY = 18.0;
    double feed = 1200.0;
    NSLog(@"%d", demoCounter);
    if( demoCounter <= 80 )
    {
        double X = (FUJITSU[demoCounter][0] * scale) + shiftX;
        double Y = (FUJITSU[demoCounter][1] * scale) + shiftY;
        [self sendData:[NSString stringWithFormat:@"G1 X%1.4f Y%1.4f E%1.4f F%1.4f", X, Y, ((float)demoCounter)*0.8+2.0, feed]];
    }
    else
    {
        [self sendData:[NSString stringWithFormat:@"G1 X100.0f Y100.0 Z5.0 E%1.4f F%1.4f", ((float)demoCounter)*0.8, feed]];

        [timer invalidate];
        [demoButton_OBJ setEnabled:YES];
        demoCounter = 0;
    }
    
    demoCounter++;

}
@end
