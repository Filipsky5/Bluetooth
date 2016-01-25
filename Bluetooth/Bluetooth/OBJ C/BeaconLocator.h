//
//  BeaconLocator.h
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeaconObjC.h"
@import CoreLocation;

@protocol BeaconLocatorDelegate <NSObject>

-(void)didReceiveBeaconInRenage:(CLProximity)range withDistance:(CLLocationAccuracy)accuracy;

@end

@interface BeaconLocator : NSObject<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property(strong,nonatomic) id<BeaconLocatorDelegate> delegate;

- (void)startMonitoringItemWithUUID:(NSUUID*)uuid andIdentifier:(NSString*)identifier;
- (void)stopMonitoringItemWithUUID:(NSUUID*)uuid andIdentifier:(NSString*)identifier;

@end
