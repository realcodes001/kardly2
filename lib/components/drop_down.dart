import 'package:flutter/material.dart';
import 'package:kardly/components/modal_dropdown.dart';

void showAccountSelectionModal(BuildContext context, List<String> accounts,
    String? selectedAccount, Function(String) onAccountSelected) async {
  final result = await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), // Rounded top-left corner
        topRight: Radius.circular(20), // Rounded top-right corner
      ),
    ),
    builder: (BuildContext context) {
      return CustomModalDropdown(
        items: accounts,
        selectedValue: selectedAccount,
      );
    },
  );

  if (result != null && result is String) {
    onAccountSelected(result); // Call the callback with the selected account
  }
}
