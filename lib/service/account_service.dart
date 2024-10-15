import 'package:shared_preferences/shared_preferences.dart';

class AccountService {
  Future<Map<String, String?>> loadSavedAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accountNumber = prefs.getString('accountNumber');
    String? accountName = prefs.getString('accountName');

    return {'accountNumber': accountNumber, 'accountName': accountName};
  }
}
