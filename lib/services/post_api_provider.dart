import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_loading_bloc/models/photos.dart';
import 'package:user_loading_bloc/models/post.dart';

class PostProvider {

  Future<List<Post>> getPost() async {
    final response = await http.get('http://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      final List<dynamic> postJson = json.decode(response.body);
      return postJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching posts');
    }
  }

  Future getPhotos(int id) async {
    final response = await http.get('http://jsonplaceholder.typicode.com/photos/$id');
    if(response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      final photos = Photos.fromJson(jsonData);
      return photos;
    }
  }
}