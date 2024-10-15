import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kardly/provider/account_provider.dart';
import 'package:provider/provider.dart';

class InstitutionSheetViewModel extends ChangeNotifier {
  String selectedBank = 'Select a Bank';
  String accountNumber = '';
  String accountName = '';
  bool isLoading = false;
  bool isSaveButtonActive = false;

  List<Map<String, String>> banks = [
    {'name': 'Select a Bank', 'code': ''},
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
  ];

  Future<Map<String, dynamic>?> verifyAccount(
      String accountNumber, String bankCode) async {
    String paystackSecretKey =
        'sk_live_ec2248ec521e535271bee70e7b71a5468b131cbb';
    String url = 'https://api.paystack.co/bank/resolve';

    try {
      final response = await http.get(
        Uri.parse('$url?account_number=$accountNumber&bank_code=$bankCode'),
        headers: {'Authorization': 'Bearer $paystackSecretKey'},
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
      BuildContext context, AccountProvider provider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountNumber', accountNumber);
    await prefs.setString('accountName', accountName);
    await prefs.setString('bankName', selectedBank);

    // Update provider with saved details
    provider.selectAccount(accountName);
  }
}
