//
//  BaseNotificationViewController.h
//  Pods
//
//  Created by David White on 21/11/2017.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface DDNADebugContentViewController : UIViewController

- (void)didReceiveNotification:(UNNotification *)notification;

@end
