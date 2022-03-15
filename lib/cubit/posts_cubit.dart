import 'package:bloc/bloc.dart';
import 'package:pagination_app/data/models/post.dart';
import 'package:pagination_app/data/repositories/posts_respository.dart';
import 'package:pagination_app/cubit/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.repository) : super(PostsInitial());

  int page = 1;
  final PostsRepository repository;

  void loadPosts() {
    if (state is PostsLoading) return;

    final PostsState currentState = state;

    var oldPosts = <Post>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(PostsLoading(oldPosts));

    repository.fetchPosts().then((newPosts) {
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);

      emit(PostsLoaded(posts));
    });
  }
}
