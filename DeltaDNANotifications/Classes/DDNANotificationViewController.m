//
//  DDNANotificationViewController.m
//  Pods
//
//  Created by David White on 20/11/2017.
//

#import "DDNANotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import "DDNAHelloWorld.h"

@interface DDNANotificationViewController () <UNNotificationContentExtension>

@property IBOutlet UILabel *label;

@end

@implementation DDNANotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSExtensionContext *myExtensionContext = self.extensionContext;
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [DDNAHelloWorld sequeToFrameworkViewControllerFromViewController:self];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.label.text = notification.request.content.body;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
