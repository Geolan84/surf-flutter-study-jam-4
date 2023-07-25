import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/screens/settings/settings_view_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<SettingsViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Настройки"),
        centerTitle: true,
      ),
      body: SettingsList(
          lightTheme: const SettingsThemeData(
              settingsListBackground: Colors.transparent),
          sections: [
            SettingsSection(
                // title: const Text('Настройки профиля'),
                tiles: <SettingsTile>[
                  SettingsTile.switchTile(
                    leading: const Icon(Icons.speaker_rounded),
                    initialValue: model.audioSetting,
                    onToggle: (value) {
                      model.saveAudioSetting(value);
                    },
                    title: const Text("Озвучка ответа"),
                  ),
                ]),
          ]),
    );
  }
}
