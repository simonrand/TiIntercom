# TiIntercom Module

## Description

This module is a lightweight wrapper around the Intercom iOS SDK (https://github.com/intercom/intercom-ios/) providing access to all currently implemented functionality (including 2-way messaging) in Titanium projects.

Compatible with iPhone/iPod Touch and iPad. Requires Titanium SDK version 3.1+.

The module is licensed under the MIT license.

## Installing and (optionally) building the TiIntercom Module ##

### INSTALL ###
You can either copy the module package (ti.intercom-iphone-0.2.zip) to `$HOME/Library/Application\ Support/Titanium` and reference the module in your application (the Titanium SDK will automatically unzip the file in the right place), or manually launch the command:

     unzip -uo ti.intercom-iphone-0.2.zip -d $HOME/Library/Application\ Support/Titanium/

**NOTE: if your Titanium sdk resides in the root `/Library/Application Support/Titanium/` directory, change the above command accordingly**

## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:

    <modules>
        <module version="0.2" platform="iphone">ti.intercom</module>
    </modules>

and add this line in your app.js file:

    var TiIntercom = require('ti.intercom');

To use this module, at the very least you will need to provide your Intercom API key and App Id at the earliest point via the `initialize()` method:

    TiIntercom.initialize({
        api_key: '[YOUR API KEY]',
        app_id: '[YOUR APP ID]'
        loggingEnabled: true, // OPTIONAL: turn on logging at initialize (you can do this later also, see example/app.js)
        requiresDisplayOffset: true // OPTIONAL: turn on display offset at initialize (you can do this later also, see example/app.js)
    });

The module provides a relative mirror of the public APIs provided by the Intercom iOS SDK (http://docs.intercom.io/intercom-ios/Classes/Intercom.html - **v0.2 of TiIntercom uses the Intercom SDK v1.1.4**), with the addition of one further API:

    TiIntercom.sessionIsActive()

Which will return whether a specified user session is active.

See `app.js` in the `example` folder for a full example.

### BUILD (optional) ###

First, you must have your XCode and Titanium Mobile SDKs in place, and read the first few pages of the [iOS Module Developer Guide](http://docs.appcelerator.com/titanium/3.0/#!/guide/iOS_Module_Development_Guide) from Appcelerator.

The build process can be launched using the build.py script that you find in the module's code root directory.

As a result, the ti.intercom-iphone-0.2.zip file will be generated.

**NOTE: if your Titanium sdk resides in the root `/Library/Application Support/Titanium/` directory, you need to change the value of the `TITANIUM SDK` variable in `titanium.xcconfig`**

## Changelog

0.2 (2013-10-7)

- Updated to v1.1.4 of the Intercom iOS SDK
- Added support for loggingEnabled and requiresDisplayOffset
- Improved logging support (module respects value set for SDK)

0.1:

 - Initial release, based on v1.1 of the Intercom iOS SDK

## Author

Simon Rand: https://github.com/simonrand ([@simonrand](https://twitter.com/simonrand))

## License

    Copyright (c) 2013 Simon Rand

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.