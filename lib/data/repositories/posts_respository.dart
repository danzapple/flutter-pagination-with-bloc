import 'dart:async';

import 'package:pagination_app/data/models/post.dart';
import 'package:pagination_app/data/services/posts_service.dart';

class PostsRepository {
  final PostsService service;

  PostsRepository(this.service);

  Future<List<Post>> fetchPosts() async {
    final posts = await service.fetchPosts();
    return posts!.map((e) => Post.fromJson(e)).toList();
  }
  // Future<List<Post>> fetchPosts(int page) async {
  //   final posts = await service.fetchPosts(page);
  //   return posts.map((e) => Post.fromJson(e)).toList();
  // }
}
