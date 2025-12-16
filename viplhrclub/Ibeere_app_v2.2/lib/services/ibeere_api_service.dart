import 'dart:convert';
import 'package:http/http.dart' as http;

class IbeereApiService {
  static const String baseUrl = 'https://api.ibeere.fun/api';
  
  static Future<List<dynamic>?> getCategories({String? languageId}) async {
    try {
      final uri = Uri.parse('$baseUrl/get_categories');
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      
      final body = {
        if (languageId != null) 'language_id': languageId,
      };
      
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == false) {
          return data['data'] as List<dynamic>?;
        }
      }
      
      return null;
    } catch (e) {
      print('Error fetching categories: $e');
      return null;
    }
  }
  
  static Future<Map<String, dynamic>?> getQuestions({
    String? categoryId,
    String? languageId,
    int? limit,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/get_questions');
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      
      final body = {
        if (categoryId != null) 'category': categoryId,
        if (languageId != null) 'language_id': languageId,
        if (limit != null) 'limit': limit.toString(),
      };
      
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == false) {
          return data;
        }
      }
      
      return null;
    } catch (e) {
      print('Error fetching questions: $e');
      return null;
    }
  }
  
  static Future<Map<String, dynamic>?> getUserStatistics({
    required String userId,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/get_user_statistics');
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      
      final body = {
        'user_id': userId,
      };
      
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == false) {
          return data['data'];
        }
      }
      
      return null;
    } catch (e) {
      print('Error fetching user statistics: $e');
      return null;
    }
  }
  
  static Future<Map<String, dynamic>?> getLeaderboard({
    String? languageId,
    String? type,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/get_leaderboard');
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      
      final body = {
        if (languageId != null) 'language_id': languageId,
        if (type != null) 'type': type,
      };
      
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['error'] == false) {
          return data;
        }
      }
      
      return null;
    } catch (e) {
      print('Error fetching leaderboard: $e');
      return null;
    }
  }
}
