import 'package:animated_view_flutter/components/card_square.dart';
import 'package:animated_view_flutter/components/card_info_view.dart';
import 'package:animated_view_flutter/models/card_model.dart';
import 'package:flutter/material.dart';

class CardsPageView extends StatefulWidget {
  const CardsPageView({super.key});

  @override
  State<CardsPageView> createState() => _CardsPageViewState();
}

class _CardsPageViewState extends State<CardsPageView> {
  final PageController pageController = PageController(viewportFraction: 0.35);
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
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.78,
            child: Container(
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
            )),
            Container(
              color: Color.fromARGB(172, 10, 10, 10),
              height: 100,
             child:
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                  return CardInfoView(
                      card: cards[currentPage]
                      );
                },
            ))
      ],
    );
  }
}
