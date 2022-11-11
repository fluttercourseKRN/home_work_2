import 'kron_system_stats_platform_interface.dart';

class KronSystemStats {
  Future<Map<String, String>?> getPlatformStats() {
    return KronSystemStatsPlatform.instance.getPlatformStats();
  }
}
