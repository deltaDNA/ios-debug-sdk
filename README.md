![deltaDNA logo](https://deltadna.com/wp-content/uploads/2015/06/deltadna_www@1x.png)

# deltaDNA Debug iOS SDK

[![Build Status](https://travis-ci.org/deltaDNA/ios-debug-sdk.svg)](https://travis-ci.org/deltaDNA/ios-debug-sdk)

The deltaDNA Debug SDK works with our SmartAds sdk to expose the behaviour of the ad networks.  It uses [User Notifications](https://developer.apple.com/documentation/usernotifications) to report which ad network is showing in your app in an unobtrusive manner.  We recommend only using this framework in development builds.  You will also need to provide some boilder plate code in your App's AppDelegate to handle the notifications.

The framework works in conjunction with a Notification Content Extension, which is available from iOS10 onwards.  These instructions also assume you're using CocoaPods to install our SDKs.

## Project Setup

    1. Add a Notification Content Extension target to your Xcode project.
    2. Add the new target to your Podfile, and add a dependency to DeltaDNADebug to it.
    3. Run 'pod install'
    
### Example Podfile

```ruby
source 'https://github.com/deltaDNA/CocoaPods.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

target 'MyAppThatUsesSmartAds' do
    pod 'DeltaDNAAds', '~> 1.7.0'
end

target 'NotificationContentExtension' do
    pod 'DeltaDNADebug', '~> 1.0.0'
end
```
    
## Changes to the Notification Extension Target
    
    4. Change the default NotificationViewController to inherit from DDNADebugNotificationViewController.
    5. Remove the view and it's children from MainInterface.storboard.
    6. Change Info.plist -> NSExtension -> NSExtensionAttributes -> UNNotificationExtensionCategory to the name of the debug UserNotification: *com.deltadna.diagnosticCategory*.

### Changes to the AppDelegate in the App

The following instructions assume you're not already using User Notifications, if so you'll need to merge the changes into your own notification handling.

    5. Make the AppDelegate extend the UNUserNotificationCenterDelegate.
    6. Add the following code to register the user notifications we will use.
    
```objective-c
- (void)setupPushNotifications
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;

    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {

            UNNotificationAction *stopAction = [UNNotificationAction actionWithIdentifier:@"com.deltadna.stopAction" title:@"Stop Notifications" options:UNNotificationActionOptionDestructive];

            UNNotificationCategory *diagnosticCategory = [UNNotificationCategory categoryWithIdentifier:@"com.deltadna.diagnosticCategory" actions:@[stopAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];

            UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            [center setNotificationCategories:[NSSet setWithObjects:diagnosticCategory, nil]];
        }
    }];
}
```
    7. Call -setupPushNotifications from the App entry point -application:didFinishLaunchingWithOptions:
    8. Add the following code which implements the UNUserNotificationCenterDelegate.
    
```objective-c
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    // Allow diagnostic notifications to appear when in the foreground.
    if ([notification.request.content.categoryIdentifier isEqualToString:@"com.deltadna.diagnosticCategory"]) {
        completionHandler(UNNotificationPresentationOptionAlert);
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
    if ([response.actionIdentifier isEqualToString:@"com.deltadna.stopAction"]) {
        [[DDNADebugListener sharedInstance] disableNotifications];
    }
    // Must call the completion handler.
    completionHandler();
}
```

## Example

An example is included which shows all the changes that need to be made.  To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

The sources are available under the Apache 2.0 license.
