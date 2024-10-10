import 'package:flutter/material.dart';

class MastercardCard extends StatefulWidget {
  const MastercardCard({Key? key}) : super(key: key);

  @override
  _MastercardCardState createState() => _MastercardCardState();
}

class _MastercardCardState extends State<MastercardCard>
    with SingleTickerProviderStateMixin {
  bool _showBack = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  void _flipCard() {
    if (_showBack) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _showBack = !_showBack;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard, // Tap to flip card
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Calculate rotation angle
          double rotationAngle =
              _animation.value * 3.1416; // Full π radians (180 degrees)

          // Rotate depending on the front or back of the card
          if (_animation.value >= 0.5) {
            rotationAngle =
                (_animation.value - 1) * 3.1416; // Adjust for back view
          }

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(rotationAngle), // Y-axis rotation
            alignment: Alignment.center,
            child:
                _animation.value < 0.5 ? _buildFrontCard() : _buildBackCard(),
          );
        },
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      key: const ValueKey(1),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 400,
      width: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/images/patternbg.jpg'), // Background image for card
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xDF000000), // Main card color (black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(), // Empty space to align content
            Container(
              width: 140,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(91, 41, 41, 41), // Side strip color
              ),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'VISA',
                        style: TextStyle(
                          fontFamily: 'BricolageGrotesque Bold',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      key: const ValueKey(2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(
            254, 0, 0, 0), // Same black background for the back side
      ),
      child: Center(
        child: Text(
          'Mastercard Details\nHere!',
          style: TextStyle(
            fontFamily: 'BricolageGrotesque Bold',
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
