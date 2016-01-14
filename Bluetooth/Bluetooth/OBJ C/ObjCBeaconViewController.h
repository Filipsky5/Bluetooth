//
//  ObjCBeaconViewController.h
//  Bluetooth
//
//  Created by filip.jablonski on 14/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLERetriver.h"

@interface ObjCBeaconViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,BLERetriverDelegate>

@end
