import 'package:flutter/material.dart';
import 'package:flutter_tut/core/notifiers.dart';
import 'package:flutter_tut/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          // Removes the banner
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: isDark ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.blue,
            // This is the theme of your application (latest).
            useMaterial3: true,
          ),
          home: const WidgetTree(),
        );
      },
    );
  }
}
