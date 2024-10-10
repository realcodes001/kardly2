import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kardly/screens/onboarding/splash_screen.dart';
import 'package:kardly/screens/profile.dart';

//import 'package:mamaa_app/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerKey:
    //Utils.messengerKey;
    navigatorKey:
    navigatorKey;
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: SplashScreen(),
    );
  }
}
