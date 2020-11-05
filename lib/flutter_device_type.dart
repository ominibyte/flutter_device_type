library flutter_device_type;

import 'dart:io';
import 'dart:ui' as ui;
import 'dart:math' as Math;

class Device {
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static double width = size.width;
  static double height = size.height;
  static double screenWidth = width / devicePixelRatio;
  static double screenHeight = height / devicePixelRatio;
  static ui.Size screenSize = new ui.Size(screenWidth, screenHeight);
  final bool isTablet, isPhone, isIos, isAndroid, isIphoneX, hasNotch;
  static Device _device;
  static Function onMetricsChange;

  Device(
      {this.isTablet,
        this.isPhone,
        this.isIos,
        this.isAndroid,
        this.isIphoneX,
        this.hasNotch});

  factory Device.get() {
    if (_device != null) return _device;

    if( onMetricsChange == null ) {
      onMetricsChange = ui.window.onMetricsChanged;
      ui.window.onMetricsChanged = () {
        _device = null;
        onMetricsChange();
      };
    }

    bool isTablet;
    bool isPhone;
    bool isIos = Platform.isIOS;
    bool isAndroid = Platform.isAndroid;
    bool isIphoneX = false;
    bool hasNotch = false;

    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    }
    else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    }
    else {
      isTablet = false;
      isPhone = true;
    }

    // Recalculate for Android Tablet using device inches
    if( isAndroid ){
      final diagonalSizeInches = (Math.sqrt(Math.pow(screenWidth, 2) + Math.pow(screenHeight, 2))) / _ppi;
      //print(diagonalSizeInches);
      if( diagonalSizeInches >= 7 ){
        isTablet = true;
        isPhone = false;
      }
      else{
        isTablet = false;
        isPhone = true;
      }
    }

    if (isIos &&
        (screenHeight == 812 ||
            screenWidth == 812 ||
            screenHeight == 896 ||
            screenWidth == 896)) {
      isIphoneX = true;
      hasNotch = true;
    }

    if( _hasTopOrBottomPadding() )
      hasNotch = true;

    return _device = new Device(
        isTablet: isTablet,
        isPhone: isPhone,
        isAndroid: isAndroid,
        isIos: isIos,
        isIphoneX: isIphoneX,
        hasNotch: hasNotch);
  }

  static int get _ppi => Platform.isAndroid ? 160 : Platform.isIOS ? 150 : 96;

  static bool _hasTopOrBottomPadding(){
    final padding = ui.window.viewPadding;
    //print(padding);
    return padding.top > 0 || padding.bottom > 0;
  }
}
