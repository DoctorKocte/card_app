import 'package:animated_view_flutter/models/card_model.dart';
import 'package:flutter/material.dart';

class CardInfoView extends StatelessWidget {
  const CardInfoView({Key? key, required this.card}) : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('card number: ${card.cardNumber}'.toUpperCase(),
            style: const TextStyle(
                fontFamily: 'CourierNew', 
                fontSize: 18, 
                color: Colors.white60
                ),
                ),
         Text('card holder: ${card.cardHolder}'.toUpperCase(),
            style: const TextStyle(
                fontFamily: 'CourierNew', 
                fontSize: 18, 
                color: Colors.white60
                ),
                ),
      ],
    );
  }
}
