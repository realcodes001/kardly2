import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      'Profile',
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
                      'Your basic profile settings',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'BricolageGrotesque Light',
                        color: color.AppColor.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Full Name',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'BricolageGrotesque Regular',
                    color: color.AppColor.black),
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 232, 232,
                            232), // Set the inactive border color
                        width: 1.5, // Border width
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    // Set the border color when the TextField is focused (active)
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: color.AppColor
                            .mainBtn_color2, // Set the active border color
                        width:
                            2.0, // You can adjust the thickness of the border
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Enter your full name',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: color.AppColor.subtitle)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email Address',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'BricolageGrotesque Regular',
                    color: color.AppColor.black),
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),

                    // Set the border color when the TextField is not focused (inactive)
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 232, 232,
                            232), // Set the inactive border color
                        width: 1.5, // Border width
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    // Set the border color when the TextField is focused (active)
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: color.AppColor
                            .mainBtn_color2, // Set the active border color
                        width:
                            2.0, // You can adjust the thickness of the border
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'example@gmail.com',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: color.AppColor.subtitle)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'BricolageGrotesque Regular',
                    color: color.AppColor.black),
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 232, 232,
                            232), // Set the inactive border color
                        width: 1.5, // Border width
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    // Set the border color when the TextField is focused (active)
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: color.AppColor
                            .mainBtn_color2, // Set the active border color
                        width:
                            2.0, // You can adjust the thickness of the border
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'eg 09011222222',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: color.AppColor.subtitle)),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity,
                      60), // Set width to 100 and height to 50 // Set width and height
                  primary: color.AppColor.mainBtn_color2,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Set the border radius
                  ),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'BricolageGrotesque Light',
                    color: color.AppColor.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
