import 'package:flutter/material.dart';
import 'package:kardly/auth/create_account.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/dashboard/dashboard.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 25, top: 80, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password ",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'BricolageGrotesque Bold',
                        color: color.AppColor.black),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Enter your email address to reset your password",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Light',
                        color: color.AppColor.subtitle),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'BricolageGrotesque Regular',
                                color: color.AppColor.black),
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
                                prefixIcon: const Icon(
                                  Icons.mail_outline,
                                  size: 18,
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.subtitle),
                                hintText: 'Enter your email address',
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.subtitle)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                            style: ElevatedButton.styleFrom(
                                primary: color.AppColor.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'BricolageGrotesque Regular',
                                  color: color.AppColor.white),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: InkWell(
                        onTap: () => {},
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'BricolageGrotesque Regular',
                              color: color.AppColor.subtitle,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                      Center(
                          child: InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const CreateAccount(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          )
                        },
                        child: Text(
                          " click here to sign in ",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'BricolageGrotesque Bold',
                              color: color.AppColor.black,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
