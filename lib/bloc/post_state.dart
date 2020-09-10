part of 'post_bloc.dart';
// import 'package:user_loading_bloc/models/photos.dart';

@immutable
abstract class PostState {}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  List<dynamic> loadedPost;
  LoadedPostState({@required this.loadedPost}) : assert(loadedPost != null);
}

class ErrorPostState extends PostState {}

class EmptyPostState extends PostState {}

class LoadedPhotoState extends PostState {
  Photos loadedPhotos;
  LoadedPhotoState({@required this.loadedPhotos}) : assert(loadedPhotos != null);
}