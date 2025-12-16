import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutterquiz/core/config/config.dart';

class BackendIntegrationTest {
  static const String accessKey = '8525';

  static Future<void> runAllTests() async {
    log('=== Starting Backend Integration Tests ===');
    
    await testSystemConfigurations();
    await testLanguages();
    await testCategories();
    
    log('=== All Tests Complete ===');
  }

  static Future<void> testSystemConfigurations() async {
    try {
      final response = await http.post(
        Uri.parse('$panelUrl/api/get_system_configurations'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'access_key': accessKey}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] == false) {
          log('✅ System Configurations: SUCCESS');
          log('Timezone: ${data['data']['system_timezone']}');
          log('Refer Coin: ${data['data']['refer_coin']}');
          log('App Version: ${data['data']['app_version']}');
        } else {
          log('❌ System Configurations: ERROR - ${data['message']}');
        }
      } else {
        log('❌ System Configurations: HTTP ${response.statusCode}');
      }
    } catch (e) {
      log('❌ System Configurations: Exception - $e');
    }
  }

  static Future<void> testLanguages() async {
    try {
      final response = await http.post(
        Uri.parse('$panelUrl/api/get_languages'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'access_key': accessKey}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] == false) {
          final languages = data['data'] as List;
          log('✅ Languages: SUCCESS (${languages.length} languages)');
          for (var lang in languages) {
            log('  - ${lang['language']} (${lang['code']})');
          }
        } else {
          log('❌ Languages: ERROR - ${data['message']}');
        }
      } else {
        log('❌ Languages: HTTP ${response.statusCode}');
      }
    } catch (e) {
      log('❌ Languages: Exception - $e');
    }
  }

  static Future<void> testCategories() async {
    try {
      final response = await http.post(
        Uri.parse('$panelUrl/api/get_categories'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'access_key': accessKey,
          'language_id': '18',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] == false) {
          final categories = data['data'] as List;
          log('✅ Categories: SUCCESS (${categories.length} categories)');
          for (var cat in categories.take(5)) {
            log('  - ${cat['category_name']}');
          }
        } else {
          log('❌ Categories: ERROR - ${data['message']}');
        }
      } else {
        log('❌ Categories: HTTP ${response.statusCode}');
      }
    } catch (e) {
      log('❌ Categories: Exception - $e');
    }
  }

  static Future<Map<String, dynamic>?> getSystemConfig() async {
    try {
      final response = await http.post(
        Uri.parse('$panelUrl/api/get_system_configurations'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'access_key': accessKey}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] == false) {
          return data['data'];
        }
      }
    } catch (e) {
      log('Error fetching system config: $e');
    }
    return null;
  }

  static Future<List<dynamic>?> getLanguages() async {
    try {
      final response = await http.post(
        Uri.parse('$panelUrl/api/get_languages'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'access_key': accessKey}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] == false) {
          return data['data'];
        }
      }
    } catch (e) {
      log('Error fetching languages: $e');
    }
    return null;
  }

  static Future<List<dynamic>?> getCategories(String languageId) async {
    try {
      final response = await http.post(
        Uri.parse('$panelUrl/api/get_categories'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'access_key': accessKey,
          'language_id': languageId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error'] == false) {
          return data['data'];
        }
      }
    } catch (e) {
      log('Error fetching categories: $e');
    }
    return null;
  }
}
