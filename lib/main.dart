import 'package:animated_view_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/theme/adaptive_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
   return AdaptiveTheme(
      builder: (context, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        theme: theme.materialTheme,
      ));
  }
}
