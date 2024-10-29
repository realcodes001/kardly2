import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

import '../../components/custom_snackbar.dart';

class DeleteCardLoadingScreeen extends StatefulWidget {
  const DeleteCardLoadingScreeen({Key? key}) : super(key: key);

  @override
  _DeleteCardLoadingScreeenState createState() =>
      _DeleteCardLoadingScreeenState();
}

class _DeleteCardLoadingScreeenState extends State<DeleteCardLoadingScreeen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Set up animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Create animations
    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    opacityAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Automatically pop the widget after 10 seconds
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.of(context).pop(); // Close after 10 seconds
        CustomSnackbar.showTopSnackbar(
          context,
          'Card Deleted',
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred transparent background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
          ),
        ),
        // Centered column with image and text
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: scaleAnimation,
                child: RotationTransition(
                  turns: rotationAnimation,
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Image.asset(
                      'lib/images/logowhite.png', // Replace with your image path
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Spacing between image and text
            ],
          ),
        ),
      ],
    );
  }
}
