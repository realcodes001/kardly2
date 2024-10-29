import 'package:flutter/material.dart';

class AnimationHelper {
  late AnimationController _controller;
  final TickerProvider vsync;
  final Duration duration;

  AnimationHelper(
      {required this.vsync, this.duration = const Duration(milliseconds: 800)});

  /// Initialize the AnimationController
  void initialize() {
    _controller = AnimationController(
      vsync: vsync,
      duration: duration,
    );
  }

  /// Start the animation
  void startAnimation() {
    _controller.forward(from: 0.0);
  }

  /// Reverse the animation (if needed)
  void reverseAnimation() {
    _controller.reverse();
  }

  /// Dispose the AnimationController
  void dispose() {
    _controller.dispose();
  }

  /// Access the controller for other animations
  AnimationController get controller => _controller;
}
