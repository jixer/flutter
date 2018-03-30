#import "BatteryPlugin.h"

@implementation BatteryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.flutter.io/battery"
            binaryMessenger:[registrar messenger]];
  BatteryPlugin* instance = [[BatteryPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if([@"getBatteryLevel" isEqualToString:call.method]) {
    int batteryLevel = [self getBatteryLevel];
    if (batteryLevel != -1) {
      result(@(batteryLevel));
    } else {
      result([FlutterError errorWithCode:@"UNAVAILABLE"
                           message:@"Battery info unavailable"
                           details:nil]);
    }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

-(int)getBatteryLevel {
  UIDevice* device = UIDevice.currentDevice;
  device.batteryMonitoringEnabled = YES;
  if (device.batteryState == UIDeviceBatteryStateUnknown) {
    return -1;
  } else {
    return ((int)(device.batteryLevel * 100));
  }
}

@end
