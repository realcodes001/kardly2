import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/cards/manage_cards.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/cardscreens/create_card.dart';
import 'package:kardly/utils/modals.dart';
import 'package:kardly/screens/notifications.dart';
import 'package:kardly/utils/scrollable_sheet.dart';
// Import the individual card widgets
import 'package:kardly/cards/visa_card.dart';
import 'package:kardly/cards/mastercard_card.dart';
import 'package:kardly/cards/amex_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Step 1: Add a boolean to track visibility
  bool _isAmountVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 40, left: 25, right: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'BricolageGrotesque SemiBold',
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Notifications(),
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
                      icon: const Icon(
                        Iconsax.notification,
                        size: 18,
                      ))
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            _isAmountVisible ? '\$786.00' : '******',
                            style: const TextStyle(
                              fontSize: 32,
                              fontFamily: 'BricolageGrotesque Bold',
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isAmountVisible =
                                      !_isAmountVisible; // Toggle the visibility
                                });
                              },
                              icon: Icon(
                                _isAmountVisible
                                    ? Iconsax.eye
                                    : Iconsax.eye_slash, // Change the icon
                                size: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Call the modal function on tap
                          showBottomModal(
                              context); // <-- Trigger the modal here
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: color.AppColor.transactionBtn_color,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(Icons.arrow_downward, size: 16),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Deposit',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'BricolageGrotesque Light',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              withdrawModal(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: color.AppColor.transactionBtn_color,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(Icons.arrow_upward, size: 16),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Withdraw',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'BricolageGrotesque Light',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Swiper for custom-styled cards
              SizedBox(
                height: 400,
                child: Swiper(
                  itemCount: 3, // Since we have 3 cards
                  itemWidth: 320,
                  // Adjust to your liking
                  itemHeight: 400,
                  //fade: 2,

                  layout: SwiperLayout.STACK,
                  itemBuilder: (BuildContext context, int index) {
                    // Show different card widgets based on the index
                    switch (index) {
                      case 0:
                        return const VisaCard();
                      case 1:
                        return const MastercardCard();
                      case 2:
                        return const AmexCard();
                      default:
                        return const VisaCard(); // Fallback card
                    }
                  },
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const CreateCard(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.AppColor.mainBtn_color,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 60,
                      width: 180,
                      child: const Center(
                        child: Text(
                          'Create Card',
                          style: TextStyle(
                            fontFamily: 'BricolageGrotesque Regular',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Logic to add new cards (limited to 3)
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: color.AppColor.mainBtn_color,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
