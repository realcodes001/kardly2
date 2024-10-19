import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kardly/constants/colors.dart' as color;

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
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
              child: Image.asset('lib/images/all.png')),
          Text(
            "Pay for subscriptions",
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
