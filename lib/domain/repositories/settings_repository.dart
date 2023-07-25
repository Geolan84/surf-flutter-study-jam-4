import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const audio = 'audio';
}

class SettingsRepository {
  static const _secureStorage = FlutterSecureStorage();

  Future<bool> getAudioSetting() async {
    return await _secureStorage.read(key: _Keys.audio) == 'true';
  }

  Future<void> saveAudioSetting(bool audioSetting) async {
    await _secureStorage.write(key: _Keys.audio, value: audioSetting.toString());
  }
}