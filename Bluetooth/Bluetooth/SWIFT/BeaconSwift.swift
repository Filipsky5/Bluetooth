//
//  BeaconSwift.swift
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

import UIKit
import CoreLocation

class BeaconSwift: NSObject {
    let name:String
    let uiid:NSUUID
    
    init(name:String, andUIID uiid:NSUUID) {
        self.name = name
        self.uiid = uiid
        super.init()
        
    }
    
    func isEqualToBeacon(beacon:CLBeacon) ->Bool {
        return beacon.proximityUUID.UUIDString == uiid.UUIDString
    }

}
