import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/components/custom_instiution_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kardly/components/custom_snackbar.dart';

void showInstitutionsSheet(BuildContext context) {
  String selectedBank = 'Select a Bank';
  String accountNumber = '';
  String accountName = '';
  bool isLoading = false;
  bool isSaveButtonActive = false; // Initially, the button is inactive

  // List of Nigerian banks with their respective codes
  List<Map<String, String>> banks = [
    {'name': 'Select a Bank', 'code': ''}, // Default option
    {'name': 'Access Bank', 'code': '044'},
    {'name': 'First Bank of Nigeria', 'code': '011'},
    {'name': 'Guaranty Trust Bank', 'code': '058'},
    {'name': 'United Bank for Africa', 'code': '033'},
    {'name': 'Zenith Bank', 'code': '057'},
    {'name': 'Fidelity Bank', 'code': '070'},
    {'name': 'Union Bank', 'code': '032'},
    {'name': 'Polaris Bank', 'code': '076'},
    {'name': 'Keystone Bank', 'code': '082'},
    {'name': 'Stanbic IBTC Bank', 'code': '221'},
    // Add more banks with their codes as needed
  ];

  Future<Map<String, dynamic>?> verifyAccount(
      String accountNumber, String bankCode) async {
    String paystackSecretKey =
        'sk_live_ec2248ec521e535271bee70e7b71a5468b131cbb'; // Replace with your Paystack Secret Key
    String url = 'https://api.paystack.co/bank/resolve';

    try {
      final response = await http.get(
        Uri.parse('$url?account_number=$accountNumber&bank_code=$bankCode'),
        headers: {
          'Authorization': 'Bearer $paystackSecretKey',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        print('Failed to verify account. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error verifying account: $error');
      return null;
    }
  }

  Future<void> saveAccountDetails(
      String accountNumber, String accountName, String bankName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountNumber', accountNumber);
    await prefs.setString('accountName', accountName);
    await prefs.setString('bankName', bankName);
  }

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const Text(
                          'Add Bank',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'BricolageGrotesque Bold',
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Add account where you would like to receive your funds',
                          style: TextStyle(
                            fontSize: 12,
                            color: color.AppColor.subtitle,
                            fontFamily: 'BricolageGrotesque Light',
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Account Number',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'BricolageGrotesque Regular',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 232, 232, 232),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: color.AppColor.mainBtn_color2,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Enter your account number',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'BricolageGrotesque Regular',
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              accountNumber = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Select Bank',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'BricolageGrotesque Regular',
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Use the CustomBankDropdown here
                        CustomBankDropdown(
                          selectedBank: selectedBank,
                          banks: banks,
                          onBankSelected: (String bankName) {
                            setState(() {
                              selectedBank = bankName;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: accountNumber.isNotEmpty &&
                                  selectedBank != 'Select a Bank'
                              ? () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  // Fetch the selected bank's code
                                  String? bankCode = banks.firstWhere((bank) =>
                                      bank['name'] == selectedBank)['code'];

                                  // Call the verifyAccount function
                                  if (bankCode != null && bankCode.isNotEmpty) {
                                    Map<String, dynamic>? result =
                                        await verifyAccount(
                                            accountNumber, bankCode);

                                    if (result != null &&
                                        result['status'] == true) {
                                      setState(() {
                                        accountName =
                                            result['data']['account_name'];
                                        isSaveButtonActive =
                                            true; // Enable save button
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        accountName = 'Account not found';
                                        isSaveButtonActive =
                                            false; // Disable save button
                                        isLoading = false;
                                      });
                                    }
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size(150,
                                40), // Set width to 100 and height to 50 // Set width and height
                            primary: color.AppColor.secondary_color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Set the border radius
                            ),
                          ),
                          child: isLoading
                              ? Container(
                                  width: 10,
                                  height: 10,
                                  child: CircularProgressIndicator(
                                    color: color.AppColor.mainBtn_color,
                                    strokeWidth: 1,
                                  ),
                                )
                              : Text(
                                  'Search Account',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BricolageGrotesque Regular',
                                    color: color.AppColor.mainBtn_color,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 20),
                        // if (accountName.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: color.AppColor.lightgray)),
                              child: Text(
                                'Account Name: $accountName',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'BricolageGrotesque Regular',
                                  color: color.AppColor.subtitle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: isSaveButtonActive
                                  ? () async {
                                      // Save the account details to shared preferences
                                      await saveAccountDetails(
                                        accountNumber,
                                        accountName,
                                        selectedBank,
                                      );

                                      CustomSnackbar.showTopSnackbar(
                                        context,
                                        'Bank account successfully added',
                                      );

                                      Navigator.pop(context);
                                    }
                                  : null, // Keep button visible, but disable when inactive
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: const Size(double.infinity,
                                    60), // Set width to 100 and height to 50 // Set width and height
                                primary: color.AppColor.mainBtn_color2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the border radius
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
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
