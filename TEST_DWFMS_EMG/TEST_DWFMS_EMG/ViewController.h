//
//  ViewController.h
//  TEST_DWFMS_EMG
//
//  Created by 김향기 on 2015. 4. 25..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *locationTxt;

- (IBAction)click:(id)sender;
- (void)retunData:(NSDictionary*)data;

@end

