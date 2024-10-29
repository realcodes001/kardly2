import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kardly/components/modals/delete_institution_modal.dart';
import 'package:provider/provider.dart';
import 'package:kardly/utils/modals.dart';
import 'package:kardly/components/custom_snackbar.dart';
import 'package:kardly/components/custom_instiution_dropdown.dart';
import 'package:kardly/provider/institutions_provider.dart';
import 'package:kardly/constants/colors.dart' as color;

class Institutions extends StatefulWidget {
  const Institutions({Key? key}) : super(key: key);

  @override
  _InstitutionsState createState() => _InstitutionsState();
}

class _InstitutionsState extends State<Institutions> {
  @override
  void initState() {
    super.initState();
    // Load saved details when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InstitutionProvider>(context, listen: false)
          .loadSavedDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InstitutionProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: color.AppColor.lightgray,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Center(child: Icon(Iconsax.arrow_left)),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Add Bank',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'BricolageGrotesque SemiBold',
                  color: Colors.black,
                ),
              ),
              Text(
                'You can only add one bank account at the moment',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'BricolageGrotesque Light',
                  color: color.AppColor.subtitle,
                ),
              ),
              const SizedBox(height: 40),

              // Saved Details Container
              if (provider.savedAccountNumber != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Bank',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'BricolageGrotesque Regular',
                        color: color.AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${provider.savedAccountNumber}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'BricolageGrotesque Light',
                                        color: color.AppColor.subtitle,
                                      ),
                                    ),
                                    Text(
                                      '${provider.savedAccountName}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'BricolageGrotesque Light',
                                        color: color.AppColor.subtitle,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 236, 236),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        '${provider.savedBankName}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily:
                                              'BricolageGrotesque Regular',
                                          color: color.AppColor.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            deleteInstitutionModal(context);
                          },
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 5, right: 5),
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.delete,
                              size: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 40),

              Text(
                'Account Number',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Regular',
                  color: color.AppColor.black,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {},
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: provider.setAccountNumber,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'BricolageGrotesque Regular',
                    color: color.AppColor.black,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 232, 232, 232),
                          width: 1.5, // Border width
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: color.AppColor.mainBtn_color2,
                          width: 2.0, // Adjust thickness
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Enter your account number',
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'BricolageGrotesque Regular',
                          color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Bank',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Regular',
                  color: color.AppColor.black,
                ),
              ),
              const SizedBox(height: 4),
              CustomBankDropdown(
                selectedBank: provider.selectedBank,
                banks: provider.banks,
                onBankSelected: provider.setSelectedBank,
              ),
              const SizedBox(height: 20),

              // Search Button
              ElevatedButton(
                onPressed:
                    provider.isLoading ? null : () => provider.searchAccount(),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(100, 40),
                  primary: color.AppColor.secondary_color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: provider.isLoading
                    ? Container(
                        width: 10,
                        height: 10,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        ))
                    : Text(
                        'Search Account',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'BricolageGrotesque Regular',
                          color: color.AppColor.mainBtn_color2,
                        ),
                      ),
              ),
              const SizedBox(height: 20),

              // Display Account Name
              if (provider.accountName.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: color.AppColor.lightgray)),
                  child: Text(
                    'Account Name: ${provider.accountName}',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'BricolageGrotesque Light',
                      color: color.AppColor.subtitle,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // Save Button
              ElevatedButton(
                onPressed: provider.isSaveButtonActive
                    ? () async {
                        await provider.saveAccountDetails();
                        CustomSnackbar.showTopSnackbar(
                          context,
                          'Bank account successfully added',
                        );
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 60),
                  primary: color.AppColor.mainBtn_color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Add Bank',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'BricolageGrotesque Light',
                    color: color.AppColor.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
