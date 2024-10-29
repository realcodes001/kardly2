import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/screens/loading_screens/loading_screens.dart';
import 'package:kardly/animations/animation_helper.dart';

void deleteCardModal(BuildContext context) {
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
      return StaggeredDeleteCardModal();
    },
  );
}

class StaggeredDeleteCardModal extends StatefulWidget {
  @override
  _StaggeredDeleteCardModalState createState() =>
      _StaggeredDeleteCardModalState();
}

class _StaggeredDeleteCardModalState extends State<StaggeredDeleteCardModal>
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
          _buildStaggeredItem(
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
            0,
          ),
          const SizedBox(height: 20),
          _buildStaggeredItem(
            const Text(
              'Delete Card?',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            1,
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
                child: Icon(
                  Iconsax.trash,
                  color: color.AppColor.red,
                ),
              ),
            ),
            2,
          ),
          const SizedBox(height: 10),
          _buildStaggeredItem(
            Text(
              'Are you sure you want to delete this card? You will no longer be able to use this card except you create a new one.',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Light',
                color: color.AppColor.subtitle,
              ),
              textAlign: TextAlign.center,
            ),
            3,
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
                        Navigator.pop(context);
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierLabel: "Loading",
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (context, anim1, anim2) {
                            return const DeleteCardLoadingScreeen();
                          },
                        );
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
                    )
                  ],
                ),
              ),
            ),
            4,
          ),
        ],
      ),
    );
  }
}
