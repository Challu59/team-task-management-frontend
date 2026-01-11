import '../../core/api_client.dart';
import '../../core/auth_storage.dart';
import 'dart:convert';

class AuthService {
  static Future<bool> login(String email, String password) async {
    final response = await ApiClient.post(
      '/token/',
      {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      await AuthStorage.saveTokens(
        access: data['access'],
        refresh: data['refresh'],
      );
      return true;
    }
    return false;
  }

  static Future<void> logout() async {
    await AuthStorage.clear();
  }
}
