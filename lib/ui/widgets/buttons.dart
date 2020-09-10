import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_loading_bloc/bloc/post_bloc.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            postBloc.add(PostLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            postBloc.add(PostClearEvent());
          },
          color: Colors.red,
        ),
      ],
    );
  }
}
