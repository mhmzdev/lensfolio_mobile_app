// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'utils.dart' as utils;

const List<String> desktopFilters = ['linux', 'windows', 'macos'];

void main(List<String> args) async {
  final result =
      await Process.run(
        'flutter',
        ['devices'],
        runInShell: Platform.isWindows,
      ).catchError((err) {
        print(err.toString());
        return err;
      });
  final List<String> raw = result.stdout.split('\n');
  final splitter = Platform.isWindows ? 'â€¢' : '•';

  final filteredDevices = raw
      .map((String unparsed) => unparsed.split(splitter))
      .toList()
      .where((subList) => subList.length > 1);

  // Create both stage and prod configurations for each device
  final allConfigurations = <Map<String, dynamic>>[];

  for (final array in filteredDevices) {
    final name = array[0].trim();
    final deviceId = array[1].trim();

    // Create stage configuration
    final stageConfig = <String, dynamic>{
      'name': '$name (stage)',
      'deviceId': deviceId,
      'type': 'dart',
      'request': 'launch',
      'program': 'lib/main.dart',
      'args': ['--flavor', 'stage'],
    };
    if (desktopFilters.contains(deviceId)) {
      stageConfig['args'] = [
        ...stageConfig['args'],
        '-t',
        'lib/main.desktop.dart',
      ];
    }
    allConfigurations.add(stageConfig);

    // Create prod configuration
    final prodConfig = <String, dynamic>{
      'name': '$name (prod)',
      'deviceId': deviceId,
      'type': 'dart',
      'request': 'launch',
      'program': 'lib/main.dart',
      'args': ['--flavor', 'prod'],
    };
    if (desktopFilters.contains(deviceId)) {
      prodConfig['args'] = [
        ...prodConfig['args'],
        '-t',
        'lib/main.desktop.dart',
      ];
    }
    allConfigurations.add(prodConfig);
  }

  final newConfig = <String, dynamic>{
    'version': '1.0.0',
    'configurations': ([
      {
        'name': 'Flutter',
        'request': 'launch',
        'type': 'dart',
      },
      ...allConfigurations,
    ]),
    'compounds': [
      {
        'name': 'All Devices (stage)',
        'configurations': allConfigurations
            .where((obj) => obj['name'].toString().contains('(stage)'))
            .map((obj) => obj['name'])
            .toList(),
      },
      {
        'name': 'All Devices (prod)',
        'configurations': allConfigurations
            .where((obj) => obj['name'].toString().contains('(prod)'))
            .map((obj) => obj['name'])
            .toList(),
      },
    ],
  };

  utils.mkDir('.vscode');
  final vsConfig = File('.vscode/launch.json');
  // final encoded = json.encode(newConfig);
  const jsonEncoder = JsonEncoder.withIndent('  ');
  final newJson = jsonEncoder.convert(newConfig);

  vsConfig.writeAsStringSync(newJson);

  print('✓ Generated ${allConfigurations.length} launch configurations');
  print('✓ Devices: ${filteredDevices.length}');
  print('✓ Flavors: stage, prod');
}
