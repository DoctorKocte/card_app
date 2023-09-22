import 'package:animated_view_flutter/components/page_view.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 28),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cards'),
        backgroundColor: Colors.black,
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
          child: ListView(
        children: const [CardsPageView()],
      )),
    );
  }
}
