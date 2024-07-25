import 'package:flutter/material.dart';

class Eg1 extends StatefulWidget {
  const Eg1({super.key});

  @override
  State<Eg1> createState() => _Eg1State();
}

class _Eg1State extends State<Eg1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _animation =  Tween<double>(begin: 255,end: 0).animate(_animationController)..addListener((){
      setState(() {

      });
    });
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: _animation.value,
          width: _animation.value,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
