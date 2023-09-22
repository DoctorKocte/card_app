class CardModel {
  CardModel({
    required this.cardHolder,
    required this.cardNumber,
    required this.validDate,
    required this.cvvCode,
    this.cardImage
  });

  String cardHolder;
  String cardNumber;
  String validDate;
  String cvvCode;
  String? cardImage;
}

var cards = [
  CardModel(cardHolder: 'Card Holder 1', cardNumber: '7812 2139 0823 XXXX XXXX XXXX', validDate: '05/24', cvvCode: '09X', cardImage: 'assets/images/design1.jpeg'),
  CardModel(cardHolder: 'Card Holder 2', cardNumber: '5436 2664 2367 XXXX', validDate: '06/26', cvvCode: '07X', cardImage: 'assets/images/design2.jpeg'),
  CardModel(cardHolder: 'Card Holder 3', cardNumber: '2146 8653 2425 XXXX', validDate: '02/27', cvvCode: '21X', cardImage: 'assets/images/design3.jpeg'),
  CardModel(cardHolder: 'Card Holder 4', cardNumber: '1111 2222 3333 XXXX', validDate: '04/23', cvvCode: '27X')
];
