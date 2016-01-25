//
//  BeaconLocator.m
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import "BeaconLocator.h"

@interface BeaconLocator()
@property(nonatomic,strong) BeaconObjC* item;

@end

@implementation BeaconLocator

-(instancetype)init {
    self = [super init];
    if(!self) {
        return nil;
    }
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    [self.locationManager setDelegate:self];
    
    return self;
}

- (void)startMonitoringItemWithUUID:(NSUUID*)uuid andIdentifier:(NSString*)identifier {
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:identifier];
    beaconRegion.notifyEntryStateOnDisplay = YES;
    self.item = [[BeaconObjC alloc]initWithName:identifier uuid:uuid];
    [self.locationManager startUpdatingLocation];
    [self.locationManager startMonitoringForRegion:beaconRegion];
    [self.locationManager startRangingBeaconsInRegion:beaconRegion];
    
}

- (void)stopMonitoringItemWithUUID:(NSUUID*)uuid andIdentifier:(NSString*)identifier{
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuid identifier:identifier];
    self.item = nil;
    [self.locationManager stopMonitoringForRegion:beaconRegion];
    [self.locationManager stopRangingBeaconsInRegion:beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"Failed monitoring region: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager failed: %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    NSLog(@"Exit region %@",[region identifier]);
}

-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region{
    
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region
{
    for (CLBeacon *beacon in beacons) {
        if([self.item isEqualToBeacon:beacon]){
            [self.delegate didReceiveBeaconInRenage:[beacon proximity] withDistance:[beacon accuracy]];
        }
    }
    
}


@end
