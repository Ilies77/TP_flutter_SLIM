import 'dart:convert';
import 'package:http/http.dart' as http;

class TagService {
  final String apiUrl = 'https://example.com/tags';

  Future<List<String>> fetchTags() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((tag) => tag.toString()).toList();
    } else {
      throw Exception('Failed to load tags');
    }
  }
}
