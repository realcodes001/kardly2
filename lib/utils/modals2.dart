import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/cards/manage_cards.dart';
import 'package:kardly/constants/colors.dart' as color;

class CreatingCardModal extends StatefulWidget {
  @override
  _CreatingCardModalState createState() => _CreatingCardModalState();
}

class _CreatingCardModalState extends State<CreatingCardModal>
    with TickerProviderStateMixin {
  bool isLoading = true;
  String statusTitle = 'Creating Card...';
  String statusMessage =
      'Please hold on a little while your card is being created';

  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    // Initialize the ConfettiController with a long duration
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));

    // Simulate a delay of 10 seconds, then update text and stop loading
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          isLoading = false;
          statusTitle = 'Card Created!';
          statusMessage = 'Your card has been successfully created';
        });

        // Start confetti when the card is created
        _confettiController.play();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 25, right: 25),
      child: Column(
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

          // Fade in the title
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
                  // Fade in the CircularProgressIndicator
                  if (isLoading)
                    CircularProgressIndicator(
                      color: color.AppColor.black,
                    ),

                  const SizedBox(height: 20),

                  // Confetti widget and icon (only when loading is false)
                  if (!isLoading)
                    ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple,
                      ],
                      particleDrag: 0.05,
                      emissionFrequency: 0.05,
                      numberOfParticles: 30,
                      gravity: 0.1,
                      minimumSize: const Size(3, 6),
                      maximumSize: const Size(4, 8),
                    ),

                  if (!isLoading)
                    const Icon(
                      Iconsax.cup,
                      size: 50,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),

                  const SizedBox(height: 20),

                  // Fade in the status title and message
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
          const SizedBox(height: 10),

          // Fade in the button
          if (!isLoading)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageCards(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 60),
                primary: color.AppColor.mainBtn_color2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'View card',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Regular',
                ),
              ),
            ),
        ],
      ),
    );
  }
}

//This is the method being called by the create card button
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
