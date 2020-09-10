import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_loading_bloc/bloc/post_bloc.dart';
import 'package:user_loading_bloc/ui/page/second_page.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is EmptyPostState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is LoadingPostState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is LoadedPostState) {
          return ListView.builder(
            itemCount: state.loadedPost.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  postBloc
                      .add((PhotoLoadEvent(id: state.loadedPost[index].id)));
                },
                child: Row(
                  children: [
                    Text(
                      "ID ${state.loadedPost[index].id}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Title: ${state.loadedPost[index].title}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Body ${state.loadedPost[index].body}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }

        if (state is LoadedPhotoState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(),
            ),
          );
          print("line 75 $state");
        }

        if (state is ErrorPostState) {
          return Center(
            child: Text(
              'Error fetching Posts',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        return Text("Line 87 $state");
      },
    );
  }
}
