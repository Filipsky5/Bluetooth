//
//  SwiftBLERetriver.swift
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

import UIKit
import CoreBluetooth
protocol SwiftBLERetriverDelegate {
    func retriveDeviceWithUIID(UUID:String)
}

class SwiftBLERetriver: NSObject,CBCentralManagerDelegate,CBPeripheralDelegate {
    var manager:CBCentralManager?
    var delegate:SwiftBLERetriverDelegate
    var peripheralsUUID:Array<String>
    var peripherals:Dictionary<String,CBPeripheral>
    
    init(delegate:SwiftBLERetriverDelegate) {
        peripherals = Dictionary<String,CBPeripheral>()
        peripheralsUUID = Array<String>()
        peripheralsUUID.append(MYBEACONUUID)
        self.delegate = delegate
        delegate.retriveDeviceWithUIID(MYBEACONUUID)
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil, options: nil)
        
    }
    
    func scan() {
        manager!.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        if peripherals[peripheral.identifier.UUIDString] == nil {
            delegate.retriveDeviceWithUIID(peripheral.identifier.UUIDString)
            peripherals.updateValue(peripheral, forKey: peripheral.identifier.UUIDString)
            peripheralsUUID.append(peripheral.identifier.UUIDString)
        }
    }
    
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        
        peripheral.delegate = nil;
        peripheral.discoverServices(nil)
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        for service in peripheral.services! {
            print("Discovered serivce \(service)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: NSError?) {
        print("RSSI \(RSSI)")
    }
    
    func stopScanning() {
        self.manager!.stopScan()
    }
    
    func connectWithUIID(_UIID:String) {
        if(_UIID != MYBEACONUUID) {
            manager!.connectPeripheral(peripherals[_UIID]!, options: nil)
            peripherals[_UIID]!.delegate = self
            let fireDate:NSDate = NSDate(timeIntervalSinceNow: 1.0)
            let timer:NSTimer = NSTimer.init(fireDate: fireDate, interval: 0.5, target: self, selector: "readRSSIForPeripheral:", userInfo: peripherals[_UIID], repeats: true)
            let runLoop:NSRunLoop = NSRunLoop.currentRunLoop()
            runLoop.addTimer(timer, forMode: NSDefaultRunLoopMode)
        }
    }
    
    func readRSSIForPeripheral(theTime:NSTimer) {
        let peripheral:CBPeripheral = theTime.userInfo as! CBPeripheral
        peripheral.readRSSI()
    }
    

}
