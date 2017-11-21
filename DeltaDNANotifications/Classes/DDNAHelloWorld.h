//
//  DDNAHelloWorld.h
//  DeltaDNANotifications
//
//  Created by David White on 17/11/2017.
//

#import <Foundation/Foundation.h>

@interface DDNAHelloWorld : NSObject

+ (instancetype)sharedInstance;

- (void)helloWorld;

+ (void)sequeToFrameworkViewControllerFromViewController:(UIViewController *)caller;

@end
