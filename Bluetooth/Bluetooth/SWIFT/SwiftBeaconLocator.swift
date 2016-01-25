//
//  SwiftBeaconLocator.swift
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

import UIKit
import CoreLocation
protocol SwiftBeaconLocatorDelegate {
    func didReceiveBeaconInRange(range: CLProximity);
}

class SwiftBeaconLocator: NSObject,CLLocationManagerDelegate {
    var locationManager:CLLocationManager = CLLocationManager()
    var delegate: SwiftBeaconLocatorDelegate
    var beacon:BeaconSwift?
    
    init(delegate:SwiftBeaconLocatorDelegate) {
        self.delegate = delegate
        locationManager.requestAlwaysAuthorization()
        locationManager.pausesLocationUpdatesAutomatically = false
        super.init();
        locationManager.delegate = self;
    }
    
    func startMonitoringItemWithUUID(UIID: NSUUID, andIdentifier identifier:String) {
        let beaconRegion = CLBeaconRegion(proximityUUID: UIID, identifier: identifier)
        beaconRegion.notifyEntryStateOnDisplay = true
        beacon = BeaconSwift(name: identifier, andUIID:UIID)
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
        
    }
    
    func stopMonitoringItemWithUUID(UIID: NSUUID, andIdentifier identifier:String) {
        let beaconRegion = CLBeaconRegion(proximityUUID: UIID, identifier: identifier)
        beacon = nil
        locationManager.stopUpdatingHeading()
        locationManager.stopRangingBeaconsInRegion(beaconRegion)
        locationManager.stopMonitoringForRegion(beaconRegion)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didFinishDeferredUpdatesWithError error: NSError?) {
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exit Region \(region)")
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        for _beacon in beacons {
            if(beacon!.isEqualToBeacon(_beacon)){
                delegate.didReceiveBeaconInRange(_beacon.proximity)
            }
        }
    }
    
    

}
