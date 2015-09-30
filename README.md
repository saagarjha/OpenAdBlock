# OpenAdblock 

<div align="center"><img src ="http://i.imgur.com/4sa7h7D.png width="256" heigth="256"" /></div>

<p align="center">
<a href="http://opensource.org/licenses/Apache-2.0">
<img src="https://img.shields.io/hexpm/l/plug.svg" alt="npm version">
</a>
<a href="#">
<img src="https://img.shields.io/badge/iOS-9-yellow.svg" alt="build status">
</a>
<a href="#">
<img src="https://img.shields.io/badge/iTunes%20Connect-Awaiting%20iOS%209%20launch-green.svg" alt="dependency status">
</a>
</p>
This is the repo for [Open Adblock](http://openadblock.org) for iOS. It is a simple app that uses the new feature in iOS 9 called content blocking in Safari. We want to build the best adblock. In order to do so, it must be free and open source. Any help would be appreciated.
If you wish to join the chat room, you can so here [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/saagarjha/OpenAdblock?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

--------------
### To-Do:
 - Improve GUI and fix bugs
 - Improve README
 
---------

### Contributors:
 - Justin Leger ([@jusleg](http://github.com/jusleg))
 - Saagar Jha ([@saagarjha](http://github.com/saagarjha))  
 - Martin Turek ([@MrSp0ck](http://github.com/MrSp0ck))
 - Jeremy Gillespie ([@jeremyskateboard](http://github.com/jeremyskateboard))
 - Nicolas Da Mutten ([@cleverer](http://github.com/cleverer))
 - Jason Piper ([@Xaositek](http://github.com/Xaositek))

-----------

### How to install the app (works for iPhone 5 and 5c!)
Since we haven't released OpenAdBlock to the App Store yet, here's how to install the app at the moment. Keep in mind you will have to make a 3.6 GB download and have about 8GB of free space on your HD.

1. Download Xcode 7 from [here](https://developer.apple.com/xcode/downloads/).
2. Install it (and the Developer Tools).
3. Download the .zip from this repo
4. Open the .zip file and open the OpenAdblock folder, then open OpenAdblock.xcodeproj. This will open it in Xcode.
5. Go to Xcode > Preferences. Open the Accounts tab and add your Apple ID (the one you used to sign to be a developer). Close Preferences.
6. On the left side there will be a sidebar with one file called OpenAdblock. Select it and click on the arrow to the left of it.
7. This will cause a bunch of stuff like Identity, Version, etc. to appear in the centre. Select the Team: Unknown Name [Some garbage here] and change it to your account from the drop down menu. Afterwards click on the “Fix Issue” button.
8. Above it, you will find the Bundle Identifier text field. Change this text to contain your name/nickname instead of “saagarjha” (e.g. if your name is Bob Joe, change it to bobjoe.[whatever was there originally]; therefore making it look like this –> bobjoe.org.openadblock.openadblock)
9. In the centre screen on the top left (right above the identity field), there will be a dropdown menu with the app icon and name. Click it and select the Extension build target (It has an "E" next to it) and repeat step 8 (!! Remember to only change the beginning of the text !!) (example –> bobjoe.org.openadblock.openadblock.openadblockextension)
10. Plug in your iPhone, and click the iPhone 6 next to the stop button on the top and select your iOS device (not the model, the name of your device).
11. Click the play button, hit “fix issue” when it pops up, unlock your iPhone.
12. On your iPhone go to Setting > General > Profiles. Scroll down and click on a field with you Apple ID email address and hit "Trust"
13. Now the app is installed on your iPhone, run it and enjoy :)
