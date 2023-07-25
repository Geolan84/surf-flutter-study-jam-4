import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/repositories/response_repository.dart';
import 'package:surf_practice_magic_ball/domain/repositories/settings_repository.dart';


class MagicBallViewModel extends ChangeNotifier {
  final _responseService = ResponseRepository();
  final _settingsService = SettingsRepository();

  MagicBallViewModel(){
    readSettings();
    notifyListeners();
  }

  String _answer = "";
  bool _errored = false;
  bool _loading = false;
  bool _audioStatus = false;

  String get answer => _answer;
  bool get errored => _errored;
  bool get loading => _loading;
  bool get audioStatus => _audioStatus;

  Future<void> readSettings() async{
    _audioStatus = await _settingsService.getAudioSetting();
    notifyListeners();
  }

  Future<void> getAnswer(BuildContext context) async {
    _answer = "";
    _errored = false;
    _loading = true;

    try{
      _answer = await _responseService.getAnswer();
      await readSettings();
    }catch(_){
      _errored = true;
    }
    _loading = false;
    _updateState();
  }

  void _updateState() {
    notifyListeners();
  }
  
}