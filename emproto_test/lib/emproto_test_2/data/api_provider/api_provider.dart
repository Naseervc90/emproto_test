import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String baseUrl;

  ApiProvider(this.baseUrl);

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
