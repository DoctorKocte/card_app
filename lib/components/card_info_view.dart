import 'package:animated_view_flutter/models/card_model.dart';
import 'package:animated_view_flutter/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/theme/app_theme.dart';

class CardInfoView extends StatelessWidget {
  const CardInfoView(
      {Key? key, required this.card, required this.currentTransactions})
      : super(key: key);

  final CardModel card;
  final List<TransactionModel> currentTransactions;

  @override
  Widget build(BuildContext context) {

  final appTheme = AppTheme.of(context);
  final spacer = appTheme.spacer;
  final textStyles = appTheme.textStyles.withColor(appTheme.colorScheme.textColor.primary);

    return Padding(
      padding: EdgeInsets.all(spacer.sp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'card number: ${card.cardNumber}'.toUpperCase(),
            style: textStyles.h5
          ),
          Text(
            'card holder: ${card.cardHolder}'.toUpperCase(),
            style: textStyles.h5,
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

  final appTheme = AppTheme.of(context);
  final colorScheme = appTheme.colorScheme;
  final spacer = appTheme.spacer;
  final appRadius = appTheme.radius;

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: spacer.sp10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: appRadius.radius16,
                    color: currentTransactions[index].amount < 0
                        ? colorScheme.background.failure
                        : colorScheme.background.success),
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: EdgeInsets.symmetric(vertical: spacer.sp12),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacer.sp12),
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
