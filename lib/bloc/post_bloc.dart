import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_loading_bloc/models/photos.dart';
import 'package:user_loading_bloc/models/post.dart';
import 'package:user_loading_bloc/services/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository postsRepository;

  PostBloc({this.postsRepository}) : super(EmptyPostState());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if(event is PostLoadEvent) {
      yield LoadingPostState();
      try {
        final List<Post> _loadedPostList = await postsRepository.getAllPost();
        yield LoadedPostState(loadedPost: _loadedPostList);
      } catch (e) {
        print(e);
        yield ErrorPostState();
      }
    }
    if(event is PostClearEvent) {
      yield EmptyPostState();
    }
    if(event is PhotoLoadEvent) {
      print("line 35 $event");
      yield LoadingPostState();
      try {
        final Photos _loadedPhoto = await postsRepository.getPhoto(event.id);
        yield LoadedPhotoState(loadedPhotos: _loadedPhoto);
      } catch (e) {
        print("line 41 $e");
        EmptyPostState();
      }
    }
  }
}
