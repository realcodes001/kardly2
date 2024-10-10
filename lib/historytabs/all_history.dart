import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

class AllHistory extends StatelessWidget {
  const AllHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              children: [
                const Text(
                  'It\'s empty in here',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'BricolageGrotesque SemiBold',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'You are yet to make any transactions yet',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'BricolageGrotesque Light',
                    color: color.AppColor.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
