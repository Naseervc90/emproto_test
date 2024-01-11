import 'package:emproto_test/emproto_test_2/data/models/post.dart';
import 'package:emproto_test/emproto_test_2/data/repositories/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await postRepository.fetchPosts();
        emit(PostLoaded(posts: posts));
      } catch (e) {
        emit(PostError(message: 'Failed to load posts'));
      }
    });
  }
}
