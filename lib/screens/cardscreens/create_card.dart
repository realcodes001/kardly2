import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/components/modals/top_up_modal.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/utils/modals.dart';
import 'package:kardly/utils/modals2.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({Key? key}) : super(key: key);

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  bool isChecked = false;

  bool isChecked2 = false;
  String currentCardType = 'MasterCard'; // Variable to store card type
  String currentCardImage =
      'lib/images/mcard.png'; // Variable to store image path

  // Method to toggle between card types
  void toggleCardType() {
    setState(() {
      if (currentCardType == 'MasterCard') {
        currentCardType = 'Visa';
        currentCardImage =
            'lib/images/visaimg.png'; // Change to your Visa image
      } else {
        currentCardType = 'MasterCard';
        currentCardImage = 'lib/images/mcard.png'; // Change back to MasterCard
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 40, left: 25, right: 25),
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
                  child: const Center(
                      child: Icon(
                    Iconsax.arrow_left,
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create Card',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'BricolageGrotesque SemiBold',
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Cards can be used for international payments',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Regular',
                  color: color.AppColor.subtitle,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Card type',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Regular',
                  color: color.AppColor.subtitle,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dollar Card',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'BricolageGrotesque SemiBold',
                            color: color.AppColor.black),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap:
                          toggleCardType(); // Call the toggle method
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: color.AppColor.lightgray,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Iconsax.arrow_swap,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Text(
                          currentCardType, // Display current card type
                          key: ValueKey<String>(currentCardType),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'BricolageGrotesque Regular',
                              color: color.AppColor.subtitle),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                          width: 20,
                          height: 20,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Image.asset(currentCardImage),
                          )) // Display current image)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wallet Balance',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const Text(
                          '\$22',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottomModal(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: color.AppColor.secondary_color,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Fund wallet',
                            style: TextStyle(
                              color: color.AppColor.mainBtn_color,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Card Fees',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'BricolageGrotesque Regular',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Card creation fee',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const Text(
                          '\$5',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exchange Rate',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const Text(
                          '\$1/N1750',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exchange Rate',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const Text(
                          '\$1/N1750',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maintenance Fee',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const Text(
                          '\$0',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: Checkbox(
                          activeColor: color.AppColor.mainBtn_color,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          }),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      child: Text(
                        'I have read and understood the above card terms and conditions and accept the above terms and condition',
                        style: TextStyle(
                            color: color.AppColor.subtitle,
                            fontSize: 10,
                            fontFamily: 'BricolageGrotesque Light'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  child: ElevatedButton(
                onPressed: isChecked
                    ? () {
                        CreatingCardModal1(context);
                      }
                    : null,
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
        ),
      ),
    );
  }
}
