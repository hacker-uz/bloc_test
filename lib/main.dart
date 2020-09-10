import 'package:flutter/material.dart';
import 'package:user_loading_bloc/ui/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Users with Bloc',
      home: MyHomePage(),
    );
  }
}


