//
//  ProximitySwiftViewController.swift
//  Bluetooth
//
//  Created by filip.jablonski on 25/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

import UIKit
import CoreLocation

class ProximitySwiftViewController: UIViewController, SwiftBeaconLocatorDelegate {
    @IBOutlet weak var rangeLabel: UILabel!
    var UUID:NSUUID?
    var locator:SwiftBeaconLocator?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        locator = SwiftBeaconLocator(delegate: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startGettingProximityData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(animated: Bool) {
        if let _ = UUID {
            locator!.stopMonitoringItemWithUUID(UUID!, andIdentifier: UUID!.UUIDString)
        }
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGettingProximityData (){
        if let _ = UUID {
            locator!.stopMonitoringItemWithUUID(UUID!, andIdentifier: UUID!.UUIDString)
        }
    }
   
    func didReceiveBeaconInRange(range: CLProximity) {
        rangeLabel.text = nameForProximity(range)
    }
    
    func nameForProximity(proximity:CLProximity) ->String {
        switch(proximity){
        case .Unknown:
            rangeLabel.backgroundColor = UIColor.purpleColor()
            return "Unknown";
            break;
        case .Immediate:
            rangeLabel.backgroundColor = UIColor.redColor()
            return "Gorąco";
            break;
        case .Near:
            rangeLabel.backgroundColor = UIColor.yellowColor()
            return "Ciepło";
            break;
        case .Far:
            rangeLabel.backgroundColor = UIColor.blueColor()
            return "Zimno";
            break;
        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
