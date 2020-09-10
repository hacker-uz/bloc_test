part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostLoadEvent extends PostEvent {}

class PostClearEvent extends PostEvent {}

class PhotoLoadEvent extends PostEvent {
  int id;
  PhotoLoadEvent({@required this.id}) : assert(id != null);
}