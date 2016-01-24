//
//  BeaconObjC.m
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import "BeaconObjC.h"

@implementation BeaconObjC

-(instancetype)initWithName:(NSString *)name uuid:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _name = name;
    _uuid = uuid;
    _majorValue = major;
    _minorValue = minor;
    
    return self;

}

-(instancetype)initWithName:(NSString *)name uuid:(NSUUID *)uuid {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _name = name;
    _uuid = uuid;
    
    return self;
    
}

-(BOOL)isEqualToBeacon:(CLBeacon*)beacon {
    return [[[beacon proximityUUID] UUIDString] isEqualToString:[self.uuid UUIDString]];
}

@end
