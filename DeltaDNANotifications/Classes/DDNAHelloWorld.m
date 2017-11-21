//
//  DDNAHelloWorld.m
//  DeltaDNANotifications
//
//  Created by David White on 17/11/2017.
//

#import "DDNAHelloWorld.h"
#import "DDNANotificationViewController.h"
#import <UIKit/UIKit.h>

@implementation DDNAHelloWorld

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (void)helloWorld
{
    NSLog(@"Hello World!");
}

+ (void)sequeToFrameworkViewControllerFromViewController:(UIViewController *)caller
{
    NSBundle *podBundle = [NSBundle bundleForClass:[DDNANotificationViewController class]];
    NSURL *bundleURL = [podBundle URLForResource:@"DeltaDNANotifications" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainInterface2" bundle:bundle];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    [caller presentViewController:viewController animated:YES completion:nil];
}

@end
