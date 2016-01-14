//
//  BLERetriver.m
//  Bluetooth
//
//  Created by filip.jablonski on 14/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import "BLERetriver.h"

@implementation BLERetriver

-(instancetype)init {
    self = [super init];
    if(self) {
        self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
        self.peripherals = [[NSMutableDictionary alloc]init];
    }
    return self;
}

-(void)scan {
    [self.manager scanForPeripheralsWithServices:nil options:nil];
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    [_delegate retriveDeviceWithUIID:[peripheral name]];
    [self.peripherals setObject:peripheral forKey:[peripheral name]];
}

-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
     peripheral.delegate = self;
     [peripheral discoverServices:nil];
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    for (CBService *service in peripheral.services) {
        NSLog(@"Discovered service %@", service);
    }
        
}

-(void)peripheral:(CBPeripheral *)peripheral didReadRSSI:(NSNumber *)RSSI error:(NSError *)error{
    NSLog(@"%@",RSSI);
}

-(void)stopScanning {
    [self.manager stopScan];
}

-(void)connectWithUIID:(NSString *)UIID {
    [self.manager connectPeripheral:[self.peripherals objectForKey:UIID] options:nil];
    [(CBPeripheral*) [self.peripherals objectForKey:UIID] setDelegate:self];
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:fireDate
                                              interval:0.5
                                                target:self
                                              selector:@selector(readRSSIForPeripheral:)
                                              userInfo:[self.peripherals objectForKey:UIID]
                                               repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void) readRSSIForPeripheral:(NSTimer*)theTime {
    CBPeripheral *peripheral = [theTime userInfo];
    [peripheral readRSSI];
}

@end
