//
//  MasterViewController.swift
//  Bluetooth
//
//  Created by filip.jablonski on 04/10/15.
//  Copyright © 2015 filip.jablonski. All rights reserved.
//

import UIKit
import CoreBluetooth

class MasterViewController{//: UIViewController, CBCentralManagerDelegate,CBPeripheralDelegate {
    
   /* var centralManager: CBCentralManager
    var HRMPeripheral: CBPeripheral
    
    @IBOutlet weak var heartImage: UIImageView
    @IBOutlet weak var deviceInfo: UITextView
    
    var connected: String?
    var bodyData: String?
    var manufacturer: String?
    var deviceData: String?
    var heartRate: UInt16
    
    var heartRate: UILabel
    var pulsTimer: NSTimer
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        deviceData = "";
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.heartImage.image = UIImage(named: "HeartImage")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - CBCentralManagerDelegate
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
    }
    
    //MARK: - CBPeripheralDelegate
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
        
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        
    }
    
    //MARK: - CBCharacteristic helpers
    func getHeartBPMData(characteristic: CBCharacteristic, error:NSError?){
        
    }
    
    func getManufacturerName(characteristic: CBCharacteristic) {
        
    }
    
    func getBodyLocation(characteristic: CBCharacteristic) {
        
    }
    
    func doHearthBeat() {
        
    }*/
    

}
