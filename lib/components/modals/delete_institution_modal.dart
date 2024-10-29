import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/provider/institutions_provider.dart';
import 'package:provider/provider.dart';
import 'package:kardly/provider/account_provider.dart';
import 'package:kardly/constants/colors.dart' as color;

import '../custom_snackbar.dart';

void deleteInstitutionModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 800), // Adjust this for slower animation
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      final provider = Provider.of<InstitutionProvider>(context);
      final provider2 = Provider.of<AccountProvider>(context);

      bool isSwitched = false;
      return Container(
        height: 290,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
            const SizedBox(height: 20),
            const Text(
              'Delete Bank Account ?',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'BricolageGrotesque Bold',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color.AppColor.primaryDeleteButton_color,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Icon(
                  Iconsax.trash,
                  color: color.AppColor.red,
                )),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Are you sure you want to delete this bank account ? You can choose to add it back anytime you want',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Light',
                color: color.AppColor.subtitle,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await provider2.deleteAccount();
                        await provider.deleteAccountDetails();
                        CustomSnackbar.showTopSnackbar(
                          context,
                          'Bank account successfully deleted',
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,

                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.primaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
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
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(100,
                            50), // Set width to 100 and height to 50 // Set width and height
                        primary: color.AppColor.secondaryDeleteButton_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the border radius
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
          ],
        ),
      );
    },
  );
}
