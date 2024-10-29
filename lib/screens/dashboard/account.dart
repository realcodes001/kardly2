import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/cards/manage_cards.dart';
import 'package:kardly/components/modals/contact_us_modal.dart';
import 'package:kardly/components/modals/delete_account_modal.dart';
import 'package:kardly/components/modals/sign_out_modal.dart';

import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/instiutions.dart';
import 'package:kardly/screens/profile.dart';
import 'package:kardly/utils/modals.dart';
import 'package:kardly/screens/security/security_page.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'BricolageGrotesque SemiBold',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: color.AppColor.lightgray,
                child: Container(),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tosin',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'BricolageGrotesque Medium',
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Profile(),
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
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.profile1,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ManageCards(),
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
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.card,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Manage Cards',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Institutions(),
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
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.card,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Add Bank',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SecurityPage(),
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
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.security,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Security',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
                  contactUsModal(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.support,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.people,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Referrals',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
                  deleteAccountModal(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 205, 205, 205),
                        width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.trash,
                        size: 14,
                        color: color.AppColor.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Delete Account',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
                  signOutModal(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 205, 205, 205),
                        width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.logout,
                        size: 14,
                        color: color.AppColor.red,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 12,
                          color: color.AppColor.red,
                          fontFamily: 'BricolageGrotesque Regular',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color.AppColor.arrowcolor,
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
