import 'package:animated_view_flutter/components/card.dart';
import 'package:animated_view_flutter/models/card_model.dart';
import 'package:flutter/material.dart';

class CardsPageView extends StatefulWidget {
  const CardsPageView({super.key});

  @override
  State<CardsPageView> createState() => _CardsPageViewState();
}

class _CardsPageViewState extends State<CardsPageView> {
  final PageController pageController = PageController(viewportFraction: 0.75);
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
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return CardSquare(
                active: index == currentPage,
                index: index,
                card: cards[index]
              );
            },
          ),
        )
        //Spacer()
      ],
    );
  }
}
