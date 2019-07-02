#import "FlutteremPlugin.h"

@implementation FlutteremPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutterem"
            binaryMessenger:[registrar messenger]];
  FlutteremPlugin* instance = [[FlutteremPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getDisplaySize" isEqualToString:call.method]) {
    CGSize size = [UIScreen mainScreen].bounds.size;
    result(@{@"width": @(size.width), @"height": @(size.height)});
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
