Smart AdServer - AppNexus SDK Adapter for iOS
=============================================

Introduction
------------
The _Smart Display SDK_ version 7.0.0 and more can be used with _AppNexus SDK_ (tested on version 4.12.0) and more through the _Ad Adapter_ classes provided in this repository.

Supported ad formats are _banners_ and _interstitials_.

Setup
-----
1) Install the _AppNexus SDK_ according to the official documentation.

2) Install the _Smart Display SDK_ by adding the _pod_ ```Smart-Display-SDK``` to you app _Podfile_ (more info in [the documentation](http://documentation.smartadserver.com/displaySDK/ios/gettingstarted.html)).

3) Checkout this repository and copy the _Ad Adapter classes_ you need into your Xcode Project:

* ```ANAdAdapterBannerSmartAd``` for banner ads.
* ```ANAdAdapterInterstitialSmartAd``` for interstitial ads.
* ```ANAdAdapterSmartAdBase``` in any cases.

4) Edit the ```ANAdAdapterSmartAdBase.h``` header and replace the default base url with your dedicated base url.

5) You can now create a mediated ad in _AppNexus_ backend.

More infos
----------
You can find more informations about the _Smart Display SDK_ and _AppNexus Ad Adapter classes_ in the official documentation: http://documentation.smartadserver.com/displaySDK
