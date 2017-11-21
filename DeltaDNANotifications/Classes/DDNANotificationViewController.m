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
#import "BaseNotificationViewController.h"

@interface DDNANotificationViewController () <UNNotificationContentExtension>

@property IBOutlet UILabel *label;

@property (nonatomic, strong) BaseNotificationViewController *contentViewController;

@end

@implementation DDNANotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // TODO: we could make this configurable for different notifications
    // How would is return BaseNotificationViewController - or does that matter?
    UIViewController *contentViewController = [self viewControllerForStoryboardWithName:@"MainInterface2"];
    if (contentViewController != nil) {
        [self displayContentViewController:(BaseNotificationViewController *)contentViewController];
    }
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

- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIViewController *)viewControllerForStoryboardWithName:(NSString *)name
{
    NSBundle *podBundle = [NSBundle bundleForClass:[DDNANotificationViewController class]];
    NSURL *bundleURL = [podBundle URLForResource:@"DeltaDNANotifications" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainInterface2" bundle:bundle];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    return viewController;
}

- (void)displayContentViewController:(BaseNotificationViewController *)viewController
{
    if (self.contentViewController != nil) return;
    
    [self addChildViewController:viewController];
    viewController.view.frame = self.view.frame;
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    self.contentViewController = viewController;
}

@end
