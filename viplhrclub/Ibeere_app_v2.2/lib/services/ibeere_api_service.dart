import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutterquiz/core/config/config.dart';

class IbeereApiService {
  static const String _accessKey = '8525';
  static const String _baseUrl = panelUrl;

  static Future<Map<String, dynamic>?> _makeRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final url = Uri.parse('$_baseUrl$endpoint');
      final requestBody = {
        'access_key': _accessKey,
        ...body,
      };

      log('API Request: $endpoint');
      log('Body: ${jsonEncode(requestBody)}');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      ).timeout(Duration(seconds: 30));

      log('API Response Status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('API Response: ${data.toString().substring(0, data.toString().length > 200 ? 200 : data.toString().length)}');
        
        if (data['error'] == false) {
          return data;
        } else {
          log('API Error: ${data['message']}');
          return null;
        }
      } else {
        log('HTTP Error: ${response.statusCode}');
        return null;
      }
    } catch (e, stackTrace) {
      log('Exception in API call: $e');
      log('StackTrace: $stackTrace');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getSystemConfigurations() async {
    final response = await _makeRequest('/api/get_system_configurations', {});
    return response?['data'];
  }

  static Future<List<dynamic>?> getLanguages() async {
    final response = await _makeRequest('/api/get_languages', {});
    return response?['data'];
  }

  static Future<List<dynamic>?> getCategories({
    required String languageId,
    String? userId,
  }) async {
    final response = await _makeRequest('/api/get_categories', {
      'language_id': languageId,
      if (userId != null) 'user_id': userId,
    });
    return response?['data'];
  }

  static Future<Map<String, dynamic>?> getRandomQuestions({
    required String languageId,
    required String categoryId,
    int limit = 10,
  }) async {
    final response = await _makeRequest('/api/get_random_questions', {
      'language_id': languageId,
      'category': categoryId,
      'limit': limit.toString(),
    });
    return response;
  }

  static Future<Map<String, dynamic>?> userSignup({
    required String name,
    required String email,
    String? mobile,
    String? type,
    String? firebaseId,
    String? referCode,
  }) async {
    final response = await _makeRequest('/api/user_signup', {
      'name': name,
      'email': email,
      if (mobile != null) 'mobile': mobile,
      if (type != null) 'type': type,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (referCode != null) 'refer_code': referCode,
    });
    return response?['data'];
  }

  static Future<Map<String, dynamic>?> getUserProfile({
    required String userId,
  }) async {
    final response = await _makeRequest('/api/get_user_by_id', {
      'id': userId,
    });
    return response?['data'];
  }

  static Future<bool> updateUserProfile({
    required String userId,
    String? name,
    String? email,
    String? mobile,
    String? profile,
  }) async {
    final response = await _makeRequest('/api/update_profile', {
      'user_id': userId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (mobile != null) 'mobile': mobile,
      if (profile != null) 'profile': profile,
    });
    return response != null;
  }

  static Future<Map<String, dynamic>?> getUserStatistics({
    required String userId,
  }) async {
    final response = await _makeRequest('/api/get_user_statistics', {
      'user_id': userId,
    });
    return response?['data'];
  }

  static Future<List<dynamic>?> getLeaderboard({
    String? mode,
    int limit = 50,
  }) async {
    final response = await _makeRequest('/api/get_monthly_leaderboard', {
      if (mode != null) 'mode': mode,
      'limit': limit.toString(),
    });
    return response?['data'];
  }

  static Future<List<dynamic>?> getBadges({
    required String userId,
  }) async {
    final response = await _makeRequest('/api/get_user_badges', {
      'user_id': userId,
    });
    return response?['data'];
  }

  static Future<bool> setQuizAnswer({
    required String userId,
    required String questionId,
    required String answer,
  }) async {
    final response = await _makeRequest('/api/set_answers', {
      'user_id': userId,
      'question_id': questionId,
      'answer': answer,
    });
    return response != null;
  }

  static Future<Map<String, dynamic>?> getCoins({
    required String userId,
  }) async {
    final response = await _makeRequest('/api/get_user_coins', {
      'user_id': userId,
    });
    return response?['data'];
  }

  static Future<bool> updateCoins({
    required String userId,
    required int coins,
    required String type,
  }) async {
    final response = await _makeRequest('/api/set_user_coin_score', {
      'user_id': userId,
      'coins': coins.toString(),
      'type': type,
    });
    return response != null;
  }
}
