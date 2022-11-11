import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kron_system_stats/kron_system_stats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _sysStatLoading = {'System Stats': 'Loading...'};
  static const _sysStatError = {'System Stats': 'Loading Failed'};
  static const _unknown = 'Unknown';

  Map<String, String> _systemStats = _sysStatLoading;
  final _kronSystemStatsPlugin = KronSystemStats();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    Map<String, String> systemStats;
    try {
      systemStats =
          await _kronSystemStatsPlugin.getPlatformStats() ?? _sysStatError;
    } on PlatformException {
      systemStats = _sysStatError;
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _systemStats = systemStats;
      _systemStats['KHERSON STATUS'] = '🇺🇦 😉';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('System stats'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: _systemStats.length,
            itemBuilder: (context, index) {
              final rowKey = _systemStats.keys.toList()[index];
              //First head element showing OS version
              if (index == 0) {
                final textStyle = Theme.of(context).textTheme.headline3;
                return SizedBox(
                  height: 60,
                  child: Text(
                    '$rowKey ${_systemStats[rowKey] ?? _unknown}',
                    style: textStyle,
                  ),
                );
              }
              //Other system stats element
              final keyTextStyle = Theme.of(context).textTheme.headline6;
              final contentTextStyle = Theme.of(context).textTheme.bodyLarge;
              final rowColor =
                  (index % 2 == 0) ? Colors.white : Colors.grey.withAlpha(50);
              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: rowColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rowKey,
                      style: keyTextStyle,
                    ),
                    Text(_systemStats[rowKey] ?? _unknown,
                        style: contentTextStyle),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
