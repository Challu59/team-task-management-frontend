import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_storage.dart';

class ApiClient{
 static const String baseUrl = 'http://127.0.0.1:8000/api';

 static Future<http.Response> get(String endpoint) async{
   final token = await AuthStorage.getAccessToken();
   return http.get(
   Uri.parse('$baseUrl$endpoint'),
     headers: {'Content-Type': 'Application/json',
       if (token != null)
         'Authorization': 'Bearer $token'}
   );
 }

 static Future<http.Response> post(String endpoint, Map<String, dynamic>body,) async{
   final token = await AuthStorage.getAccessToken();
   return http.post(
     Uri.parse('$baseUrl$token'),
     headers: {
       'Content-Type' : 'Application/json',
       if(token != null)
         'Authorization': 'Bearer $token',
     },
     body : jsonEncode(body),
   );
}
}