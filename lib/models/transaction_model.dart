class TransactionModel {
  TransactionModel({
    required this.title,
    required this.description,
    required this.amount,
    required this.cardID
  });

  String title;
  String description;
  double amount;
  int cardID;
}

var transactions = [
  TransactionModel(title: 'Transaction 1', description: 'Shop', amount: - 1000, cardID: 1),
  TransactionModel(title: 'Transaction 2', description: 'Credit', amount: - 2000, cardID: 1),
  TransactionModel(title: 'Transaction 3', description: 'Bank', amount: 300.23, cardID: 2),
  TransactionModel(title: 'Transaction 4', description: 'Cafe', amount: - 430.95, cardID: 3),
  TransactionModel(title: 'Transaction 5', description: 'Shop', amount: - 1340.56, cardID: 3),
  TransactionModel(title: 'Transaction 6', description: 'Bank', amount: 1034.45, cardID: 3),
  TransactionModel(title: 'Transaction 7', description: 'Bank', amount: 1034.45, cardID: 3),
  TransactionModel(title: 'Transaction 8', description: 'Bank', amount: 1034.45, cardID: 3),
  TransactionModel(title: 'Transaction 9', description: 'Bank', amount: 999.99, cardID: 4)
];
