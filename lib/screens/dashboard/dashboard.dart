import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/screens/dashboard/account.dart';
import 'package:kardly/screens/dashboard/history.dart';
import 'package:kardly/screens/dashboard/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String message = '';
  int myIndex = 0;
  List<Widget> widgetList = const [HomeScreen(), History(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            bottom: 12), // Add margin around the BottomNavigationBar
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0), // Make corners rounded
          child: BottomNavigationBar(
            onTap: (index) => {
              setState(() {
                myIndex = index;
              })
            },
            currentIndex: myIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                  size: 18,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.note,
                  size: 20,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.profile,
                    size: 18,
                  ),
                  label: 'Account'),
            ],
            selectedItemColor: Colors.black, // Set selected item color
            unselectedItemColor: Color.fromARGB(255, 60, 60, 60),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor:
                Color.fromARGB(255, 239, 239, 239), // Set unselected item color
          ),
        ),
      ),
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
    );
  }
}
