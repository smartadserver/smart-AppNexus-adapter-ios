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

#import "ANCustomAdapter.h"
#import <CoreLocation/CoreLocation.h>
#import <SASDisplayKit/SASDisplayKit.h>

#pragma message "PUT YOUR BASE URL HERE!"
#define SMARTAD_BASEURL     @"https://mobile.smartadserver.com"

#define SMARTAD_SITEID      @"site_id"
#define SMARTAD_FORMATID    @"format_id"
#define SMARTAD_PAGEID      @"page_id"

@interface ANAdAdapterSmartAdBase : NSObject <ANCustomAdapter>

- (SASAdPlacement *)parseAdUnitParameters:(NSString *)adUnitString targetingParameters:(ANTargetingParameters *)targetingParameters;

@end
