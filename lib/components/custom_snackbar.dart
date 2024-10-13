import 'dart:ui'; // For the blur effect
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showTopSnackbar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(builder: (context) {
      return _SnackbarWidget(message: message);
    });

    // Insert the overlay entry to display the snackbar
    overlay?.insert(overlayEntry);

    // Automatically remove the snackbar after a delay
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class _SnackbarWidget extends StatefulWidget {
  final String message;

  const _SnackbarWidget({Key? key, required this.message}) : super(key: key);

  @override
  _SnackbarWidgetState createState() => _SnackbarWidgetState();
}

class _SnackbarWidgetState extends State<_SnackbarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Duration of the animation
    );

    // Define the sliding animation (from -1.0 to 0.0 in y-axis)
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth easing effect
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20, // Position it at the top of the screen
      left: 10,
      right: 10,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color:
                  Colors.white.withOpacity(0.2), // Semi-transparent background
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white
                    .withOpacity(0.3), // Slightly transparent border
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Match container radius
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10.0, sigmaY: 10.0), // Glass effect
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.message,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'BricolageGrotesque Regular',
                      color: Colors.white, // Text color for contrast
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
