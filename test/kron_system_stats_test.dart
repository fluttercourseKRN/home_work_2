// import 'package:flutter_test/flutter_test.dart';
// import 'package:kron_system_stats/kron_system_stats.dart';
// import 'package:kron_system_stats/kron_system_stats_platform_interface.dart';
// import 'package:kron_system_stats/kron_system_stats_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockKronSystemStatsPlatform
//     with MockPlatformInterfaceMixin
//     implements KronSystemStatsPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final KronSystemStatsPlatform initialPlatform = KronSystemStatsPlatform.instance;
//
//   test('$MethodChannelKronSystemStats is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelKronSystemStats>());
//   });
//
//   test('getPlatformVersion', () async {
//     KronSystemStats kronSystemStatsPlugin = KronSystemStats();
//     MockKronSystemStatsPlatform fakePlatform = MockKronSystemStatsPlatform();
//     KronSystemStatsPlatform.instance = fakePlatform;
//
//     expect(await kronSystemStatsPlugin.getPlatformVersion(), '42');
//   });
// }
