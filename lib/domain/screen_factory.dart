import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/screens/ball_screen/magic_ball_view_model.dart';
import 'package:surf_practice_magic_ball/screens/ball_screen/magic_ball_widget.dart';
import 'package:surf_practice_magic_ball/screens/settings/settings_view_model.dart';
import 'package:surf_practice_magic_ball/screens/settings/settings_widget.dart';

class ScreenFactory {
  Widget makeMagicBall() {
    return ChangeNotifierProvider(
      create: (_) => MagicBallViewModel(),
      child: const MagicBallWidget(),
    );
  }

    Widget makeSettings() {
    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      child: const SettingsWidget(),
    );
  }
}