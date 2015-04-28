//
//  ViewController.m
//  TEST_DWFMS_EMG
//
//  Created by 김향기 on 2015. 4. 25..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import "ViewController.h"
#import "CAllServer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CAllServer* res = [CAllServer alloc];
    NSMutableDictionary* param = [[NSMutableDictionary alloc] init];
    UIDevice *device = [UIDevice currentDevice];
    NSString* idForVendor = [device.identifierForVendor UUIDString];
    [param setObject:idForVendor forKey:@"hp"];
    [param setValue:@"S" forKey:@"gubun"];
    
    
    NSString* str = [res stringWithUrl:@"getEmcUserInfo.do" VAL:param];
    
       NSLog(@" ,login?? %@",str);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)click:(id)sender {
    
    
    CAllServer* res = [CAllServer alloc];
    NSMutableDictionary* param = [[NSMutableDictionary alloc] init];
    [param setObject:@"gg" forKey:@"gg"];
    [param setValue:@"01026533" forKey:@"phone"];
    [param setValue:@"한글" forKey:@"hangle"];
    
    NSString* str = [res stringWithUrl:@"callTest.do" VAL:param];
    
    NSLog(@" %@",str);
    //[res test:@"callTest.do"];
}





@end
