/*   Copyright 2016 APPNEXUS INC
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "ANAdAdapterInterstitialSmartAd.h"

@interface ANAdAdapterInterstitialSmartAd () <SASInterstitialManagerDelegate>
    
@property (nonatomic, strong) SASInterstitialManager *interstitialManager;

@end

@implementation ANAdAdapterInterstitialSmartAd

@synthesize delegate;

- (void)requestInterstitialAdWithParameter:(NSString *)parameterString
                                  adUnitId:(NSString *)idString
                       targetingParameters:(ANTargetingParameters *)targetingParameters {
    
    SASAdPlacement *placement = [self parseAdUnitParameters:idString targetingParameters:targetingParameters];
    
    if (placement != nil) {
        self.interstitialManager = [[SASInterstitialManager alloc] initWithPlacement:placement delegate:self];
        [self.interstitialManager load];
    } else {
        [self.delegate didFailToLoadAd:ANAdResponseMediatedSDKUnavailable];
    }
}

- (void)presentFromViewController:(UIViewController *)viewController {
    [self.interstitialManager showFromViewController:viewController];
}

- (BOOL)isReady {
    return self.interstitialManager.adStatus == SASAdStatusReady;
}

#pragma mark - Interstitial Manager delegate

- (void)interstitialManager:(SASInterstitialManager *)manager didLoadAd:(SASAd *)ad {
    [self.delegate didLoadInterstitialAd:self];
}

- (void)interstitialManager:(SASInterstitialManager *)manager didFailToLoadWithError:(NSError *)error {
    [self.delegate didFailToLoadAd:ANAdResponseUnableToFill];
}

- (void)interstitialManager:(SASInterstitialManager *)manager didFailToShowWithError:(NSError *)error {
    [self.delegate failedToDisplayAd];
}

- (void)interstitialManager:(SASInterstitialManager *)manager didAppearFromViewController:(UIViewController *)viewController {
    [self.delegate didPresentAd];
}

- (void)interstitialManager:(SASInterstitialManager *)manager didDisappearFromViewController:(UIViewController *)viewController {
    [self.delegate didCloseAd];
}

- (BOOL)interstitialManager:(SASInterstitialManager *)manager shouldHandleURL:(NSURL *)URL {
    [self.delegate adWasClicked];
    return YES;
}

@end
