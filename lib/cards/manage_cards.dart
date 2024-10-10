import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;

// Import the individual card widgets
import 'package:kardly/cards/visa_card.dart';
import 'package:kardly/cards/mastercard_card.dart';
import 'package:kardly/cards/amex_card.dart';
import 'package:kardly/screens/cardscreens/create_card.dart';
import 'package:kardly/utils/modals.dart';

class ManageCards extends StatefulWidget {
  const ManageCards({Key? key}) : super(key: key);

  @override
  State<ManageCards> createState() => _ManageCardsState();
}

class _ManageCardsState extends State<ManageCards> {
  int _currentIndex = 0; // To keep track of the current page index
  final PageController _pageController = PageController(
    viewportFraction:
        0.8, // This allows part of the next/previous card to be visible
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 40, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: color.AppColor.lightgray,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Center(child: Icon(Iconsax.arrow_left)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Manage Cards',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BricolageGrotesque SemiBold',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Manage your cards',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: color.AppColor.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 400, // Adjust the height to fit the card size
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal, // Horizontal swiping
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: const [
                    VisaCard(),
                    MastercardCard(),
                    AmexCard(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dots indicator to show the current card index
                  buildDotIndicator(0),
                  buildDotIndicator(1),
                  buildDotIndicator(2),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            lockCardModal(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: color.AppColor.lightgray,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Center(child: Icon(Iconsax.lock)),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Lock Card',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'BricolageGrotesque Light',
                            color: color.AppColor.subtitle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const CreateCard(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: color.AppColor.lightgray,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Center(child: Icon(Iconsax.add)),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Create Card',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'BricolageGrotesque Light',
                            color: color.AppColor.subtitle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            deleteCardModal(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: color.AppColor.lightgray,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Center(child: Icon(Iconsax.trash)),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Delete Card',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'BricolageGrotesque Light',
                            color: color.AppColor.subtitle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => {manageCardModal(context)},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Manage card',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Manage your card',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: Color.fromARGB(255, 163, 163, 163),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Spending Limit',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Set a limit for your transactions',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: Color.fromARGB(255, 163, 163, 163),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build dot indicators
  Widget buildDotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 5,
      width: _currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
