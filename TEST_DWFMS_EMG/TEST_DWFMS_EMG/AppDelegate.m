//
//  AppDelegate.m
//  TEST_DWFMS_EMG
//
//  Created by 김향기 on 2015. 4. 25..
//  Copyright (c) 2015년 kimhyang. All rights reserved.
//

#import "AppDelegate.h"
#import "WebviewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        NSLog(@"%@",@"등록완료1");
    } else {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        NSLog(@"%@",@"등록완료2");
    }
    
    if(launchOptions)
    {
        application.applicationIconBadgeNumber = 0;
        
        NSDictionary *launchDictionary = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey ];
        NSDictionary *apsDictionary = [launchDictionary valueForKey:@"aps"];
        NSString *message = (NSString *)[apsDictionary valueForKey:(id)@"alert"];
        
        NSString *CONF_MSG            = [launchDictionary valueForKey:@"CONF_MSG"];
        //    NSString *CODE            = [userInfo valueForKey:@"EMC_ID"];
        //    NSString *EMC_ID           = [userInfo valueForKey:@"EMC_MSG"];
        //    NSString *CODE              = [userInfo valueForKey:@"CODE"];
//        NSString *message           = (NSString *)[apsDictionary valueForKey:(id)@"alert"];
        //    NSLog(@"GRP_CD: %@",    GRP_CD);
        //    NSLog(@"EMC_ID: %@",    EMC_ID);
        //    NSLog(@"EMC_MSG: %@",   EMC_MSG);
        NSLog(@"message: %@",      message);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:CONF_MSG delegate:self
                                              cancelButtonTitle:@"취소"
                                              otherButtonTitles:@"확인", nil];
        [alert show];


        
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];


    return YES;
}
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    application.applicationIconBadgeNumber = 0;
    NSDictionary *apsDictionary = [userInfo valueForKey:@"aps"];
    NSString *CONF_MSG            = [userInfo valueForKey:@"CONF_MSG"];
//    NSString *CODE            = [userInfo valueForKey:@"EMC_ID"];
//    NSString *EMC_ID           = [userInfo valueForKey:@"EMC_MSG"];
//    NSString *CODE              = [userInfo valueForKey:@"CODE"];
    NSString *message           = (NSString *)[apsDictionary valueForKey:(id)@"alert"];
//    NSLog(@"GRP_CD: %@",    GRP_CD);
//    NSLog(@"EMC_ID: %@",    EMC_ID);
//    NSLog(@"EMC_MSG: %@",   EMC_MSG);
    NSLog(@"message: %@",      message);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:CONF_MSG delegate:self
                                          cancelButtonTitle:@"취소"
                                          otherButtonTitles:@"확인", nil];
    [alert show];
    
    /*
     if(application.applicationState == UIApplicationStateActive){
     NSDictionary *apsDictionary = [userInfo valueForKey:@"aps"];
     NSString *message = (NSString *)[apsDictionary valueForKey:(id)@"alert"];
     NSLog(@"message: %@", message);
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
     message:message delegate:self
     cancelButtonTitle:@"확인"
     otherButtonTitles:@"전화걸기", nil];
     
     [alert show];
     
     }else if(application.applicationState == UIApplicationStateInactive){
     
     NSDictionary *apsDictionary = [userInfo valueForKey:@"aps"];
     NSString *message = (NSString *)[apsDictionary valueForKey:(id)@"alert"];
     NSLog(@"message: %@", message);
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
     message:message delegate:self
     cancelButtonTitle:@"취소"
     otherButtonTitles:@"전화걸기", nil];
     [alert show];
     //전화걸기
     
     }else{
     
     NSDictionary *apsDictionary = [userInfo valueForKey:@"aps"];
     NSString *message = (NSString *)[apsDictionary valueForKey:(id)@"alert"];
     NSLog(@"message: %@", message);
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
     message:message delegate:self
     cancelButtonTitle:@"취소"
     otherButtonTitles:@"전화걸기", nil];
     [alert show];
     
     NSLog(@"message: %@", @"fail state");
     
     }*/
    NSInteger applicationIconBadgeNumber = [application applicationIconBadgeNumber];
    
    [application setApplicationIconBadgeNumber:applicationIconBadgeNumber];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    NSMutableString *deviceId = [NSMutableString string];
    const unsigned char* ptr = (const unsigned char*) [deviceToken bytes];
    
    for(int i = 0 ; i < 32 ; i++)
    {
        [deviceId appendFormat:@"%02x", ptr[i]];
    }
    
    NSLog(@"APNS Device Token: %@", deviceId);
    // deviceTok = deviceId;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.deviceToken = deviceId;
    
    NSLog(@"APNS Device Tok: %@", app.deviceToken);
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
