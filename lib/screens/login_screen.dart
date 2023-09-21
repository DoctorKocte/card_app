import 'package:animated_view_flutter/screens/cards_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(children: [
              Image.asset('assets/images/card5.png',
                  height: MediaQuery.sizeOf(context).height * 0.4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GradientText(
                  'Online wallet for your cards',
                  style: TextStyle(fontSize: 40, fontFamily: 'SidewareTrial'),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 255, 232, 148),
                    Color.fromARGB(255, 238, 211, 102),
                    Color.fromARGB(255, 128, 96, 0),
                  ]),
                ),
              ),
              const Spacer(),
              Row(children: [
                const Spacer(),
                FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CardsScreen()
                      ));
                    },
                    icon: const Icon(Icons.arrow_forward,
                        color: Color.fromARGB(255, 128, 96, 0)),
                    label: const GradientText(
                      'Go to your cards',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SidewareTrial',
                      ),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 128, 96, 0),
                        Color.fromARGB(255, 238, 211, 102),
                        Color.fromARGB(255, 255, 232, 148),
                      ]),
                    )),
              ])
            ])));
  }
}

class GradientText extends StatelessWidget {
  const GradientText(this.text, {Key? key, required this.gradient, this.style})
      : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        child: Text(text, style: style));
  }
}