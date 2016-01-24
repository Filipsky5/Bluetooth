//
//  ProximityObjCViewController.h
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProximityObjCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *proximityLabel;
@property (strong, nonatomic) NSUUID *UUID;

@end
