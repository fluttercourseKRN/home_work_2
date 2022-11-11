import Flutter
import UIKit

public class SwiftKronSystemStatsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kron_system_stats", binaryMessenger: registrar.messenger())
    let instance = SwiftKronSystemStatsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result([
    ["iOS ":UIDevice.current.systemVersion],
    ["SYSTEM NAME":UIDevice.current.systemName],
    ["NAME":UIDevice.current.name],
    ["MODEL":UIDevice.current.model],
    ["BATTERY LEVEL": "\(UIDevice.current.batteryLevel)"]
    ])
  }
}
