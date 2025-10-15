import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String appName;
  final String environment;
  final String baseUrl1;
  final String baseUrl2;
  final Map<String, String> baseUrls;
  final String courseKey;
  final Map<String, dynamic> colors;
  final String appVersion;
  final String themeMode;
  final String packageName;
  final String bundleId;
  final String logo;

  AppConfig({
    required this.appName,
    required this.environment,
    required this.baseUrl1,
    required this.baseUrl2,
    required this.baseUrls,
    required this.courseKey,
    required this.colors,
    required this.appVersion,
    required this.themeMode,
    required this.packageName,
    required this.bundleId,
    required this.logo,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['app_name'] as String,
      environment: json['environment'] as String,
      baseUrl1: json['base_url_1'] as String,
      baseUrl2: json['base_url_2'] as String,
      baseUrls: Map<String, String>.from(json['base_urls'] as Map),
      courseKey: json['course_key'] as String,
      colors: json['colors'] as Map<String, dynamic>,
      appVersion: json['app_version'] as String,
      themeMode: json['theme_mode'] as String,
      packageName: json['package_name'] as String,
      bundleId: json['bundle_id'] as String,
      logo: json['logo'] as String,
    );
  }
}

class ConfigService {
  static AppConfig? _config;

  static Future<AppConfig> loadConfig() async {
    if (_config != null) {
      return _config!;
    }

    // Get the config file name from the environment variable
    const configFileName = String.fromEnvironment('CONFIG_FILE', defaultValue: 'next-job.json');
    
    // Load the specified config file
    final jsonString = await rootBundle.loadString('assets/config/$configFileName');
    final json = jsonDecode(jsonString);
    _config = AppConfig.fromJson(json);
    return _config!;
  }

  static AppConfig get config {
    if (_config == null) {
      throw Exception('Config not loaded. Call loadConfig() first.');
    }
    return _config!;
  }
}