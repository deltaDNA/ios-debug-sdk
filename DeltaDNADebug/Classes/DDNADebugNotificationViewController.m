//
//  DDNANotificationViewController.m
//  Pods
//
//  Created by David White on 20/11/2017.
//

#import "DDNADebugNotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import "DDNADebugContentViewController.h"

@interface DDNADebugNotificationViewController () <UNNotificationContentExtension>

@property (nonatomic, strong) DDNADebugContentViewController *contentViewController;

@end

@implementation DDNADebugNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // TODO: we could make this configurable for different notifications
    // How would is return BaseNotificationViewController - or does that matter?
    UIViewController *contentViewController = [self viewControllerForStoryboardWithName:@"DebugInterface"];
    if (contentViewController != nil) {
        [self displayContentViewController:(DDNADebugContentViewController *)contentViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    [self.contentViewController didReceiveNotification:notification];
}

- (UIViewController *)viewControllerForStoryboardWithName:(NSString *)name
{
    NSBundle *podBundle = [NSBundle bundleForClass:[DDNADebugNotificationViewController class]];
    NSURL *bundleURL = [podBundle URLForResource: @"DeltaDNADebug" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:bundle];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    return viewController;
}

- (void)displayContentViewController:(DDNADebugContentViewController *)viewController
{
    if (self.contentViewController != nil) return;
    
    [self addChildViewController:viewController];
    //viewController.view.frame = self.view.frame;
    self.view.frame = viewController.view.frame;
    self.preferredContentSize = viewController.preferredContentSize;
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    self.contentViewController = viewController;
}

@end
