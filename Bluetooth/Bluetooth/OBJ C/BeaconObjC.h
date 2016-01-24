//
//  BeaconObjC.h
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface BeaconObjC : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSUUID *uuid;
@property (assign, nonatomic, readonly) CLBeaconMajorValue majorValue;
@property (assign, nonatomic, readonly) CLBeaconMinorValue minorValue;

- (instancetype)initWithName:(NSString *)name
                        uuid:(NSUUID *)uuid
                       major:(CLBeaconMajorValue)major
                       minor:(CLBeaconMinorValue)minor;

-(instancetype)initWithName:(NSString *)name uuid:(NSUUID *)uuid;

-(BOOL)isEqualToBeacon:(CLBeacon*)beacon;

@end
