import 'package:animated_view_flutter/models/card_model.dart';
import 'package:animated_view_flutter/models/transaction_model.dart';
import 'package:flutter/material.dart';

class CardInfoView extends StatelessWidget {
  const CardInfoView(
      {Key? key, required this.card, required this.currentTransactions})
      : super(key: key);

  final CardModel card;
  final List<TransactionModel> currentTransactions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'card number: ${card.cardNumber}'.toUpperCase(),
            style: const TextStyle(
                fontFamily: 'CourierNew', fontSize: 18, color: Colors.white60),
          ),
          Text(
            'card holder: ${card.cardHolder}'.toUpperCase(),
            style: const TextStyle(
                fontFamily: 'CourierNew', fontSize: 18, color: Colors.white60),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: currentTransactions.length,
            itemBuilder: (BuildContext context, int index) {
              return TransactionView(
                  index: index, currentTransactions: currentTransactions);
            },
          )
        ],
      ),
    );
  }
}

class TransactionView extends StatelessWidget {
  const TransactionView(
      {required this.index, required this.currentTransactions, super.key});

  final int index;
  final List<TransactionModel> currentTransactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: currentTransactions[index].amount < 0
                        ? const Color.fromARGB(255, 80, 39, 37)
                        : const Color.fromARGB(255, 41, 77, 43)),
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(children: [
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(currentTransactions[index].title,
                                style: const TextStyle(color: Colors.white54)),
                            Text(currentTransactions[index].description,
                                style: const TextStyle(color: Colors.white54))
                          ])),
                      Text('${currentTransactions[index].amount > 0 ? '+' : ''} ${currentTransactions[index].amount} \$',
                          style: const TextStyle(color: Colors.white54))
                    ])))),
      ],
    );
  }
}
