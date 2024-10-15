import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InstitutionProvider extends ChangeNotifier {
  String _selectedBank = 'Select a Bank';
  String _accountNumber = '';
  String _accountName = '';
  bool _isLoading = false;
  bool _isSaveButtonActive = false;

  String? _savedAccountNumber;
  String? _savedAccountName;
  String? _savedBankName;

  String get selectedBank => _selectedBank;
  String get accountName => _accountName;
  bool get isLoading => _isLoading;
  bool get isSaveButtonActive => _isSaveButtonActive;
  String? get savedAccountNumber => _savedAccountNumber;
  String? get savedAccountName => _savedAccountName;
  String? get savedBankName => _savedBankName;

  final List<Map<String, String>> banks = [
    {'name': 'Select a Bank', 'code': ''},
    {'name': 'Access Bank', 'code': '044'},
    {'name': 'Citi Bank', 'code': '023'},
    {'name': 'First Bank of Nigeria', 'code': '011'},
    {'name': 'Guaranty Trust Bank', 'code': '058'},
    {'name': 'United Bank for Africa', 'code': '033'},
    {'name': 'Zenith Bank', 'code': '057'},
  ];

  Future<void> loadSavedDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedAccountNumber = prefs.getString('accountNumber');
    _savedAccountName = prefs.getString('accountName');
    _savedBankName = prefs.getString('bankName');
    notifyListeners();
  }

  void setSelectedBank(String bank) {
    _selectedBank = bank;
    notifyListeners();
  }

  void setAccountNumber(String value) {
    _accountNumber = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> verifyAccount(
      String accountNumber, String bankCode) async {
    const String paystackSecretKey =
        'sk_live_ec2248ec521e535271bee70e7b71a5468b131cbb';
    const String url = 'https://api.paystack.co/bank/resolve';

    try {
      final response = await http.get(
        Uri.parse('$url?account_number=$accountNumber&bank_code=$bankCode'),
        headers: {'Authorization': 'Bearer $paystackSecretKey'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to verify account. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error verifying account: $error');
      return null;
    }
  }

  Future<void> searchAccount() async {
    _isLoading = true;
    notifyListeners();

    String? bankCode =
        banks.firstWhere((bank) => bank['name'] == _selectedBank)['code'];

    if (bankCode != null) {
      Map<String, dynamic>? result =
          await verifyAccount(_accountNumber, bankCode);

      if (result != null && result['status'] == true) {
        _accountName = result['data']['account_name'];
        _isSaveButtonActive = true;
      } else {
        _accountName = 'Account not found';
        _isSaveButtonActive = false;
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveAccountDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountNumber', _accountNumber);
    await prefs.setString('accountName', _accountName);
    await prefs.setString('bankName', _selectedBank);

    await loadSavedDetails();
  }

  Future<void> deleteAccountDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accountNumber');
    await prefs.remove('accountName');
    await prefs.remove('bankName');

    _savedAccountNumber = null;
    _savedAccountName = null;
    _savedBankName = null;

    notifyListeners();
  }
}
