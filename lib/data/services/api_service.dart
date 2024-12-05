import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surrah_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.alquran.cloud/v1/surah';

  Future<SurrahModel> fetchSurahs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return SurrahModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Surahs');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
