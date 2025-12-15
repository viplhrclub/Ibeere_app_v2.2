import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutterquiz/core/config/config.dart';
import 'package:flutterquiz/utils/api_utils.dart';

class MiniGameService {
  static Future<bool> submitGameScore({
    required String gameId,
    required int score,
    required String userId,
  }) async {
    try {
      final headers = await ApiUtils.getHeaders();
      headers['Content-Type'] = 'application/json';

      final response = await http.post(
        Uri.parse('$panelUrl/api/mini-game/submit-score'),
        headers: headers,
        body: jsonEncode({
          'game_id': gameId,
          'score': score,
          'user_id': userId,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      log(name: 'Mini Game Score', 'Response: ${response.statusCode}');
      log(name: 'Mini Game Score', 'Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['success'] == true;
      }
      return false;
    } catch (e) {
      log(name: 'Mini Game Score Error', e.toString());
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getGameLeaderboard({
    required String gameId,
    int limit = 10,
  }) async {
    try {
      final headers = await ApiUtils.getHeaders();

      final response = await http.get(
        Uri.parse('$panelUrl/api/mini-game/leaderboard/$gameId?limit=$limit'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      log(name: 'Game Leaderboard Error', e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getUserGameStats({
    required String userId,
  }) async {
    try {
      final headers = await ApiUtils.getHeaders();

      final response = await http.get(
        Uri.parse('$panelUrl/api/mini-game/user-stats/$userId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      log(name: 'User Game Stats Error', e.toString());
      return null;
    }
  }

  static int calculateKaurisFromScore(int score) {
    return (score / 10).round();
  }
}
