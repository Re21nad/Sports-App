import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse('https://api.example.com/teams'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Team.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load teams');
    }
  }
}

class Team {
  final String name;
  final String logoUrl;

  Team({required this.name, required this.logoUrl});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      logoUrl: json['logoUrl'],
    );
  }
}
