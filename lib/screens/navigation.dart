import 'package:surf_practice_magic_ball/domain/screen_factory.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const magicWidget = '/';
  static const settings = '/settings';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.magicWidget: (_) => _screenFactory.makeMagicBall(),
    MainNavigationRouteNames.settings: (_) => _screenFactory.makeSettings(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
      const widget = Text('Navigation error!!!');
      return MaterialPageRoute(builder: (_) => widget);
  }
}