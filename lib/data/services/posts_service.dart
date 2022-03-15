import 'dart:convert';

import 'package:http/http.dart';

class PostsService {
  static const FETCH_LIMIT = 15;
  final baseUrl =
      "https://banyuwangitourism.com/bankdata/notifikasi/getNotifikasi";

  Future<List<dynamic>?> fetchPosts() async {
    try {
      final response = await get(Uri.parse(baseUrl));
      return jsonDecode(response.body) as List<dynamic>?;
    } catch (err) {
      return [];
    }
  }
}
