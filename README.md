# MobileDev CSCI 402 Repo
# Pre-work - *Checkout App*

**Checkout App** is a tip calculator application for iOS.

Submitted by: **Ronte' Parker Jr.**

Time spent: **2** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [x] User can toggle whether they want to enter a custom tip amount
* [x] Keyboard Type is a numpad that has numbers 0-9 and a decimal point only

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![checkout app](appwalkthrough.gif)

GIF created with [EZGif](http://ezgif.com/).

## Notes

While, creating this app, I struggled with figuring out how to toggle using the segmented tip control vs the text field tip input. After researching information on this, I was able to find a way to implement this. I, also, had to research float point precision to understand why sometimes rounded values weren't accurate.

## License

    Copyright [2022] [Ronte' Parker Jr.]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
