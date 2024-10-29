import 'package:flutter/material.dart';
import 'package:kardly/components/depo_sheet.dart';
import 'package:kardly/constants/colors.dart' as color;

void showBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 600), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        height: 320,
        padding:
            const EdgeInsets.only(top: 10, bottom: 15, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Up',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Select a top up method',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat Regular',
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            // Bank Transfer option
            buildMethodButton2(
                context, 'Bank Transfer', 'Top up via bank transfer',
                onTap: () {}),
            const SizedBox(height: 20),
            // Crypto currency option
            buildMethodButton(
                context, 'Crypto currency', 'Top up via crypto currency',
                onTap: () {
              Navigator.pop(context); // Close the current modal
              Future.delayed(Duration(milliseconds: 200), () {
                showDepositSheet(context); // Open the second modal
              });
            }),
          ],
        ),
      );
    },
  );
}

Widget buildMethodButton2(
    BuildContext context, String title, String description,
    {required Function onTap}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFAEAEAE), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Medium',
                ),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'BricolageGrotesque light',
                  color: Color.fromARGB(255, 163, 163, 163),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(255, 247, 247, 247),
                ),
                child: const Text(
                  'Currently unavailable',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'BricolageGrotesque Light',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Utility function to build method button widgets
Widget buildMethodButton(BuildContext context, String title, String description,
    {required Function onTap}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFAEAEAE), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'BricolageGrotesque Medium',
            ),
          ),
          const SizedBox(height: 3),
          Text(
            description,
            style: const TextStyle(
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
  );
}
