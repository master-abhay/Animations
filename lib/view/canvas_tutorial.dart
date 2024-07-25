//
// import 'dart:ui' as ui;
// import 'dart:ui';
//
//
// import 'package:flutter/material.dart';
//
// class CanvasGuideView extends StatefulWidget {
//   const CanvasGuideView({super.key});
//
//   @override
//   State<CanvasGuideView> createState() => _CanvasGuideViewState();
// }
//
// class _CanvasGuideViewState extends State<CanvasGuideView> {
//   ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);
//
//   getImage() async {
//     NetworkImage networkImage = const NetworkImage(
//         "https://images.unsplash.com/photo-1497290756760-23ac55edf36f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
//     ImageStream imageStream = networkImage.resolve(ImageConfiguration.empty);
//     ImageStreamListener imageStreamListener =
//         ImageStreamListener((imageInfo, synchronousCall) {
//       imageNotifier.value = imageInfo.image;
//     });
//     imageStream.addListener(imageStreamListener);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getImage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _builUI(),
//     );
//   }
//
//   Widget _builUI() {
//     return Center(
//       child: Container(
//         color: Colors.grey.shade400,
//         child: CustomPaint(
//           painter: myPaint(imageInfoNotifier: imageNotifier),
//           size: const Size(300, 400),
//         ),
//       ),
//     );
//   }
// }
//
//
// class myPaint extends CustomPainter{
//
// }
//
//
//
// // class myPaint extends CustomPainter {
// //   final ValueNotifier<ui.Image?> imageInfoNotifier;
// //
// //   myPaint({required this.imageInfoNotifier})
// //       : super(repaint: imageInfoNotifier);
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     Paint paint = Paint()
// //       ..strokeWidth = 2
// //       ..color = Colors.black
// //       ..style = PaintingStyle.fill;
// //     // ..shader = ui.Gradient.linear(
// //     //   Offset(size.width / 2, 0),
// //     //   Offset(size.width / 2, size.height),
// //     //   [Colors.purple, Colors.green],
// //     // );
// //
// //     //writing on canvas:
// //     //paragraph style:
// //
// //
// //
// //
// //     // //add Shadow to items in canvas:
// //     // Path path = Path()
// //     //   ..addOval(Rect.fromCenter(
// //     //       center: Offset(size.width / 2, size.height / 2),
// //     //       width: size.width / 3,
// //     //       height: size.height / 2))
// //     //   ..close();
// //     //
// //     // canvas.drawShadow(path, Colors.yellowAccent, 10, false);
// //     //
// //     // canvas.drawPath(path,paint);
// //
// //     // canvas.clipRect(Offset.zero & size);
// //     // canvas.drawPaint(paint);
// //
// //     // //Draw image on canvas:
// //     // ui.Image? image = imageInfoNotifier.value;
// //     //
// //     // Size imageSize = Size(image!.width.toDouble(), image.height.toDouble());
// //     // Rect imageRect = Offset.zero & imageSize;
// //     // Rect canvasRect = Offset.zero & size;
// //     //
// //     // canvas.drawImageRect(image, imageRect, canvasRect, paint);
// //
// //     // paint.strokeWidth = 2;
// //     // paint.color = Colors.black;
// //     // paint.style = PaintingStyle.fill;
// //     // Offset center = Offset(size.width / 2, size.height / 2);
// //     // double width = size.width;
// //     // double height = size.height;
// //
// //     // //Draw Line:
// //     // canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), paint);
// //
// //     // //Draw Circle:
// //     // canvas.drawCircle(center, 50, paint);
// //
// //     // //Draw Rectangle:
// //     // canvas.drawRect(Rect.fromCenter(center: center, width: width/2, height: height/2), paint);
// //     // canvas.drawRect(Rect.fromCircle(center: center, radius: 100), paint);
// //     // canvas.drawRect(Rect.fromLTRB(10, 10, 100, 200), paint); // it subtract the value from left right as son on then draw the shape.
// //     // canvas.drawRect(const Rect.fromLTWH(10, 10, 100, 200), paint); // Takes marigin from left and top and width and height for rectangle.
// //
// //     // //draw Oval:
// //     // canvas.drawOval(Rect.fromLTRB(10,10,100,200), paint);
// //
// //     ////draw rounded rectangle:
// //     // canvas.drawRRect(
// //     //     RRect.fromRectAndRadius(
// //     //         Rect.fromCircle(center: center, radius: 100),const Radius.circular(20)),
// //     //     paint);
// //
// //     // Rect rect = Rect.fromLTRB(50,50,100,300);
// //
// //     // canvas.drawRRect(
// //     //     RRect.fromRectAndCorners(rect,
// //     //         topLeft: const Radius.circular(10),
// //     //         bottomRight: const Radius.circular(10)),
// //     //     paint); //to give radius to specific corner.
// //
// //     // canvas.drawRRect(
// //     //     RRect.fromRectXY(rect, 50, 50),
// //     //     paint); //giving corners from x and y axis
// //
// //     //to draw difference of two rectangles:
// //
// //     // Rect bigRect = Rect.fromLTRB(10, 20, 100, 200);
// //     // Rect smallRect = Rect.fromLTRB(20, 30, 100, 180);
// //     //
// //     // RRect bigRRect = RRect.fromRectXY(bigRect, 75, 25);
// //     // RRect smallRRect = RRect.fromRectXY(smallRect, 75, 25);
// //     //
// //     // canvas.drawDRRect(bigRRect, smallRRect, paint);
// //
// //     // canvas.clipRect(Offset.zero & size);
// //     // canvas.drawColor(Colors.indigo, BlendMode.src);
// //
// //     ////To draw gradient and fill only the canvas we use clipRect i.e. below mentioned..
// //     // canvas.clipRect(Offset.zero & size);
// //     // canvas.drawPaint(paint);
// //
// //     ////Plot points on canvas:
// //     // List<Offset> points = [
// //     //   Offset.zero,
// //     //   Offset(size.width, 0),
// //     //   Offset(size.width / 2, size.height / 2),
// //     //   Offset.zero,
// //     // ];
// //
// //     // canvas.drawPoints(PointMode.points, points, paint);
// //     //raw points method..it accepts float32 list
// //
// //     // error in this  don't know why
// //     // var point = Float32List.fromList([
// //     //   0, 0,
// //     //   size.width, 0,
// //     //   size.width / 2, size.height / 2,
// //     //   0, size.height // Added missing y-coordinate
// //     // ]);
// //     //
// //     // canvas.drawRawPoints(PointMode.polygon, point, paint);
// //
// //
// //   }
// //
// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return true;
// //   }
// //
// // }