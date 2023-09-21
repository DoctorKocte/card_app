class CardModel {
  CardModel({
    required this.cardNumber,
    required this.validDate,
    required this.cvvCode,
    this.cardImage
  });

  String cardNumber;
  String validDate;
  String cvvCode;
  String? cardImage;
}

var cards = [
  CardModel(cardNumber: '7812 2139 0823 XXXX', validDate: '05/24', cvvCode: '09X', cardImage: 'assets/images/design1.jpeg'),
  CardModel(cardNumber: '5436 2664 2367 XXXX', validDate: '06/26', cvvCode: '07X', cardImage: 'assets/images/design2.jpeg'),
  CardModel(cardNumber: '2146 8653 2425 XXXX', validDate: '02/27', cvvCode: '21X', cardImage: 'assets/images/design3.jpeg')
];
