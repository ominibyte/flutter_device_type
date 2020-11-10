# flutter_device_type

Determine the type of handheld device on Flutter. Like if the device is a Tablet or is iPhoneX or later or has notch.

## Usage

```dart
//Get the physical device size
print( Device.size );
//Quick methods to access the physical device width and height
print("Device Width: ${Device.width}, Device Height: ${Device.height}");

//To get the actual screen size (Which is same as what MediaQuery gives)
print( Device.screenSize );
//Quick methods to access the screen width and height
print("Device Width: ${Device.screenWidth}, Device Height: ${Device.screenHeight}");

//Check if device is tablet
if( Device.get().isTablet ){
    //do something large
}

//Check if device is at least an iphone x
// NOTE: This detects up to Iphone 12 pro max
if( Device.get().isIphoneX ){
    //Do some notch business
}

// For a generic notch test use
if( Device.get().hasNotch ){
    //Do some notch business
}

//Other utility methods
print( Device.get().isPhone );
print( Device.get().isAndroid );
print( Device.get().isIos );

//So to check for iPad for instance
if( Device.get().isIos && Device.get().isTablet ){
    //make the font larger :)
}
```

`Device.get()` <s>will return only one instance so not need to save it except for brevity</s>

You should try not to store a reference for `Device.get()` because it now responds to changes and orientations
