import 'package:example_1_animations/view/Animations/eg_1.dart';
import 'package:example_1_animations/view/Assets%20and%20Media/video_player_screen.dart';
import 'package:example_1_animations/view/Navigations/navigations.dart';
import 'package:example_1_animations/view/canvas_tutorial.dart';
import 'package:example_1_animations/view/example_animation_2.dart';
import 'package:example_1_animations/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Eg1(),
    );
  }
}


