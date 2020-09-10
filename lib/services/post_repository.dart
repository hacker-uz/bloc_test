import 'package:user_loading_bloc/models/photos.dart';
import 'package:user_loading_bloc/models/post.dart';
import 'package:user_loading_bloc/services/post_api_provider.dart';

class PostsRepository {
  PostProvider _postProvider = PostProvider();
  Future<List<Post>> getAllPost() => _postProvider.getPost();

  Future getPhoto(int id) => _postProvider.getPhotos(id);
}