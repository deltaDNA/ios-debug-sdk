//
//  DDNAHelloWorld.m
//  DeltaDNANotifications
//
//  Created by David White on 17/11/2017.
//

#import "DDNAHelloWorld.h"

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

@end
