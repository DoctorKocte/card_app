import 'dart:ui';

import 'package:animated_view_flutter/models/card_model.dart';
import 'package:flutter/material.dart';

class CardSquare extends StatelessWidget {
  const CardSquare(
      {Key? key,
      required this.isActive,
      required this.index,
      required this.card})
      : super(key: key);

  final bool isActive;
  final int index;
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    final top = isActive ? 30.0 : 10.0;
    final bottom = isActive ? 30.0 : 10.0;

    return Transform.rotate(
        angle: isActive ? 0 : -20 / 180,
        child: AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.only(
            top: top,
            bottom: bottom,
            right: 40,
            left: 40,
          ),
          decoration: BoxDecoration(
            boxShadow: isActive
                ? [const BoxShadow(blurRadius: 16, color: Colors.black54)]
                : [],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: isActive ? Colors.white.withOpacity(0.4) : Colors.black),
            image: DecorationImage(
                image: (card.cardImage != null)
                    ? AssetImage(card.cardImage!)
                    : const AssetImage('assets/images/design1.jpeg'),
                fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Container(
                padding: EdgeInsets.only(
                    left: 12, right: 12, top: isActive ? 80 : 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        card.cardNumber,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontFamily: 'CourierNew',
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'VALID THRU',
                              style: TextStyle(
                                fontFamily: 'CourierNew',
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              card.validDate,
                              style: const TextStyle(
                                fontFamily: 'CourierNew',
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'CVV',
                                  style: TextStyle(
                                    fontFamily: 'CourierNew',
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  card.cvvCode,
                                  style: const TextStyle(
                                    fontFamily: 'CourierNew',
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                )),
            Container(
                child: isActive
                    ? Container(height: 0)
                    : BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2)),
                        ),
                      )),
          ]),
        ));
  }
}
