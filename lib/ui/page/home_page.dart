import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_loading_bloc/bloc/post_bloc.dart';
import 'package:user_loading_bloc/services/post_repository.dart';
import 'package:user_loading_bloc/ui/widgets/buttons.dart';

import '../widgets/posts.dart';

class MyHomePage extends StatelessWidget {
  final postsRepository = PostsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (context) => PostBloc(postsRepository: postsRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Posts(),
        floatingActionButton: Buttons(),
      ),
    );
  }
}
