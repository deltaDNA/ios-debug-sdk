//
// Copyright (c) 2017 deltaDNA Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
