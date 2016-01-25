//
//  SwiftBeaconViewController.swift
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

import UIKit

class SwiftBeaconViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, SwiftBLERetriverDelegate {

    @IBOutlet weak var uiidTextField: UITextField!
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var beaconsTableView: UITableView!
    
    var devices:Array<String>
    var bleRetriver:SwiftBLERetriver?
    

    required init?(coder aDecoder: NSCoder) {
        devices = Array<String>()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bleRetriver = SwiftBLERetriver(delegate: self);
        scanButton.setTitle("Scan", forState: .Normal)
        beaconsTableView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = beaconsTableView.dequeueReusableCellWithIdentifier("DeviceCell", forIndexPath: indexPath)
        cell.textLabel?.text = devices[indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        uiidTextField.text = devices[indexPath.row]
    }
    
    @IBAction func ScanPressed(sender: AnyObject) {
        if(scanButton.titleForState(.Normal) == "Scan") {
            bleRetriver!.scan()
        }
    }
    @IBAction func connectPressed(sender: AnyObject) {
        performSegueWithIdentifier("swiftDistanceSegue", sender: nil)
    }

    func retriveDeviceWithUIID(UUID: String) {
        devices.append(UUID)
        beaconsTableView.reloadData()
        stopButton.hidden = true
    }
    
    @IBAction func stopScanning(sender: AnyObject) {
        bleRetriver!.stopScanning()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let uuid:NSUUID = NSUUID(UUIDString: uiidTextField.text!)!
        let proximityVC:ProximitySwiftViewController = segue.destinationViewController as! ProximitySwiftViewController
        proximityVC.UUID = uuid
      //  ProximityObjCViewController *proximityVC = [segue destinationViewController];
       // [proximityVC setUUID:uuid];
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
