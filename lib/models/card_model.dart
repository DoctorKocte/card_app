import 'package:animated_view_flutter/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class CardModel {
  CardModel({
    required this.cardID,
    required this.cardHolder,
    required this.cardNumber,
    required this.validDate,
    required this.cvvCode,
    this.cardImage
  });

  int cardID;
  String cardHolder;
  String cardNumber;
  String validDate;
  String cvvCode;
  Image? cardImage;
}

var cards = [
  CardModel(cardID: 1, cardHolder: 'Card Holder 1', cardNumber: '7812 2139 0823 XXXX XXXX XXXX', validDate: '05/24', cvvCode: '09X', cardImage: Assets.images.design1.image()),
  CardModel(cardID: 2, cardHolder: 'Card Holder 2', cardNumber: '5436 2664 2367 XXXX', validDate: '06/26', cvvCode: '07X', cardImage: Assets.images.design2.image()),
  CardModel(cardID: 3, cardHolder: 'Card Holder 3', cardNumber: '2146 8653 2425 XXXX', validDate: '02/27', cvvCode: '21X', cardImage: Assets.images.design3.image()),
  CardModel(cardID: 4, cardHolder: 'Card Holder 4', cardNumber: '1111 2222 3333 XXXX', validDate: '04/23', cvvCode: '27X')
];
