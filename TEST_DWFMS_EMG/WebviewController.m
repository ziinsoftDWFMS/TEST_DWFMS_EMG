//
//  WebviewController.m
//  TEST_DWFMS_EMG
//
//  Created by Chang soonHwang on 2015. 5. 7..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import "WebviewController.h"

@interface WebviewController ()

@end

@implementation WebviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDevice *device = [UIDevice currentDevice];
    NSString* idForVendor = [device.identifierForVendor UUIDString];
    
    NSLog(@">>>>>%@",idForVendor);
    
    NSString *serverUrl = [NSString stringWithFormat:@"http://211.253.9.3:8080/deviceId=%@",idForVendor] ;

    NSURL *url=[NSURL URLWithString:serverUrl];    
    NSURLRequest *requestURL=[NSURLRequest requestWithURL:url];
    [_site loadRequest:requestURL];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
