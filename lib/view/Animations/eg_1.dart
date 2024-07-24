import 'package:flutter/material.dart';
//
// class Eg1 extends StatefulWidget {
//   const Eg1({super.key});
//
//   @override
//   State<Eg1> createState() => _Eg1State();
// }
//
// class _Eg1State extends State<Eg1> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation _animation;
//
//   @override
//   void initState() {
//     _animationController =
//         AnimationController(duration: const Duration(seconds: 1), vsync: this);
//     _animation = Tween<double>(begin: 0, end: 300).animate(_animationController)
//           ..addStatusListener((status) {
//             if (status == AnimationStatus.completed) {
//               _animationController.reverse();
//             }
//             if (status == AnimationStatus.dismissed) {
//               _animationController.forward();
//             }
//           })
//           ..addStatusListener((status) => debugPrint(status.toString()))
//         // ..addListener(() {
//         //   setState(() {});
//         // })
//         ;
//     _animationController.forward();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: AnimatedBuilder(
//         animation: _animation,
//         builder: (context, child) {
//           return Container(
//             color: Colors.green,
//             height: _animation.value,
//             child: child,
//           );
//         },
//       )),
//     );
//   }
// }
class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}