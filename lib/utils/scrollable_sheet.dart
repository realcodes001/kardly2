import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/components/drop_down.dart';

void showDraggableScrollableModal(BuildContext context) {
  // Use a StatefulBuilder to manage the state inside the dialog/modal
  showGeneralDialog(
    context: context,
    barrierLabel: "Modal",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5), // Background color
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          String? selectedAccount; // State variable to store selected account
          List<String> accounts = [
            "Account 1",
            "Account 2",
            "Account 3"
          ]; // Replace with your actual account list

          return Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context); // Close the modal when tapping outside
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
                      onTap: () {}, // Prevents clicks inside from closing modal
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
                                      padding: const EdgeInsets.all(4),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 226, 226, 226),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(Icons.close),
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
                              const Text(
                                'Amount',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
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
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
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
                              CustomModalDropdown(
                                selectedValue: selectedAccount,
                                items: accounts,
                                hintText: "Select an account",
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedAccount =
                                        newValue; // Update the selected account
                                  });
                                },
                              ),

                              const SizedBox(height: 40),
                              ElevatedButton(
                                onPressed: () {
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
