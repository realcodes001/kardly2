import 'package:flutter/material.dart';

import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/dashboard/dashboard.dart';

import 'package:kardly/components/network_modal.dart';
import 'package:flutter/services.dart'; // For Clipboard functionality
import 'package:kardly/components/custom_snackbar.dart';

void showDepositSheet(BuildContext context) {
  String selectedNetwork = 'ERC-20';
  String selectedImagePath = 'lib/images/usdtbarcode.png'; // Default image
  String address = '0x3dffu5jti4ov88nw34m6beuidklfg'; // Your USDT address

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true, // Important for draggable behavior
    backgroundColor: Colors.transparent, // Transparent to show rounded corners
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        expand: false, // Prevents full-screen expansion by default
        builder: (BuildContext context, ScrollController scrollController) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.info, size: 10),
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
                        const SizedBox(height: 20),

                        // Use AnimatedSwitcher for smooth image transition
                        Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              selectedImagePath,
                              key: ValueKey<String>(
                                  selectedImagePath), // Ensure correct animation
                              height: 160,
                              width: 160,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
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
                              NetworkDropdown(
                                onSelected: (String network) {
                                  setState(() {
                                    selectedNetwork = network;
                                    selectedImagePath = {
                                      'ERC-20': 'lib/images/usdtbarcode.png',
                                      'BEP-20': 'lib/images/ethbarcode.png',
                                      'TRC-20': 'lib/images/btcbarcode.png',
                                    }[network]!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 232, 232, 232),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  address,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.copy, size: 14),
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: address));
                                  CustomSnackbar.showTopSnackbar(
                                    context,
                                    'Address copied to clipboard!',
                                  );
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
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
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
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A3D0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                'Check Transaction',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'BricolageGrotesque Regular',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
