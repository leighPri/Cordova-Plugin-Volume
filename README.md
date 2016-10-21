VolumeSlider
============

*Updated for Cordova 3.0+ include 4.0+ compatibility
*Renamed as cordova-plugin-volume
*Add options to show volumeslider only, airplay route selector only or both
*Add option for color to create.  Color can be white or black and sets the default color for the route select button
*Add images for white / black / active airplay icon.  Feel free to customise to your colors

Installation
------------

PhoneGap / Cordova iOS plugin that allows you to add a native volume slider (MPVolumeView) to your app.

Add the plugin much like any other:

### For Cordova >3.0.x:

1. To add this plugin use one of the below: 
	- `cordova plugin add https://github.com/ghenry22/Cordova-Plugin-Volume.git`
2. To remove this plugin use one of the below: 
	- `cordova plugin remove cordova-plugin-volume`
3. To add the custom images for route button
	- `open xcode, go to resources > Images.xcassets`
	- `choose import and select all 3 folders under resources included with this plugin`
	- `if you edit the source images or remove the ios platform you will need to add them again`

### NOTE: The iOS Simulator does not show MPVolumeViews. To see the slider you have to be running on an actual device.

### Example
```javascript
function onDeviceReady()
{
	var volumeSlider = cordova.plugins.volume;
	volumeSlider.createVolume(10,350,300,30, "black"); // origin x, origin y, width, height, color ("black" or "white" only affects airplay route button)
	volumeSlider.showVolume(true, true); // show volume slider, show airplay route button
}
```

... now since this is a native control added more or less on top of your webView, you might have to show and hide it if you navigate away from the _page_ you want the VolumeSlider on:

```javascript
volumeSlider.hideVolumeSlider();
```

... I suggest using some method to get the current size of your display and then using an offset from these values to position the volume bar as this will allow you to maintain a consistent offset from the bottom of the screen, top of the screen etc regardless of the screen size.

## License

The MIT License

Copyright (c) 2011 Tommy-Carlos Williams (github.com/devgeeks)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
