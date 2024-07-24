import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  bool isBigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.bounceInOut,

            width: isBigger ? 300 : 200,
            height:isBigger ? 300 : 200,
            color: Colors.blue,
          ),
          IconButton(
              onPressed: () {
                isBigger = !isBigger;
              setState(() {

              });
              },
              icon: Icon(Icons.add,color: Colors.blue,)
          ),

        ],
      ),
    );
  }
}
