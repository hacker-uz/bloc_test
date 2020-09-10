import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_loading_bloc/bloc/post_bloc.dart';

class PhotoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is EmptyPostState) {
          return Center(
            child: Text(
              'No data ',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is LoadedPostState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is LoadedPhotoState) {
          return Row(
            children: [
              Text(
                "ID ${state.loadedPhotos.id}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Title: ${state.loadedPhotos.title}",
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Image.network(state.loadedPhotos.url),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        if (state is ErrorPostState) {
          return Center(
            child: Text(
              'Error fetching Posts',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return Text("Photos");
      },
    );
  }
}
