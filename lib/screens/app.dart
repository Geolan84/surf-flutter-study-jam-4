import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/screens/navigation.dart';

class MagicApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MagicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.magicWidget,
    );
  }
}
