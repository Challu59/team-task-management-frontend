import '../../core/api_client.dart';
import 'team_model.dart';
import 'dart:convert';

class TeamService {
  static Future<List<Team>> getTeams() async {
    final response = await ApiClient.get('/teams/');

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Team.fromJson(json)).toList();
    }

    throw Exception('Failed to load teams');
  }
}
