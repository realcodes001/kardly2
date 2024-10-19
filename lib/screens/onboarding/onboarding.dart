import 'package:flutter/material.dart';
import 'package:kardly/auth/create_account.dart';
import 'package:kardly/screens/dashboard/dashboard.dart';
import 'package:kardly/screens/onboarding/onboarding_screen1.dart';
import 'package:kardly/screens/onboarding/onboarding_screen2.dart';
import 'package:kardly/screens/onboarding/onboarding_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kardly/constants/colors.dart' as color;

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController pageController = PageController();
  String buttonText = "Skip";
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
                buttonText = (index == 2) ? 'Done' : 'Skip';
              });
            },
            children: const [
              OnboardingScreen1(),
              OnboardingScreen2(),
              OnboardingScreen3(),
            ],
          ),
          // Position the indicator at the top center
          Positioned(
            top: 40.0, // Adjust this value to control how far from the top
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  dotWidth: 100,
                  dotHeight: 4,
                  dotColor: Color.fromARGB(255, 221, 221, 221),
                  activeDotColor: color.AppColor.black,
                ),
              ),
            ),
          ),
          // Controls at the bottom
          Positioned(
            bottom: 40.0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccount(),
                        ),
                      );
                    },
                    child: Text(buttonText),
                  ),
                  if (currentPageIndex != 2)
                    GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 30, right: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: color.AppColor.black,
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: color.AppColor.white,
                                fontSize: 12,
                                fontFamily: 'BricolageGrotesque Regular'),
                          )),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
