import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
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
              child: Image.asset('lib/images/secure.png')),
          Text(
            "Make secure payments",
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
              fontFamily: 'BricolageGrotesque Regular',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
