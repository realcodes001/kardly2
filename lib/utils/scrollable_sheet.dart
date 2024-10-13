import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/components/modal_dropdown.dart';
import 'package:kardly/utils/institution_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showDraggableScrollableModal(BuildContext context) async {
  // State management for selected account
  String? selectedAccount; // Initial value as null
  String? savedAccountNumber;
  String? savedAccountName;

  // Load saved account details from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  savedAccountNumber = prefs.getString('accountNumber');
  savedAccountName = prefs.getString('accountName');

  // Use a StatefulBuilder to manage the state inside the modal
  showGeneralDialog(
    context: context,
    barrierLabel: "Modal",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 600),
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
                initialChildSize: 0.7,
                minChildSize: 0.3,
                maxChildSize: 0.9,
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
                                        borderRadius: BorderRadius.circular(20),
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
                                'Withdraw',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'BricolageGrotesque Bold',
                                ),
                              ),
                              const SizedBox(height: 20),
                              Column(
                                children: const [
                                  Text(
                                    'Wallet Balance',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'BricolageGrotesque Light',
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '\$786.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'BricolageGrotesque Regular',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Amount',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.black),
                              ),
                              const SizedBox(height: 4),
                              TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 232, 232, 232),
                                        width: 1.5, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color.AppColor.mainBtn_color2,
                                        width: 2.0, // Adjust thickness
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText:
                                        'How much do you want to withdraw ?',
                                    hintStyle: const TextStyle(
                                        fontSize: 12,
                                        fontFamily:
                                            'BricolageGrotesque Regular',
                                        color: Colors.grey)),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Account',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 4),

                              // Custom modal dropdown instead of the dropdown button
                              GestureDetector(
                                onTap: () async {
                                  if (savedAccountNumber != null &&
                                      savedAccountName != null) {
                                    // Show the modal if an account is saved
                                    String? selected =
                                        await showModalBottomSheet<String>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return CustomModalDropdown(
                                          items: savedAccountName != null
                                              ? [savedAccountName]
                                              : [], // Ensure non-null value

                                          selectedValue: selectedAccount,
                                        );
                                      },
                                    );

                                    // If the user selects an account, update the state to reflect the selection
                                    if (selected != null) {
                                      setState(() {
                                        selectedAccount =
                                            selected; // Update the selected account
                                      });
                                    }
                                  } else {
                                    // If no account is saved, show a message or take appropriate action
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'No Accounts Found',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  'BricolageGrotesque Bold',
                                            ),
                                          ),
                                          content: Text(
                                              'Please add an account before withdrawing funds.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                // Navigate to add account page
                                              },
                                              child: const Text(
                                                'Add Account',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily:
                                                      'BricolageGrotesque Bold',
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 225, 225, 225),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedAccount ??
                                            (savedAccountNumber != null &&
                                                    savedAccountName != null
                                                ? savedAccountName
                                                : 'No accounts available'), // Show saved account or message
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selectedAccount != null ||
                                                  (savedAccountNumber != null &&
                                                      savedAccountName != null)
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),
                              ElevatedButton(
                                onPressed: () {
                                  showInstitutionsSheet(context);
                                  // Perform actions with the selected account
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: const Size(double.infinity, 60),
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
