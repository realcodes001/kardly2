import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/animations/animation_helper.dart';

void deleteAccountModal(BuildContext context) {
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
      return StaggeredDeleteAccountModal();
    },
  );
}

class StaggeredDeleteAccountModal extends StatefulWidget {
  @override
  _StaggeredDeleteAccountModalState createState() =>
      _StaggeredDeleteAccountModalState();
}

class _StaggeredDeleteAccountModalState
    extends State<StaggeredDeleteAccountModal>
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
      height: 290,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
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
          _buildStaggeredItem(
            const Text(
              'Delete Account ?',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            0,
          ),
          const SizedBox(height: 10),
          _buildStaggeredItem(
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.AppColor.primaryDeleteButton_color,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Icon(
                    Iconsax.trash,
                    color: color.AppColor.red,
                  ),
                ),
              ),
            ),
            1,
          ),
          const SizedBox(height: 10),
          _buildStaggeredItem(
            Text(
              'You will no longer be able to retrieve or use this email to open a new account. Are you sure you want to delete your account ?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Light',
                color: color.AppColor.subtitle,
              ),
              textAlign: TextAlign.center,
            ),
            2,
          ),
          const SizedBox(height: 20),
          _buildStaggeredItem(
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement account deletion logic here
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(100, 50),
                        primary: color.AppColor.primaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(100, 50),
                        primary: color.AppColor.secondaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Light',
                          color: color.AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            3,
          ),
        ],
      ),
    );
  }
}
