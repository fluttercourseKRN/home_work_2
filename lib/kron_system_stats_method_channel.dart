import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kron_system_stats_platform_interface.dart';

class MethodChannelKronSystemStats extends KronSystemStatsPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('kron_system_stats');

  @override
  Future<Map<String, String>?> getPlatformStats() async {
    //
    // Dictionaries on iOS are not ordered (HashMap),
    // we need to wrap them in List,
    // otherwise result will be returned in random order
    //
    final stats = await methodChannel.invokeListMethod('getPlatformStats');
    return stats != null
        ? {for (var element in stats) element.keys.first: element.values.first}
        : null;
  }
}
