import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/security/change_password.dart';
import 'package:kardly/screens/security/create_passcode.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 40, left: 25, right: 25),
          child: Column(
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
                      'Security',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BricolageGrotesque SemiBold',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Passcode',
                          style: TextStyle(
                            fontSize: 14,
                            color: color.AppColor.black,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Turn on passcode to secure your account',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Light',
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: null,
                      activeColor: color.AppColor.mainBtn_color2,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreatePasscode()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change Passcode',
                        style: TextStyle(
                          fontSize: 14,
                          color: color.AppColor.black,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Change your password',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: color.AppColor.subtitle,
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 14,
                          color: color.AppColor.black,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Change your account password',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: color.AppColor.subtitle,
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
}
