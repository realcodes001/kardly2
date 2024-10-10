import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;

class ViewPin extends StatefulWidget {
  const ViewPin({Key? key}) : super(key: key);

  @override
  State<ViewPin> createState() => _ViewPinState();
}

class _ViewPinState extends State<ViewPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 40, left: 25, right: 25),
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
                'Card PIN',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'BricolageGrotesque SemiBold',
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '4596',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 10,
                        fontFamily: 'BricolageGrotesque Bold',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'The 4 digits above are your card PIN. Ensure to keep it secure & safe',
                style: TextStyle(
                  fontSize: 12,
                  color: color.AppColor.subtitle,
                  fontFamily: 'BricolageGrotesque Light',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
