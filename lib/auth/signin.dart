import 'package:flutter/material.dart';
import 'package:kardly/auth/create_account.dart';
import 'package:kardly/auth/forgot_password.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/dashboard/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 25, top: 60, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'BricolageGrotesque Bold',
                        color: color.AppColor.black),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Enter your email address and password to sign in",
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
                            controller: passwordController,
                            obscureText: true,
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
                                        1.5, // You can adjust the thickness of the border
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixIcon: const Icon(
                                  Icons.mail_outline,
                                  size: 18,
                                ),
                                labelText: 'Email address',
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.subtitle),
                                hintText: ' Email',
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.subtitle)),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                                  Icons.lock_outline,
                                  size: 18,
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.subtitle),
                                hintText: '*******',
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
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ForgotPassword(),
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
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              color: color.AppColor.subtitle,
                              fontFamily: 'BricolageGrotesque Light',
                              fontSize: 10),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100,
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
                              "Sign in",
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
                          "Don't have an account?",
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
                          " click here to sign up ",
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
