import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class ApiException implements Exception {
  const ApiException({required this.error, required this.statusCode});

  final String error;

  final int statusCode;

  @override
  String toString() {
    return '$error ($statusCode)';
  }
}

class Extras {
  const Extras({
    required this.dateTime,
    required this.localeName,
    required this.operatingSystem,
    required this.timeZoneName,
    required this.version,
  });

  final DateTime dateTime;

  final String localeName;

  final String operatingSystem;

  final String timeZoneName;

  final String version;

  static Future<Extras> create() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return Extras(
      dateTime: DateTime.now(),
      localeName: Platform.localeName,
      operatingSystem:  Platform.operatingSystem,
      timeZoneName: DateTime.now().timeZoneName,
      version: packageInfo.version,
    );
  }

  Map<String, String> toJson() {
    return {
      'dateTime': dateTime.toIso8601String(),
      'localeName': localeName,
      'operatingSystem': operatingSystem,
      'timeZoneName': timeZoneName,
      'version': version,
    };
  }
}
