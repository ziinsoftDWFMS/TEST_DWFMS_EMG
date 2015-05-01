//
//  ViewController.m
//  TEST_DWFMS_EMG
//
//  Created by 김향기 on 2015. 4. 25..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import "ViewController.h"
#import "CAllServer.h"
#import "IdentViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIDevice *device = [UIDevice currentDevice];
   NSString* idForVendor = [device.identifierForVendor UUIDString];
    
     NSLog(@">>>>>%@",idForVendor);
      //서버에서 결과 리턴받기
       CAllServer* res = [CAllServer alloc];
    
    NSMutableDictionary* param = [[NSMutableDictionary alloc] init];
    
    //[param setValue:@"" forKey:@"hp"];
    
    [param setValue:@"S" forKey:@"gubun"];
    
    [param setObject:idForVendor forKey:@"deviceId"];
    
    //deviceId
    
    //R 수신
    
    NSString* str = [res stringWithUrl:@"getEmcUserInfo.do" VAL:param];
    
    //regEmcAppInstInfo.do
    
    //
    
    
    
    NSLog(@" ,login?? %@",str);
    
    
    
    
    
    if([str  isEqual: @"{}"]){
        
        
        
        // [tempViewCon.view setBackgroundColor:[UIColor whiteColor]];
        
        
        
        // [[self navigationController] pushViewController:tempViewCon animated: YES];
        
        
        
        NSLog(@">>31231>>>1234%@",idForVendor);
        
        
        
        // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"  bundle:[NSBundle mainBundle]];
        
        
        
        //IdentViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
        
        // [self presentModalViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"IdentView"] animated:YES];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *identViewController = [storyboard instantiateViewControllerWithIdentifier:@"IdentViewController"];
        
        self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
        
        identViewController.view.alpha = 0;
        [UIView animateWithDuration:0.5 animations:^{
            identViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            [self presentModalViewController:identViewController animated:NO];
        }];

        
    }else{
        
        
        
        
        
        NSLog(@">>4566>>>1234%@",idForVendor);
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)click:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    NSString* idForVendor = [device.identifierForVendor UUIDString];
    
    CAllServer* res = [CAllServer alloc];
    NSMutableDictionary* param = [[NSMutableDictionary alloc] init];
    [param setObject:@"EV01" forKey:@"code"];
    [param setObject:idForVendor forKey:@"deviceId"];
    [param setValue:self.locationTxt.text forKey:@"location"];
    
    NSString* str = [res stringWithUrl:@"emcInfoPush.do" VAL:param];
    
    NSLog(@" %@",str);
    //[res test:@"callTest.do"];
}





@end
