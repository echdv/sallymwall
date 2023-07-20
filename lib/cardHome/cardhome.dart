import './data/card.dart';

import './state.dart';
import './utils/colors.dart';
import './widgets/cards_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

import 'utils/text_styles.dart';



class CardHome extends StatefulWidget {
  const CardHome({super.key});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome>
    with SingleTickerProviderStateMixin {
  PageController? pageController;

  late AnimationController animationController;

  late DraggableScrollableController scrollableController;

  int currentPage = 0;

  double sheetMaxSize = .85;

  late Animation<double> balanceAnimation;

  int previousPage = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    balanceAnimation = Tween<double>(begin: 0, end: cards[currentPage].balance)
        .animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });

    Future.delayed(Duration.zero, () {
      scrollableController =
          Provider.of<AppState>(context, listen: false).scrollableController;

      scrollableController.addListener(() {
        Provider.of<AppState>(context, listen: false).dragRatio =
            scrollableController.size / sheetMaxSize;
      });

      pageController =
          Provider.of<AppState>(context, listen: false).pageController;

      pageController?.addListener(pageControllerListener);
    });
  }

  void pageControllerListener() {
    // }
    setState(() {
      previousPage = currentPage;
      currentPage = pageController?.page!.floor() ?? 0;

      balanceAnimation = Tween<double>(
              begin: (cards[previousPage].balance - 80).roundToDouble(),
              end: cards[currentPage].balance)
          .animate(animationController);

      animationController.reset();
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
             backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeftLong,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
           
            Navigator.pop(context);
          },
        ),
      ),
        body: Consumer<AppState>(
          builder: (context, appState, _) => Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedCrossFade(
                        alignment: Alignment.center,
                        secondCurve: Curves.easeIn,
                        firstCurve: Curves.easeOut,
                        crossFadeState: appState.isViewingCardDetail
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 500),
                        secondChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Ваша карта',
                              style: TextStyles.mainTextStyle.apply(
                                fontSizeDelta: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'получить виртуальную карту за один клик!',
                              style: TextStyles.mainTextStyle.apply(
                                fontSizeDelta: -4,
                                color: TextStyles.mainTextStyle.color?.darken(),
                              ),
                            ),
                          ],
                        ),
                        firstChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Bank Cards',
                                    style: TextStyles.mainTextStyle.apply(
                                      fontSizeDelta: 15,
                                      fontWeightDelta: 5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      // image:  const Image(
                                      //   fit: BoxFit.cover,
                                      //   image: AssetImage(
                                      //     'assets/images/avatar.png',
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Text(
                              'Баланс',
                              style: TextStyles.mainTextStyle.apply(
                                fontSizeDelta: -2,
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 800),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                          begin: const Offset(0.0, -0.5),
                                          end: const Offset(0.0, 0.0))
                                      .animate(animation),
                                  child: child,
                                );
                              },
                              child: Text(
                                "${balanceAnimation.value}\ сом",
                                style: TextStyles.mainTextStyle.apply(
                                  fontSizeDelta: 8,
                                  fontWeightDelta: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CardsList(),
                      ),
                    )
                  ],
                ),
              ),
              draggableSheet(),
            ],
          ),
        ),
      );

  Widget draggableSheet() => Consumer<AppState>(
        builder: (context, appState, _) => DraggableScrollableSheet(
          snap: true,
          // controller: scrollableController,
          controller: appState.scrollableController,
          initialChildSize: .40,
          minChildSize: .18,
          maxChildSize: sheetMaxSize,
          builder: (context, controller) => AnimatedSlide(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            offset: appState.isViewingCardDetail
                ? const Offset(0, 0)
                : const Offset(0, 2),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.bottomSheetColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        "Транзакции",
                        style: TextStyles.mainTextStyle.apply(
                          fontWeightDelta: 5,
                          fontSizeDelta: 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
