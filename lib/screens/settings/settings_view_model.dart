import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/repositories/settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {

  final _settingsService = SettingsRepository();
  var _audioSetting = false;
  bool get audioSetting => _audioSetting;

  SettingsViewModel(){
    readAudioSetting();
    notifyListeners();
  }

  Future<void> readAudioSetting() async{
    _audioSetting = await _settingsService.getAudioSetting();
    notifyListeners();
  }

  Future<void> saveAudioSetting(bool value) async{
    _audioSetting = value;
    await _settingsService.saveAudioSetting(value);
    notifyListeners();
  }
}
