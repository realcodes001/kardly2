import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/cardscreens/view_pin.dart';
import 'package:kardly/screens/security/enter_passcode.dart';

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
                fontSize: 26,
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
            buildMethodButton(
                context, 'Bank Transfer', 'Top up via bank transfer',
                onTap: () {}),
            const SizedBox(height: 20),
            // Crypto currency option
            buildMethodButton(
                context, 'Crypto currency', 'Top up via crypto currency',
                onTap: () {
              Navigator.pop(context); // Close the current modal
              Future.delayed(Duration(milliseconds: 200), () {
                showBottomModal2(context); // Open the second modal
              });
            }),
          ],
        ),
      );
    },
  );
}

void showBottomModal2(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
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
                fontSize: 26,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Use the following crypto wallet address to top up',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat Regular',
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 160,
                width: 160,
                child: Image.asset('lib/images/usdtbarcode.png'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '0x3dffu5jti4ov88nw34m6beuidklfg',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Iconsax.copy,
                      size: 14,
                    ),
                    onPressed: () {
                      // Copy to clipboard logic
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFF00A3D0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                      child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

void lockCardModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      bool isSwitched = false;
      return Container(
        height: 280,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
              'Lock Card',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Locking your card will',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Regular',
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '1. Stop all online transactions',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '2. Pause all card services',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lock Card',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  ),
                  Switch(value: isSwitched, onChanged: null)
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

void manageCardModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      bool isSwitched = false;
      return Container(
        height: 280,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
              'Manage Card',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ViewPin(),
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.eye,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'View Card PIN',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'BricolageGrotesque Medium',
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'View your current PIN',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque light',
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const EntryPage(),
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.arrow_swap,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Change Card PIN',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'BricolageGrotesque Medium',
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Change your current card PIN',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque light',
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void deleteCardModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      bool isSwitched = false;
      return Container(
        height: 290,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
              'Delete Card ?',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color.AppColor.primaryDeleteButton_color,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Icon(
                  Iconsax.trash,
                  color: color.AppColor.red,
                )),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Are you sure you want to delete this card ? you will no longer be able to use this card except you create a new one',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Light',
                color: color.AppColor.subtitle,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,

                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.primaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.secondaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void deleteAccountModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      bool isSwitched = false;
      return Container(
        height: 290,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
              'Delete Account ?',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color.AppColor.primaryDeleteButton_color,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Icon(
                  Iconsax.trash,
                  color: color.AppColor.red,
                )),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You will no longer be able to retrieve or use this email to open a new account. Are you sure you want to delete your account ? ',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Light',
                color: color.AppColor.subtitle,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,

                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.primaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.secondaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void signOutModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      bool isSwitched = false;
      return Container(
        height: 290,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
              'Sign Out',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color.AppColor.primaryDeleteButton_color,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Icon(
                  Iconsax.logout,
                  color: color.AppColor.red,
                )),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Are you sure you want to sign out ? ',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'BricolageGrotesque Light',
                  color: color.AppColor.subtitle,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,

                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.primaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.secondaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void creatingCardModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
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
        height: 280,
        padding:
            const EdgeInsets.only(top: 10, bottom: 15, left: 25, right: 25),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              children: const [
                Text(
                  'Create Card',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'BricolageGrotesque Bold',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Creating Card...',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'BricolageGrotesque Medium',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Please hold on a little while your card is being created',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat Regular',
                      color: Color.fromARGB(255, 173, 173, 173),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
                child: ElevatedButton(
              onPressed: () {
                //creatingCardModal(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width,
                    60), // Set width and height
                primary: color.AppColor.mainBtn_color2,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // Set the border radius
                ),
              ),
              child: Text('Create Card'),
            ))
          ],
        ),
      );
    },
  );
}

void contactUsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      bool isSwitched = false;
      return Container(
        height: 350,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Iconsax.close_circle),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Reach out to us through any of our channels',
              style: TextStyle(
                fontSize: 12,
                color: color.AppColor.subtitle,
                fontFamily: 'BricolageGrotesque Light',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ViewPin(// Pass the index of the selected card
                            ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFAEAEAE), width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.eye,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Medium',
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'testinngsupport@outlook.com',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque light',
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFAEAEAE), width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.instagram,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Social Media',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '@testingSupport',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: Color.fromARGB(255, 163, 163, 163),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFAEAEAE), width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.call,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Call Line',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '+234 7000 10000 200',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: Color.fromARGB(255, 163, 163, 163),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
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
        borderRadius: BorderRadius.circular(20),
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
