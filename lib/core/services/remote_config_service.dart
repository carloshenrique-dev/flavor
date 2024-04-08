import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flavor/core/services/firebase_remote_config_keys.dart';
import 'package:flutter/material.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService() : _remoteConfig = FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _remoteConfig;

  late String pexelsKey;
  late String geminiKey;

  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 30),
          minimumFetchInterval: const Duration(hours: 12),
        ),
      );
      bool updated = await _remoteConfig.fetchAndActivate();

      if (updated) {
        debugPrint('The config has been updated.');
        geminiKey = getString(FirebaseRemoteConfigKeys.geminiKey);
        pexelsKey = getString(FirebaseRemoteConfigKeys.pexelsKey);
      } else {
        debugPrint('The config is not updated..');
      }
    } catch (e) {
      debugPrint('Erro ao buscar as configurações remotas: $e');
    }
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }
}
