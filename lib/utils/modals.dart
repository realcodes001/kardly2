import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/cardscreens/view_pin.dart';
import 'package:kardly/screens/dashboard/dashboard.dart';
import 'package:kardly/screens/security/enter_passcode.dart';
import 'package:kardly/utils/scrollable_sheet.dart';
import 'package:kardly/utils/wallet_modal.dart';
import 'package:kardly/components/network_modal.dart';
import 'package:flutter/services.dart'; // For Clipboard functionality
import 'package:kardly/components/custom_snackbar.dart';
import 'package:kardly/components/depo_sheet.dart';
import 'package:kardly/provider/institutions_provider.dart';
import 'package:provider/provider.dart';
import 'package:kardly/provider/account_provider.dart';
import 'package:kardly/service/account_service.dart';

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

void withdrawModal(BuildContext context) {
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
              'Withdraw',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Select a withdrawal method',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat Regular',
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            // Bank Transfer option
            buildMethodButton(
                context, 'Withdraw to bank', 'Withdraw to your bank account',
                onTap: () {
              showDraggableScrollableModal(context);
            }),
            const SizedBox(height: 20),
            // Crypto currency option
            buildMethodButton(
                context, 'Withdraw to wallet', 'Withdraw to your crypto wallet',
                onTap: () {
              Navigator.pop(context); // Close the current modal
              Future.delayed(Duration(milliseconds: 200), () {
                walletModal(context); // Open the second modal
              });
            }),
          ],
        ),
      );
    },
  );
}

void showBottomModal2(BuildContext context) {
  // Step 1: Add a variable to track the current image path.
  String selectedNetwork = 'ERC-20';
  String selectedImagePath =
      'lib/images/usdtbarcode.png'; // Default image for ERC-20
  String address = '0x3dffu5jti4ov88nw34m6beuidklfg'; // Your USDT address

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration:
          const Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
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
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.info,
                          size: 10,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Send only USDT assets to this address',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'BricolageGrotesque Light',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Step 3: Update the image dynamically based on the selected network
                  Center(
                    child: Container(
                      height: 160,
                      width: 160,
                      child: Image.asset(
                          selectedImagePath), // Use dynamic image path
                    ),
                  ),

                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset('lib/images/usdt2.png'),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'USDT',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'BricolageGrotesque Regular',
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),

                            // Step 2: Pass a callback to update both the network text and image path
                            NetworkDropdown(
                              onSelected: (String network) {
                                setState(() {
                                  selectedNetwork =
                                      network; // Update network text

                                  // Update the image path based on the selected network
                                  if (network == 'ERC-20') {
                                    selectedImagePath =
                                        'lib/images/usdtbarcode.png';
                                  } else if (network == 'BEP-20') {
                                    selectedImagePath =
                                        'lib/images/ethbarcode.png'; // Your BEP-20 image
                                  } else if (network == 'TRC-20') {
                                    selectedImagePath =
                                        'lib/images/btcbarcode.png'; // Your TRC-20 image
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 232, 232, 232),
                          width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            address,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'BricolageGrotesque Regular',
                              overflow: TextOverflow
                                  .ellipsis, // Ellipsis for long addresses
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.copy,
                            size: 14,
                          ),
                          onPressed: () {
                            // Copy to clipboard logic
                            Clipboard.setData(ClipboardData(text: address));
                            CustomSnackbar.showTopSnackbar(
                                context, 'Address copied to clipboard!');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Dashboard(),
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
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A3D0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text(
                              'Check Transaction',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'BricolageGrotesque Regular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
                fontSize: 20,
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
                fontSize: 20,
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
                fontSize: 20,
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
                fontSize: 20,
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

void deleteInstitutionModal(BuildContext context) {
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
      final provider = Provider.of<InstitutionProvider>(context);
      final provider2 = Provider.of<AccountProvider>(context);

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
              'Delete Bank Account ?',
              style: TextStyle(
                fontSize: 20,
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
              'Are you sure you want to delete this bank account ? You can choose to add it back anytime you want',
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
                      onPressed: () async {
                        await provider2.deleteAccount();
                        await provider.deleteAccountDetails();
                        CustomSnackbar.showTopSnackbar(
                          context,
                          'Bank account successfully deleted',
                        );
                        Navigator.pop(context);
                      },
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
                fontSize: 20,
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

void oopsModal(BuildContext context) {
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
        height: 320,
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
              'Oops',
              style: TextStyle(
                fontSize: 20,
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
                'You do not have sufficient balance to carry out this transaction',
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,

                        fixedSize: const Size(200,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.mainBtn_color2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
                        ),
                      ),
                      child: Text(
                        'Close',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.white,
                        ),
                      ),
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
                    fontSize: 20,
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Iconsax.close_circle1),
                  ),
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
