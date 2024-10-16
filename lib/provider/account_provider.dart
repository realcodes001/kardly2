import 'package:flutter/material.dart';
import 'package:kardly/service/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider with ChangeNotifier {
  String? selectedAccount;
  String? savedAccountName;
  String? savedAccountNumber;
  String? savedBankName; // Add bank name

  final AccountService _accountService = AccountService();

  Future<void> loadAccount() async {
    final prefs = await SharedPreferences.getInstance();
    savedAccountName =
        prefs.getString('accountName'); // Load saved account name
    savedAccountNumber =
        prefs.getString('accountNumber'); // Load saved account number
    savedBankName = prefs.getString('bankName'); // Load saved bank name

    // If an account is already saved, set it as the selected account
    if (savedAccountName != null) {
      selectedAccount = savedAccountName;
    }
    notifyListeners(); // Update the UI
  }

  Future<void> saveAccount(
      String accountName, String accountNumber, String bankName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountName', accountName);
    await prefs.setString('accountNumber', accountNumber);
    await prefs.setString('bankName', bankName); // Save bank name

    // Update local state and notify listeners
    savedAccountName = accountName;
    savedAccountNumber = accountNumber;
    savedBankName = bankName; // Save to local state
    selectedAccount = accountName;
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accountName'); // Remove account name
    await prefs.remove('accountNumber'); // Remove account number
    await prefs.remove('bankName'); // Remove bank name

    // Reset local state and notify listeners
    savedAccountName = null;
    savedAccountNumber = null;
    savedBankName = null; // Clear bank name
    selectedAccount = null;
    notifyListeners(); // Ensure UI is updated
  }

  void selectAccount(String account) {
    selectedAccount = account;
    notifyListeners();
  }
}
