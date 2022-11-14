import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:explore/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

final darkNotifier = ValueNotifier<bool>(false);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkNotifier,
      builder: (BuildContext context, bool isDark, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
          },
          theme: ThemeData(),
          darkTheme: ThemeData.dark(), // standard dark
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light, // adaptable device theme
        );
      }

    );

  }
}
