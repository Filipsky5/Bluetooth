//
//  ProximityObjCViewController.m
//  Bluetooth
//
//  Created by filip.jablonski on 24/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import "ProximityObjCViewController.h"
#import "BeaconLocator.h"

@interface ProximityObjCViewController () <BeaconLocatorDelegate>
@property (nonatomic,strong) BeaconLocator *locator;
@end

@implementation ProximityObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locator = [[BeaconLocator alloc]init];
    [self.locator setDelegate:self];
    [self startGettingProximityData];
    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.locator stopMonitoringItemWithUUID:self.UUID andIdentifier:[self.UUID UUIDString]];
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startGettingProximityData {
    if(self.UUID) {
        [self.locator startMonitoringItemWithUUID:self.UUID andIdentifier:[self.UUID UUIDString]];
    }
}

-(void)didReceiveBeaconInRenage:(CLProximity)range {
    [self.proximityLabel setText:[self nameForProximity:range]];
}


- (NSString *)nameForProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityUnknown:
            [self.proximityLabel setBackgroundColor:[UIColor purpleColor]];
            return @"Unknown";
            break;
        case CLProximityImmediate:
            [self.proximityLabel setBackgroundColor:[UIColor redColor]];
            return @"Gorąco";
            break;
        case CLProximityNear:
            [self.proximityLabel setBackgroundColor:[UIColor yellowColor]];
            return @"Ciepło";
            break;
        case CLProximityFar:
            [self.proximityLabel setBackgroundColor:[UIColor blueColor]];
            return @"Zimno";
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
