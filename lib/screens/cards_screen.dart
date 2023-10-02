import 'package:animated_view_flutter/components/card_page_view.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/theme/app_theme.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background.primary,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cards'),
        backgroundColor: colorScheme.background.contrast,
        foregroundColor: colorScheme.textColor.primary,
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         colors: [
        //           Colors.black,
        //   // Color.fromARGB(255, 128, 96, 0),
        //   // Color.fromARGB(255, 238, 211, 102),
        //   // Color.fromARGB(255, 255, 232, 148),
        // ]
        //   ),
        // ),
      ),
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: const [CardsPageView()],
          )),
    );
  }
}
