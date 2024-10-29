import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/cardscreens/view_pin.dart';
import 'package:kardly/animations/animation_helper.dart';

void contactUsModal(BuildContext context) {
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
      return StaggeredContactUsModal();
    },
  );
}

class StaggeredContactUsModal extends StatefulWidget {
  @override
  _StaggeredContactUsModalState createState() =>
      _StaggeredContactUsModalState();
}

class _StaggeredContactUsModalState extends State<StaggeredContactUsModal>
    with SingleTickerProviderStateMixin {
  late AnimationHelper _animationHelper;

  @override
  void initState() {
    super.initState();
    _animationHelper = AnimationHelper(vsync: this);
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
      height: 350,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Iconsax.close_circle1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildStaggeredItem(
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            0,
          ),
          const SizedBox(height: 4),
          _buildStaggeredItem(
            Text(
              'Reach out to us through any of our channels',
              style: TextStyle(
                fontSize: 12,
                color: color.AppColor.subtitle,
                fontFamily: 'BricolageGrotesque Light',
              ),
            ),
            1,
          ),
          const SizedBox(height: 20),
          _buildStaggeredItem(
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewPin(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFAEAEAE), width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.eye,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Medium',
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'testinngsupport@outlook.com',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque light',
                            color: Color.fromARGB(255, 163, 163, 163),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            2,
          ),
          const SizedBox(height: 10),
          _buildStaggeredItem(
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFAEAEAE), width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.instagram,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Social Media',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '@testingSupport',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: Color.fromARGB(255, 163, 163, 163),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            3,
          ),
          const SizedBox(height: 10),
          _buildStaggeredItem(
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFAEAEAE), width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.call,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Call Line',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Medium',
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '+234 7000 10000 200',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque light',
                          color: Color.fromARGB(255, 163, 163, 163),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
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
