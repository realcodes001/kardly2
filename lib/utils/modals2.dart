import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/cards/manage_cards.dart';
import 'package:kardly/constants/colors.dart' as color;

void showBottomModal1(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 600), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        height: 320,
        padding:
            const EdgeInsets.only(top: 10, bottom: 15, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Up',
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Select a top up method',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat Regular',
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            // Bank Transfer option
            buildMethodButton(
                context, 'Bank Transfer', 'Top up via bank transfer',
                onTap: () {}),
            const SizedBox(height: 20),
            // Crypto currency option
            buildMethodButton(
                context, 'Crypto currency', 'Top up via crypto currency',
                onTap: () {
              Navigator.pop(context); // Close the current modal
              Future.delayed(Duration(milliseconds: 200), () {});
            }),
          ],
        ),
      );
    },
  );
}

class CreatingCardModal extends StatefulWidget {
  @override
  _CreatingCardModalState createState() => _CreatingCardModalState();
}

class _CreatingCardModalState extends State<CreatingCardModal> {
  bool isLoading = true; // Start with loading state
  String statusTitle = 'Creating Card...';
  String statusMessage =
      'Please hold on a little while your card is being created';

  @override
  void initState() {
    super.initState();

    // Simulate a delay of 10 seconds, then update text and stop loading
    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop showing the progress indicator
          statusTitle = 'Card Created!'; // Update title text
          statusMessage =
              'Your card has been successfully created'; // Update message text
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 25, right: 25),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 100,
              height: 4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 226, 226),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Create Card',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'BricolageGrotesque Bold',
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    const CircularProgressIndicator(), // Loading indicator stays during loading
                  const SizedBox(height: 20),
                  Text(
                    statusTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'BricolageGrotesque Medium',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusMessage,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'BricolageGrotesque Regular',
                      color: Color.fromARGB(255, 173, 173, 173),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          if (!isLoading)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ManageCards(// Pass the index of the selected card
                            ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width,
                    60), // Set width and height
                primary: color.AppColor.mainBtn_color2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'View card',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'BricolageGrotesque Regular'),
              ),
            ),
        ],
      ),
    );
  }
}

//This is the method being called by the create card button
//It returns the CreatingCardmodal wiget above it
void CreatingCardModal1(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false, // Disable dismiss during loading
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return CreatingCardModal(); // Use the stateful widget here
    },
  );
}

// Utility function to build method button widgets
Widget buildMethodButton(BuildContext context, String title, String description,
    {required Function onTap}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFAEAEAE), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'BricolageGrotesque Medium',
            ),
          ),
          const SizedBox(height: 3),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'BricolageGrotesque light',
              color: Color.fromARGB(255, 163, 163, 163),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}
