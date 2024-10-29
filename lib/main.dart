import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kardly/cards/manage_cards.dart';
import 'package:kardly/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:kardly/screens/onboarding/splash_screen.dart';
import 'package:kardly/screens/profile.dart'; // If needed in navigation
import 'provider/institutions_provider.dart';
import 'package:kardly/provider/account_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InstitutionProvider()..loadSavedDetails(),
        ),
        // Account Provider
        ChangeNotifierProvider(
          create: (_) => AccountProvider()..loadAccount(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(primaryColor: Colors.white),
        home: SplashScreen(),
      ),
    );
  }
}
