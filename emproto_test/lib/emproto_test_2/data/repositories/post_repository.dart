import 'dart:convert';
import 'package:emproto_test/emproto_test_2/data/models/post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final http.Client apiClient;

  PostRepository({required this.apiClient});

  Future<List<Post>> fetchPosts() async {
    final response = await apiClient.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
