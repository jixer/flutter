import 'dart:async';

import 'package:flutter/services.dart';

class Battery {
    factory Battery() {
        if (_instance == null) {
            final MethodChannel methodChannel = const MethodChannel('plugins.flutter.io/battery');

            _instance = new Battery.private(methodChannel);
        }

        return _instance;
    }

    Battery.private(this._methodChannel);

    static Battery _instance;

    final MethodChannel _methodChannel;

    // Returns the current battery level in percent
    Future<int> get batteryLevel => _methodChannel.invokeMethod('getBatteryLevel')
                                                  .then<int>((dynamic result) => result);
}
