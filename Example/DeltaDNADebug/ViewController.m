//
//  DDNAViewController.m
//  DeltaDNANotifications
//
//  Created by dwxw on 11/17/2017.
//  Copyright (c) 2017 dwxw. All rights reserved.
//

#import "ViewController.h"
#import <DeltaDNA/DeltaDNA.h>
#import <DeltaDNAAds/DeltaDNAAds.h>

@interface ViewController ()

- (IBAction)showInterstitial:(id)sender;
- (IBAction)showRewarded:(id)sender;
- (IBAction)newSession:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [DDNASDK setLogLevel:DDNALogLevelDebug];
    [DDNASDK sharedInstance].clientVersion = @"0.1.0";
    [DDNASDK sharedInstance].hashSecret = @"KmMBBcNwStLJaq6KsEBxXc6HY3A4bhGw";
    
    [[DDNASDK sharedInstance] startWithEnvironmentKey:@"55822530117170763508653519413932"
                                           collectURL:@"https://collect2010stst.deltadna.net/collect/api"
                                            engageURL:@"https://engage2010stst.deltadna.net"];
    
    [[DDNASmartAds sharedInstance] registerForAds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showInterstitial:(id)sender {
    DDNAInterstitialAd *interstitialAd = [DDNAInterstitialAd interstitialAdWithDelegate:nil];
    [interstitialAd showFromRootViewController:self];
}

- (IBAction)showRewarded:(id)sender {
    DDNARewardedAd *rewardedAd = [DDNARewardedAd rewardedAdWithDelegate:nil];
    [rewardedAd showFromRootViewController:self];
}

- (IBAction)newSession:(id)sender {
    [[DDNASDK sharedInstance] newSession];
}
@end
