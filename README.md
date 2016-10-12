# Open AdBlock [![Build Status](https://travis-ci.org/saagarjha/OpenAdBlock.svg?branch=master)](https://travis-ci.org/saagarjha/OpenAdBlock) [![license](https://img.shields.io/github/license/saagarjha/OpenAdBlock.svg)](http://github.com/saagarjha/OpenAdBlock) [![Gitter](https://img.shields.io/gitter/room/saagarjha/OpenAdBlock.svg)](https://gitter.im/saagarjha/OpenAdBlock)
Open AdBlock is a free and open source content blocker for iOS that has been written from the ground up to support both 32- and 64-bit devices.

## How does it work?
As you may be aware, Apple blocked the ability to load content blockers for 32-bit devices (those with a A6 chip or older) in a late developer beta of iOS 9. Open AdBlock circumvents this restriction by redirecting Apple's loading checks and making them succeed, using Facebook's excellent [fishhook](https://github.com/facebook/fishhook) library. Once the verification is bypassed, Open AdBlock simply uses private `SafariServices` APIs to load and enable the extension. Unfortunately, this makes it impossible for Open AdBlock to be available on the App Store–if you'd like to try it out, you'll have to build it youself.

## Contributors
A shoutout to those who helped work on Open AdBlock, back when it was released:
 - Justin Leger ([@jusleg](http://github.com/jusleg))  
 - Martin Turek ([@MrSp0ck](http://github.com/MrSp0ck))  
 - Jeremy Gillespie ([@jeremyskateboard](http://github.com/jeremyskateboard))  
 - Nicolas Da Mutten ([@cleverer](http://github.com/cleverer))  
 - Jason Piper ([@Xaositek](http://github.com/Xaositek))  

## TODO: update installation steps
### How to install the app (works for iPhone 5 and 5c!)
Since we haven't released OpenAdBlock to the App Store yet, here's how to install the app at the moment. Keep in mind you will have to make a 3.6 GB download and have about 8GB of free space on your HD.

1. Download Xcode 7 from [here](https://developer.apple.com/xcode/downloads/).
2. Install it (and the Developer Tools).
3. Download the .zip from this repo
4. Open the .zip file and open the OpenAdBlock folder, then open OpenAdBlock.xcodeproj. This will open it in Xcode.
5. Go to Xcode > Preferences. Open the Accounts tab and add your Apple ID (the one you used to sign to be a developer). Close Preferences.
6. On the left side there will be a sidebar with one file called OpenAdBlock. Select it and click on the arrow to the left of it.
7. This will cause a bunch of stuff like Identity, Version, etc. to appear in the centre. Select the Team: Unknown Name [Some garbage here] and change it to your account from the drop down menu. Afterwards click on the “Fix Issue” button.
8. Above it, you will find the Bundle Identifier text field. Change this text to contain your name/nickname instead of “saagarjha” (e.g. if your name is Bob Joe, change it to bobjoe.[whatever was there originally]; therefore making it look like this –> bobjoe.org.OpenAdBlock.OpenAdBlock)
9. In the centre screen on the top left (right above the identity field), there will be a dropdown menu with the app icon and name. Click it and select the Extension build target (It has an "E" next to it) and repeat step 8 (!! Remember to only change the beginning of the text !!) (example –> bobjoe.org.OpenAdBlock.OpenAdBlock.OpenAdBlockextension)
10. Plug in your iPhone, and click the iPhone 6 next to the stop button on the top and select your iOS device (not the model, the name of your device).
11. Click the play button, hit “fix issue” when it pops up, unlock your iPhone.
12. On your iPhone go to Setting > General > Profiles. Scroll down and click on a field with you Apple ID email address and hit "Trust"
13. Now the app is installed on your iPhone, run it and enjoy :)
