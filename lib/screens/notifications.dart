import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                'Notifiactions',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'BricolageGrotesque SemiBold',
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 350),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'No Notification',
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
                        'You dod not have any notification yet',
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
            ],
          ),
        ),
      ),
    );
  }
}
