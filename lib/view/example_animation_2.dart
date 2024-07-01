import 'package:flutter/material.dart';

class ExampleAnimation2 extends StatefulWidget {
  const ExampleAnimation2({super.key});

  @override
  State<ExampleAnimation2> createState() => _ExampleAnimation2State();
}

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }

}


class HalfCustomClipper extends CustomClipper<Path>{


  final CircleSide circleSide;
  HalfCustomClipper({required this.circleSide});
  @override
  Path getClip(Size size) => circleSide.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>  true;

}

class _ExampleAnimation2State extends State<ExampleAnimation2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: HalfCustomClipper(circleSide: CircleSide.left),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blueAccent,
              ),
            ),
            ClipPath(
              clipper: HalfCustomClipper(circleSide: CircleSide.right),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellowAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
