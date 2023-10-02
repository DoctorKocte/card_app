import 'dart:ui';

import 'package:animated_view_flutter/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/theme/app_theme.dart';
import 'package:animated_view_flutter/assets/assets.gen.dart';

class CardSquare extends StatelessWidget {
  const CardSquare(
      {Key? key,
      required this.isActive,
      required this.index,
      required this.card
  }) : super(key: key);

  final bool isActive;
  final int index;
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    const durationMilliseconds = Duration(milliseconds: 200);

    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final spacer = appTheme.spacer;
    final appRadius = appTheme.radius;
    final textStyles = appTheme.textStyles.withColor(Colors.white);
    final top = isActive ? spacer.sp10 : spacer.sp20;
    final bottom = isActive ? spacer.sp10 : spacer.sp20;

    return Transform.rotate(
        angle: isActive ? 0 : -20 / 180,
        child: AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          duration: durationMilliseconds,
          margin: EdgeInsets.only(
            top: top,
            bottom: bottom,
            right: spacer.sp40,
            left: spacer.sp40,
          ),
          decoration: BoxDecoration(
            boxShadow: isActive
                ? [BoxShadow(blurRadius: spacer.sp16, color: colorScheme.background.shadow)]
                : [],
            borderRadius: appRadius.radius16,
            border: Border.all(
                color: isActive
                    ? colorScheme.background.white40
                    : colorScheme.background.contrast),
            image: DecorationImage(
                image: (card.cardImage != null)
                    ? card.cardImage!.image
                    : Assets.images.design1.image().image,
                fit: BoxFit.cover),
          ),
          child: Stack(children: [
            LayoutBuilder(builder: (context, constraints) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: spacer.sp12,
                      right: spacer.sp12,
                      top: (constraints.maxHeight / 2.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: spacer.sp16),
                        child: Text(
                          card.cardNumber,
                          overflow: TextOverflow.ellipsis,
                          style: textStyles.h4,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('VALID THRU', style: textStyles.h6),
                              Text(card.validDate, style: textStyles.h6)
                            ],
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: spacer.sp20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('CVV', style: textStyles.h6),
                                  Text(card.cvvCode, style: textStyles.h6)
                                ],
                              ))
                        ],
                      )
                    ],
                  ));
            }),
            Container(
                child: isActive
                    ? Container(height: 0)
                    : BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorScheme.background.shadow),
                        ),
                      )),
          ]),
        ));
  }
}
