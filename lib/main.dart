import 'package:explore/screens/home.dart';
import 'package:explore/sorting/language_sort.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider<SingleNotifier>(create: (_) => SingleNotifier())
],
child: new MyApp()));

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
