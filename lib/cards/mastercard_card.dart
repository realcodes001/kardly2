import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

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
            Container(
              height: 400,
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 20, bottom: 20),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(91, 41, 41, 41), // Side strip color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Virtual card',
                    style: TextStyle(
                        color: color.AppColor.white,
                        fontFamily: 'BricolageGrotesque SemiBold',
                        fontSize: 12),
                  ),
                  Text(
                    'Carson',
                    style: TextStyle(
                        color: color.AppColor.white,
                        fontFamily: 'BricolageGrotesque Regular',
                        fontSize: 12),
                  ),
                ],
              ),
            ), // Empty space to align content
            Container(
              width: 140,
              height: 400,
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(91, 41, 41, 41), // Side strip color
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: color.AppColor.cardbackcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Show details',
                            style: TextStyle(
                                color: color.AppColor.white,
                                fontFamily: 'BricolageGrotesque Light',
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'lib/images/mcard.png',
                          ),
                        )),
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
        color: const Color.fromARGB(
            254, 0, 0, 0), // Same black background for the back side
      ),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(25),
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Number',
                    style: TextStyle(
                        color: color.AppColor.subtitle,
                        fontFamily: 'BricolageGrotesque Light',
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '0000 0000 0000 0000 0000',
                    style: TextStyle(
                        color: color.AppColor.white,
                        fontFamily: 'BricolageGrotesque Bold',
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Valid Thru',
                    style: TextStyle(
                        color: color.AppColor.subtitle,
                        fontFamily: 'BricolageGrotesque Light',
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '08/29',
                    style: TextStyle(
                        color: color.AppColor.white,
                        fontFamily: 'BricolageGrotesque Bold',
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Cvv',
                    style: TextStyle(
                        color: color.AppColor.subtitle,
                        fontFamily: 'BricolageGrotesque Light',
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '001',
                    style: TextStyle(
                        color: color.AppColor.white,
                        fontFamily: 'BricolageGrotesque Bold',
                        fontSize: 14),
                  ),
                ],
              )),
          Container(
              height: 400,
              width: 50,
              padding: EdgeInsets.only(top: 25, bottom: 25),
              decoration: BoxDecoration(
                  color: color.AppColor.cardbackcolor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: RotatedBox(
                      quarterTurns: 1, // 1 quarter turn is 90 degrees
                      child: Row(
                        children: [
                          Text(
                            'Virtual card',
                            style: TextStyle(
                                color: color.AppColor.white,
                                fontFamily: 'BricolageGrotesque Bold',
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
