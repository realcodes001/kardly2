import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/components/custom_instiution_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kardly/components/custom_snackbar.dart';
import 'package:kardly/provider/add_institution.dart';
import 'package:kardly/provider/account_provider.dart';

void showInstitutionsSheet(BuildContext context) {
  final viewModel = InstitutionSheetViewModel();
  final provider = Provider.of<AccountProvider>(context, listen: false);

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
                        _buildHeader(),
                        const SizedBox(height: 40),
                        Text(
                          'Account Number',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'BricolageGrotesque Regular',
                            color: color.AppColor.black,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        _buildAccountNumberField(viewModel, setState),
                        const SizedBox(height: 20),
                        Text(
                          'Bank',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'BricolageGrotesque Regular',
                            color: color.AppColor.black,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        _buildBankDropdown(viewModel, setState),
                        const SizedBox(height: 20),
                        _buildSearchButton(viewModel, setState),
                        const SizedBox(height: 20),
                        _buildAccountNameDisplay(viewModel),
                        const SizedBox(height: 20),
                        _buildSaveButton(viewModel, provider, context),
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

Widget _buildHeader() {
  return Column(
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
      const Text(
        'Add account where you would like to receive your funds',
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'BricolageGrotesque Light',
        ),
      ),
    ],
  );
}

Widget _buildAccountNumberField(
    InstitutionSheetViewModel viewModel, StateSetter setState) {
  return TextField(
    style: TextStyle(
        fontSize: 12,
        fontFamily: 'BricolageGrotesque Regular',
        color: color.AppColor.black),
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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
    onChanged: (value) {
      setState(() {
        viewModel.accountNumber = value;
      });
    },
  );
}

Widget _buildBankDropdown(
    InstitutionSheetViewModel viewModel, StateSetter setState) {
  return CustomBankDropdown(
    selectedBank: viewModel.selectedBank,
    banks: viewModel.banks,
    onBankSelected: (String bankName) {
      setState(() {
        viewModel.selectedBank = bankName;
      });
    },
  );
}

Widget _buildSearchButton(
    InstitutionSheetViewModel viewModel, StateSetter setState) {
  return ElevatedButton(
    onPressed: viewModel.accountNumber.isNotEmpty &&
            viewModel.selectedBank != 'Select a Bank'
        ? () async {
            setState(() => viewModel.isLoading = true);
            String? bankCode = viewModel.banks.firstWhere(
                (bank) => bank['name'] == viewModel.selectedBank)['code'];

            if (bankCode != null) {
              final result = await viewModel.verifyAccount(
                  viewModel.accountNumber, bankCode);

              if (result != null && result['status'] == true) {
                setState(() {
                  viewModel.accountName = result['data']['account_name'];
                  viewModel.isSaveButtonActive = true;
                  viewModel.isLoading = false;
                });
              } else {
                setState(() {
                  viewModel.accountName = 'Account not found';
                  viewModel.isSaveButtonActive = false;
                  viewModel.isLoading = false;
                });
              }
            }
          }
        : null,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(
          100, 40), // Set width to 100 and height to 50 // Set width and height
      primary: color.AppColor.secondary_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
    ),
    child: viewModel.isLoading
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
  );
}

Widget _buildAccountNameDisplay(InstitutionSheetViewModel viewModel) {
  return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: color.AppColor.lightgray)),
      child: Text(
        'Account Name: ${viewModel.accountName}',
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'BricolageGrotesque Light',
          color: color.AppColor.subtitle,
        ),
      ));
}

Widget _buildSaveButton(InstitutionSheetViewModel viewModel,
    AccountProvider provider, BuildContext context) {
  return ElevatedButton(
    onPressed: viewModel.isSaveButtonActive
        ? () async {
            await viewModel.saveAccountDetails(context, provider);
            await provider
                .loadAccount(); // Refresh the provider state after saving
            Navigator.pop(context);
          }
        : null,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(double.infinity,
          60), // Set width to 100 and height to 50 // Set width and height
      primary: color.AppColor.mainBtn_color2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Set the border radius
      ),
    ),
    child: const Text('Add Bank'),
  );
}
