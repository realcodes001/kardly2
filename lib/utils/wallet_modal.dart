import 'package:flutter/material.dart';
import 'package:kardly/components/modals/error_modal.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/components/modal_dropdown.dart';
import 'package:kardly/utils/modals.dart';
import 'package:kardly/components/network_modal.dart';

void walletModal(BuildContext context) {
  // Use a StatefulBuilder to manage the state inside the modal
  showGeneralDialog(
    context: context,
    barrierLabel: "Modal",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 900),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context);
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.8,
                minChildSize: 0.3,
                maxChildSize: 1,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Material(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 15, left: 25, right: 25),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context); // Close modal
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 226, 226, 226),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Withdraw to wallet',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'BricolageGrotesque SemiBold',
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Token',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'BricolageGrotesque Light',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: color.AppColor.lightgray),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Image.asset(
                                                'lib/images/usdt2.png',
                                              )),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Text(
                                            'USDT',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  'BricolageGrotesque Regular',
                                              color: Colors.black,
                                            ),
                                          ),
                                          const Spacer(),
                                          NetworkDropdown(
                                            onSelected: (String network) {
                                              // Perform any action when a network is selected.
                                              print(
                                                  "Selected network: $network");
                                              // You can update the state or show a snackbar, etc.
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  'Wallet Address',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'BricolageGrotesque Regular',
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 4),
                                GestureDetector(
                                  onTap: () {},
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 232, 232, 232),
                                            width: 1.2, // Border width
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                color.AppColor.mainBtn_color2,
                                            width: 2.0, // Adjust thickness
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: 'Enter your wallet address ?',
                                        hintStyle: const TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                'BricolageGrotesque Regular',
                                            color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily:
                                              'BricolageGrotesque Regular',
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Available: 786.00 USDT',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily:
                                              'BricolageGrotesque Regular',
                                          color: color.AppColor.subtitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 232, 232, 232),
                                            width: 1.2, // Border width
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                color.AppColor.mainBtn_color2,
                                            width: 2.0, // Adjust thickness
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText:
                                            'How much do you want to withdraw ?',
                                        hintStyle: const TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                'BricolageGrotesque Regular',
                                            color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(height: 60),
                                ElevatedButton(
                                  onPressed: () {
                                    oopsModal(context);
                                    // Perform actions with the selected account
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize:
                                        const Size(double.infinity, 60),
                                    primary: color.AppColor.mainBtn_color2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Withdraw',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'BricolageGrotesque Light',
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curve = CurvedAnimation(
        parent: anim1,
        curve: Curves.easeInOutCirc,
      );

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(curve),
        child: child,
      );
    },
  );
}
