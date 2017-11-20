//
//  DDNAViewController.m
//  DeltaDNANotifications
//
//  Created by dwxw on 11/17/2017.
//  Copyright (c) 2017 dwxw. All rights reserved.
//

#import "DDNAViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface DDNAViewController ()

- (IBAction)sendDiagnostic:(id)sender;


@end

@implementation DDNAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendDiagnostic:(id)sender {
    // Launch a notification here for a quick test!
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.categoryIdentifier = @"com.deltadna.diagnosticCategory";
    content.title = [NSString localizedUserNotificationStringForKey:@"deltaDNA SDK" arguments:nil];
    content.body = @"test message!";
    content.userInfo = @{@"userId": @"123"};
    
    // When to launch the notification
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:1 repeats:NO];
    
    // Create the request object to launch the notification.
    UNNotificationRequest* request = [UNNotificationRequest
                                      requestWithIdentifier:@"deltaDNA-SDK" content:content trigger:trigger];
    
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:nil];
}
@end
