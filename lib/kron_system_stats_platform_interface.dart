import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kron_system_stats_method_channel.dart';

abstract class KronSystemStatsPlatform extends PlatformInterface {
  KronSystemStatsPlatform() : super(token: _token);

  static final Object _token = Object();

  static KronSystemStatsPlatform _instance = MethodChannelKronSystemStats();
  static KronSystemStatsPlatform get instance => _instance;

  static set instance(KronSystemStatsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<String, String>?> getPlatformStats() {
    throw UnimplementedError('getPlatformStats() has not been implemented.');
  }
}
