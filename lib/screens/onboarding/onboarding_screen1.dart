import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 350,
              height: 280,
              child: Image.asset('lib/images/createcard.png')),
          Text(
            "Create a virtual",
            style: TextStyle(
              fontSize: 26,
              color: color.AppColor.black,
              fontFamily: 'BricolageGrotesque Bold',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            "Instantly convert your crypto to cash without any stress or hassle",
            style: TextStyle(
              fontSize: 14,
              color: color.AppColor.subtitle,
              fontFamily: 'BricolageGrotesque Light',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
