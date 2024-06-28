import 'dart:math';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {

    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2 ));
    _animation = Tween(begin: 0.0,end: 2 * pi).animate(_animationController);
    super.initState();
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        title: const Text(
          "Home View",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context,_){
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(_animation.value),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ]),
            ),
          );
        },
      ),
    );
  }
}
