import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbasics/application/theme_service.dart';
import 'package:flutterbasics/presentation/navigation_example_screens/screen_one.dart';
import 'package:flutterbasics/presentation/navigation_example_screens/screen_two.dart';
import 'package:flutterbasics/root_bottom_navigation.dart';
import 'package:flutterbasics/theme.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // home: const RootBottomNavigation(),
        initialRoute: '/root',
        routes: <String, WidgetBuilder>{
          '/root': (BuildContext context) => const RootBottomNavigation(),
          '/screenOne': (BuildContext context) => const ScreenOne(),
          '/screenTwo': (BuildContext context) => const ScreenTwo(),
        },
      );
    });
  }
}
