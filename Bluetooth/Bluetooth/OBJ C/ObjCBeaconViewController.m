//
//  ObjCBeaconViewController.m
//  Bluetooth
//
//  Created by filip.jablonski on 14/01/16.
//  Copyright © 2016 filip.jablonski. All rights reserved.
//

#import "ObjCBeaconViewController.h"

@interface ObjCBeaconViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UIIDTextField;
@property (weak, nonatomic) IBOutlet UIButton *ScanConnectBtn;
@property (weak, nonatomic) IBOutlet UITableView *DevicesTableView;
@property (strong, nonatomic) NSMutableArray *devices;
@property (strong, nonatomic) BLERetriver *bleRetriver;
@property (weak, nonatomic) IBOutlet UIButton *stopScanningBtn;

@end

@implementation ObjCBeaconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ScanConnectBtn setTitle:@"Scan" forState:UIControlStateNormal];
    [self.DevicesTableView reloadData];
    self.bleRetriver = [[BLERetriver alloc]init];
    [self.bleRetriver setDelegate:self];
    self.devices = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.DevicesTableView dequeueReusableCellWithIdentifier:@"DeviceCell" forIndexPath:indexPath];
    [cell.textLabel setText:self.devices[indexPath.row]];
    return cell;
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.devices count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.UIIDTextField setText:self.devices[indexPath.row]];
    [self.ScanConnectBtn setTitle:@"Connect" forState:UIControlStateNormal];
}
- (IBAction)ScanConnectPressed:(id)sender {
    if([[self.ScanConnectBtn titleForState:UIControlStateNormal] isEqualToString:@"Scan"]) {
        [self.bleRetriver scan];
    } else if ([[self.ScanConnectBtn titleForState:UIControlStateNormal] isEqualToString:@"Connect"]) {
        [self.bleRetriver connectWithUIID:[self.UIIDTextField text]];
    }
}

-(void)retriveDeviceWithUIID:(NSNumber *)UIID {
    [self.devices addObject:UIID];
    [self.DevicesTableView reloadData];
    [self.stopScanningBtn setHidden:YES];
}

- (IBAction)stopScanningPressed:(id)sender {
    [self.bleRetriver stopScanning];
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
