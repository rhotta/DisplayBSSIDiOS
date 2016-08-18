//
//  ViewController.m
//  DisplayBSSID
//
//  Created by Ryusuke Hotta on 2016/08/18.
//  Copyright © 2016年 Ryusuke Hotta. All rights reserved.
//
@import SystemConfiguration.CaptiveNetwork;
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self reload:nil];
}

- (IBAction)reload:(id)sender
{
    CFArrayRef myArray = CNCopySupportedInterfaces();
    CFDictionaryRef captiveNetWork = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
    NSDictionary *captiveNetWorkDict = (__bridge NSDictionary *)captiveNetWork;
    NSString *ssid = [captiveNetWorkDict objectForKey:@"SSID"];
    NSString *bssid = [captiveNetWorkDict objectForKey:@"BSSID"];
    _textView.text = [NSString stringWithFormat:@"SSID: %@\nBSSID: %@",ssid,bssid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
