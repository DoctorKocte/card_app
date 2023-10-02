import 'package:animated_view_flutter/components/card_square.dart';
import 'package:animated_view_flutter/components/card_info_view.dart';
import 'package:animated_view_flutter/models/card_model.dart';
import 'package:animated_view_flutter/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/theme/app_theme.dart';

class CardsPageView extends StatefulWidget {
  const CardsPageView({super.key});

  @override
  State<CardsPageView> createState() => _CardsPageViewState();
}

class _CardsPageViewState extends State<CardsPageView> {
  final PageController pageController = PageController(viewportFraction: 0.55);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final position = pageController.page!.round();
      if (currentPage != position) {
        {
          setState(() {
            currentPage = position;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final appRadius = appTheme.radius;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          //child: Container(
          // decoration: const BoxDecoration(boxShadow: [
          //   BoxShadow(
          //       color: Colors.white24,
          //       blurRadius: 24,
          //       blurStyle: BlurStyle.outer)
          // ]),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return CardSquare(
                  isActive: index == currentPage,
                  index: index,
                  card: cards[index]);
            },
          ),
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: appRadius.radiusTop16,
                color: colorScheme.background.primaryGrey),
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return CardInfoView(
                    card: cards[currentPage],
                    currentTransactions: transactions.where((element) => element.cardID == cards[currentPage].cardID).toList()
                );
              },
            ))
      ],
    );
  }
}
