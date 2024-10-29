import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/animations/animation_helper.dart';

void lockCardModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StaggeredLockCardModal();
    },
  );
}

class StaggeredLockCardModal extends StatefulWidget {
  @override
  _StaggeredLockCardModalState createState() => _StaggeredLockCardModalState();
}

class _StaggeredLockCardModalState extends State<StaggeredLockCardModal>
    with SingleTickerProviderStateMixin {
  late AnimationHelper _animationHelper;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    _animationHelper = AnimationHelper(vsync: this); // Initialize helper
    _animationHelper.initialize();

    // Start the animation when the modal opens
    _animationHelper.startAnimation();
  }

  @override
  void dispose() {
    _animationHelper.dispose(); // Dispose animation properly
    super.dispose();
  }

  Widget _buildStaggeredItem(Widget child, int index, {double delay = 0.2}) {
    final Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationHelper.controller,
        curve: Interval(delay * index, 1.0, curve: Curves.easeOut),
      ),
    );

    return AnimatedBuilder(
      animation: _animationHelper.controller,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0, (1 - animation.value) * 20),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildStaggeredItem(
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
            0,
          ),
          const SizedBox(height: 20),
          _buildStaggeredItem(
            const Text(
              'Lock Card',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            1,
          ),
          const SizedBox(height: 3),
          _buildStaggeredItem(
            const Text(
              'Locking your card will',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Regular',
                color: Color(0xFF888888),
                fontWeight: FontWeight.w300,
              ),
            ),
            2,
          ),
          const SizedBox(height: 20),
          _buildStaggeredItem(
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.AppColor.lightgray,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '1. Stop all online transactions',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '2. Pause all card services',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            3,
          ),
          const SizedBox(height: 10),
          _buildStaggeredItem(
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lock Card',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            4,
          ),
        ],
      ),
    );
  }
}
