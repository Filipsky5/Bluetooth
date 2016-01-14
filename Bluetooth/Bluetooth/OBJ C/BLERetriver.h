//
//  BLERetriver.h
//  Bluetooth
//
//  Created by filip.jablonski on 14/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
@protocol BLERetriverDelegate
@required
-(void)retriveDeviceWithUIID:(NSString*)UIID;
@end;

@interface BLERetriver : NSObject <CBCentralManagerDelegate,CBPeripheralDelegate>
@property (nonatomic,strong) CBCentralManager *manager;
@property (nonatomic,strong) id<BLERetriverDelegate> delegate;
@property (nonatomic,strong) NSMutableDictionary *peripherals;

-(void) scan;
-(void) stopScanning;
-(void) connectWithUIID:(NSString*)UIID;
@end
