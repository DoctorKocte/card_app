import 'package:animated_view_flutter/screens/cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final appTheme = AppTheme.of(context);
     final colorScheme = appTheme.colorScheme;
     final spacer = appTheme.spacer;
     final textStyles = appTheme.textStyles;
    
    return Scaffold(
        backgroundColor: colorScheme.background.primary,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: spacer.sp40, horizontal: spacer.sp20),
            child: Column(children: [
              Image.asset('assets/images/card5.png',
                  height: MediaQuery.sizeOf(context).height * 0.4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacer.sp20),
                child: GradientText(
                  'Online wallet for your cards',
                  style: textStyles.title,
                  gradient: LinearGradient(colors: colorScheme.gradients.gold),
                ),
              ),
              const Spacer(),
              Row(children: [
                const Spacer(),
                FloatingActionButton.extended(
                  backgroundColor: colorScheme.background.secondary,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CardsScreen()
                      ));
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: colorScheme.icons.gold
                    ),
                    label: GradientText(
                      'Go to your cards',
                      style:textStyles.subtitle,
                      //лучше через reversed.toList() или создать новый цвет?
                      gradient: LinearGradient(colors: colorScheme.gradients.gold.reversed.toList()),
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