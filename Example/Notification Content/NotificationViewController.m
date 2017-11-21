//
//  NotificationViewController.m
//  Notification Content
//
//  Created by David White on 20/11/2017.
//  Copyright © 2017 dwxw. All rights reserved.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import <DeltaDNANotifications/DDNAHelloWorld.h>

@interface NotificationViewController () <UNNotificationContentExtension>

@property IBOutlet UILabel *label;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
}

// Add this in to launch our custom storyboard
- (void)viewDidAppear:(BOOL)animated
{
    [DDNAHelloWorld sequeToFrameworkViewControllerFromViewController:self];
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.label.text = notification.request.content.body;
}

@end
