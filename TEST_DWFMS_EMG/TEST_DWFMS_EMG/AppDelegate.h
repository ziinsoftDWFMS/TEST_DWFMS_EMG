//
//  AppDelegate.h
//  TEST_DWFMS_EMG
//
//  Created by 김향기 on 2015. 4. 25..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebviewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *deviceToken;
    WebviewController *viewController;
    UINavigationController* _navigationController;
}
@property (nonatomic, strong) NSString *deviceToken;

@property (strong, nonatomic) UIWindow *window;

@end

