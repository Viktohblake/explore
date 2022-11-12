import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:explore/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
          },
          theme: light,
          darkTheme: dark,
           );
      },

    );
  }
}
