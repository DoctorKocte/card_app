import 'dart:ui';

import 'package:animated_view_flutter/models/card_model.dart';
import 'package:flutter/material.dart';

class CardSquare extends StatelessWidget {
  const CardSquare({Key? key, this.active, this.index, this.card})
      : super(key: key);

  final bool? active;
  final int? index;
  final CardModel? card;

  @override
  Widget build(BuildContext context) {
    final top = active! ? 30.0 : 40.0;
    final bottom = active! ? 30.0 : 40.0;

    return Transform.rotate(
        angle: active! ? 0 : -20 / 180,
        child: AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 200),
          //curve: Curves.slowMiddle,
          margin: EdgeInsets.only(
            top: top,
            bottom: bottom,
            right: 10,
            left: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: active! ? Colors.white.withOpacity(0.4) : Colors.black),
            //color: Color.fromARGB(255, 214, 214, 214),
            image: DecorationImage(
                image: (card!.cardImage != null)
                    ? AssetImage(card!.cardImage!)
                    : AssetImage('assets/images/design1.jpeg'),
                fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Container(
                padding: EdgeInsets.only(
                    left: 12, right: 12, top: active! ? 70 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        card!.cardNumber,
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
                              card!.validDate,
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
                                  card!.cvvCode,
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
                child: !active!
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2)),
                        ),
                      )
                    : Container(height: 0)),
          ]),
        ));
  }
}
