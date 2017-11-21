//
//  BaseNotificationViewController.m
//  Pods
//
//  Created by David White on 21/11/2017.
//

#import "DDNADebugContentViewController.h"

@interface DDNADebugContentViewController ()

@property (weak, nonatomic) IBOutlet UILabel *interstitialState;
@property (weak, nonatomic) IBOutlet UILabel *rewardedState;


@end

@implementation DDNADebugContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.interstitialState.text = notification.request.content.userInfo[@"interstitial"];
    self.rewardedState.text = notification.request.content.userInfo[@"rewarded"];
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

@end
