import 'package:flutter/material.dart';
import 'package:kardly/service/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider with ChangeNotifier {
  String? selectedAccount;
  String? savedAccountName;
  String? savedAccountNumber;

  final AccountService _accountService = AccountService();

  Future<void> loadAccount() async {
    final prefs = await SharedPreferences.getInstance();
    savedAccountName = prefs.getString('accountName'); // Load saved name
    savedAccountNumber = prefs.getString('accountNumber'); // Load saved number

    // If an account is already saved, set it as the selected account
    if (savedAccountName != null) {
      selectedAccount = savedAccountName;
    }
    notifyListeners(); // Update the UI
  }

  Future<void> saveAccount(String accountName, String accountNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountName', accountName);
    await prefs.setString('accountNumber', accountNumber);

    // Update local state and notify listeners
    savedAccountName = accountName;
    savedAccountNumber = accountNumber;
    selectedAccount = accountName;
    notifyListeners();
  }

  void selectAccount(String account) {
    selectedAccount = account;
    notifyListeners();
  }
}
